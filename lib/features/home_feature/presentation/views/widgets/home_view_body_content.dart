import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import 'posts_list_view.dart';

class HomeViewBodyContent extends StatelessWidget {
  const HomeViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).posts,
                style: AppTextStyles.headline2(
                  context,
                ).copyWith(color: AppColors.blackColor),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                ),
                onPressed: () async {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    ),
  );

  try {
    // 1. POST request to get the EVENT_ID
    final postResponse = await dio.post(
      'https://baher-hamada-final-project.hf.space/gradio_api/call/predict',
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
      data: {
        "data": [
          "Hello!!", // [0] Message (string)
        ],
      },
    );

    final eventId = postResponse.data["event_id"] as String?;
    if (eventId == null) {
      developer.log('Error: No event_id returned from POST request');
      return;
    }
    developer.log('Event ID: $eventId');

    // 2. GET request with streaming for SSE
    final response = await dio.get(
      'https://baher-hamada-final-project.hf.space/gradio_api/call/predict/$eventId',
      options: Options(responseType: ResponseType.stream),
    );

    // Process SSE stream
    String buffer = '';
    await for (var chunk in response.data.stream) {
      final data = String.fromCharCodes(chunk);
      buffer += data;
      developer.log('Stream Chunk: $data');

      // Split buffer into complete SSE messages (delimited by double newline)
      final messages = buffer.split('\n\n');
      buffer = messages.last; // Keep incomplete message in buffer

      for (var message in messages.sublist(0, messages.length - 1)) {
        // Parse SSE message
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

          if (eventType == 'heartbeat') {
            developer.log('Received heartbeat, continuing to wait for response');
            continue; // Ignore heartbeat and wait for next event
          } else if (eventType == 'error') {
            developer.log('Server returned an error: $eventData');
            try {
              final errorJson = jsonDecode(eventData);
              developer.log('Error Details: $errorJson');
            } catch (e) {
              developer.log('Error data is not JSON: $eventData');
            }
            return;
          } else if (eventType == 'complete' || eventType == 'data') {
            try {
              final jsonData = jsonDecode(eventData) as Map<String, dynamic>;
              final responseData = jsonData['data']?[0] as String?;
              if (responseData != null) {
                developer.log('Response: $responseData');
                return;
              } else {
                developer.log('No data field in response');
              }
            } catch (e) {
              developer.log('Error parsing event data: $e');
            }
            return;
          }
        }
      }
    }
  } catch (e) {
    if (e is DioException) {
      developer.log('Dio Error: ${e.response?.statusCode ?? 'Unknown'}');
      developer.log('Error Message: ${e.message ?? 'No details available'}');
      developer.log('Response Data: ${e.response?.data ?? 'None'}');
      if (e.response?.statusCode == 500) {
        developer.log('Server error: Check Space status or model configuration');
      }
    } else {
      developer.log('Unexpected Error: $e');
    }
  }
},
                child: Text("اختبار"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                ),
                onPressed: () async {},
                child: Text("الاختبار 2"),
              ),
            ],
          ),
          Expanded(child: PostsListView(currentUser: false)),
        ],
      ),
    );
  }
}
