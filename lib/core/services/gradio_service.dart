import 'dart:convert';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';

class GradioService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  Future<void> sendMessageToGradio(String message) async {
    try {
      final eventId = await _getEventId(message);
      if (eventId == null) {
        developer.log('Failed to get event ID');
        return;
      }

      await _listenToEventStream(eventId);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<String?> _getEventId(String message) async {
    try {
      final response = await _dio.post(
        'https://baher-hamada-final-project.hf.space/gradio_api/call/predict',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "data": [message],
        },
      );

      final eventId = response.data["event_id"] as String?;
      developer.log('Event ID: $eventId');
      return eventId;
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<void> _listenToEventStream(String eventId) async {
    try {
      final response = await _dio.get(
        'https://baher-hamada-final-project.hf.space/gradio_api/call/predict/$eventId',
        options: Options(responseType: ResponseType.stream),
      );

      String buffer = '';
      await for (var chunk in response.data.stream) {
        final data = String.fromCharCodes(chunk);
        buffer += data;
        developer.log('Stream Chunk: $data');

        final messages = buffer.split('\n\n');
        buffer = messages.last;

        for (var message in messages.sublist(0, messages.length - 1)) {
          _handleSseMessage(message);
        }
      }
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleSseMessage(String message) {
    final lines = message.split('\n');
    String? eventType;
    String? eventData;

    for (var line in lines) {
      if (line.startsWith('event: ')) {
        eventType = line.substring(7).trim();
      } else if (line.startsWith('data: ')) {
        eventData = line.substring(6).trim();
      }
    }

    if (eventType != null && eventData != null) {
      developer.log('Event: $eventType, Data: $eventData');

      switch (eventType) {
        case 'heartbeat':
          break;
        case 'error':
          _logErrorEvent(eventData);
          break;
        case 'data':
        case 'complete':
          _logResponseEvent(eventData);
          break;
      }
    }
  }

  void _logErrorEvent(String data) {
    developer.log('Server returned an error: $data');
    try {
      final errorJson = jsonDecode(data);
      developer.log('Error Details: $errorJson');
    } catch (_) {
      developer.log('Error data is not JSON: $data');
    }
  }

  void _logResponseEvent(String data) {
    try {
      final decodedData = jsonDecode(data);
      String? responseData;

      if (decodedData is List && decodedData.isNotEmpty) {
        responseData = decodedData[0] as String?;
      } else if (decodedData is Map<String, dynamic>) {
        responseData = decodedData['data']?[0] as String?;
      }

      if (responseData != null) {
        developer.log('Response: $responseData');
      } else {
        developer.log('No valid data field in response');
      }
    } catch (e) {
      developer.log('Error parsing event data: $e');
    }
  }

  void _handleError(dynamic e) {
    if (e is DioException) {
      developer.log('Dio Error: ${e.response?.statusCode ?? 'Unknown'}');
      developer.log('Error Message: ${e.message ?? 'No details available'}');
      developer.log('Response Data: ${e.response?.data ?? 'None'}');
      if (e.response?.statusCode == 500) {
        developer.log(
          'Server error: Check Space status or model configuration',
        );
      }
    } else {
      developer.log('Unexpected Error: $e');
    }
  }
}
