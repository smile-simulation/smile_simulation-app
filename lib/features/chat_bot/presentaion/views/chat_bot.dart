import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class ChatBot {
  static Future<void> askQuestion({required String question}) async {
    final postUrl = Uri.parse(
      'https://mahmoud176203-chat-bot.hf.space/gradio_api/call/chat',
    );

    // POST Request
    final postResponse = await http.post(
      postUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "data": [
          question, // question repeated (context, prompt)
          question,
          1, // history (can stay 1)
          0.1, // temperature
          0.1, // top_p
        ],
      }),
    );
    if (postResponse.statusCode == 200) {
      final postData = jsonDecode(postResponse.body);
      log(postData.toString());
      final eventId = postData['event_id'];

      // GET Request using event_id
      final getUrl = Uri.parse(
        'https://mahmoud176203-chat-bot.hf.space/gradio_api/call/chat/$eventId/',
      );
      final getResponse = await http.get(getUrl);
      log(getResponse.body.toString());
      // if (getResponse.statusCode == 200) {
      //   final getData = jsonDecode(getResponse.body);
      //   final result = getData['data'][0]; // غالبًا الرد هيكون هنا
      //   print("🤖 Bot says: $result");
      // } else {
      //   print("❌ Failed to fetch bot reply: ${getResponse.statusCode}");
      // }
    } else {
      print("❌ Failed to post question: ${postResponse.statusCode}");
    }
  }

  static Future<void> askBot({required String question}) async {
    final dio = Dio();
    final postUrl =
        'https://mahmoud176203-chat-bot.hf.space/gradio_api/call/chat';

    try {
      // POST Request
      final postResponse = await dio.post(
        postUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "data": [
            question, // question repeated (context, prompt)
            question,
            1, // history (can stay 1)
            0.1, // temperature
            0.1, // top_p
          ],
        },
      );

      if (postResponse.statusCode == 200) {
        final postData = postResponse.data;
        log(postData.toString());

        final eventId = postData['event_id'];

        // GET Request using event_id
        final getUrl =
            'https://mahmoud176203-chat-bot.hf.space/gradio_api/call/chat/$eventId/';
        final getResponse = await dio.get(getUrl);
        log(getResponse.toString());
        // if (getResponse.statusCode == 200) {
        //   final getData = getResponse.data;
        //   final result = getData['data'][0]; // Response is typically here
        //   print("🤖 Bot says: $result");
        // } else {
        //   print("❌ Failed to fetch bot reply: ${getResponse.statusCode}");
        // }
      } else {
        print("❌ Failed to post question: ${postResponse.statusCode}");
      }
    } catch (e) {
      print("❌ Error occurred: $e");
    } finally {
      dio.close();
    }
  }

  static Future<void> makePostRequest() async {
    // Define the URL and headers
    final url = Uri.parse(
      "https://7f9c-35-229-45-99.ngrok-free.app/api/generate",
    );
    final headers = {"Content-Type": "application/json"};

    // Define the data (payload) to send in the POST request
    final data = {"model": "llama3", "prompt": "how are you?", "stream": false};

    try {
      // Send the POST request
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data),
      );

      // Check if the request was successful and print the response
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        print("Response: ${responseBody['response']}");
      } else {
        print("Failed to get a response. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> askBot2({required String question}) async {
    final dio = Dio();
    const String postUrl =
        'https://mahmoud176203-chat-bot.hf.space/gradio_api/call/chat';

    // Define parameters matching the Python code
    String message = question;
    String systemMessage = "You are a friendly Chatbot.";
    int maxTokens = 512;
    double temperature = 0.7;
    double topP = 0.95;

    try {
      // Step 1: POST request to initiate the chat prediction
      final postResponse = await dio.post(
        postUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "data": [
            message, // "Hello!!"
            systemMessage, // "You are a friendly Chatbot."
            maxTokens, // 512
            temperature, // 0.7
            topP, // 0.95
          ],
        },
      );

      if (postResponse.statusCode == 200) {
        // Parse the POST response to get the event_id
        final postData =
            postResponse.data is String
                ? jsonDecode(postResponse.data)
                : postResponse.data;
        final eventId = postData['event_id'];

        if (eventId == null) {
          print("❌ No event_id found in response");
          return;
        }

        // Step 2: GET request to retrieve the result via SSE
        final getUrl = '$postUrl/$eventId';
        final client = http.Client();

        try {
          final request = http.Request('GET', Uri.parse(getUrl));
          request.headers['Accept'] = 'text/event-stream';
          final response = await client.send(request);

          if (response.statusCode == 200) {
            String? currentEvent;
            StringBuffer dataBuffer = StringBuffer();

            // Listen to the SSE stream
            await for (var chunk in response.stream.transform(utf8.decoder)) {
              for (var line in chunk.split('\n')) {
                if (line.startsWith('event: ')) {
                  currentEvent = line.substring(7).trim();
                } else if (line.startsWith('data: ')) {
                  dataBuffer.write(line.substring(6).trim());
                } else if (line.trim().isEmpty && currentEvent != null) {
                  // End of an SSE event
                  if (currentEvent == 'complete') {
                    try {
                      final json = jsonDecode(dataBuffer.toString());
                      final result = json['data'][0];
                      print("🤖 Bot says: $result");
                      return;
                    } catch (e) {
                      print("❌ Failed to parse complete event data: $e");
                    }
                  } else if (currentEvent == 'error') {
                    print("❌ API returned an error: ${dataBuffer.toString()}");
                    return;
                  }
                  // Reset for the next event
                  currentEvent = null;
                  dataBuffer.clear();
                }
              }
            }
          } else {
            print("❌ Failed to fetch bot reply: ${response.statusCode}");
          }
        } catch (e) {
          print("❌ Error during SSE: $e");
        } finally {
          client.close();
        }
      } else {
        print("❌ Failed to post question: ${postResponse.statusCode}");
      }
    } catch (e) {
      print("❌ Error occurred: $e");
    } finally {
      dio.close();
    }
  }

  static Future<String> runPythonFunction() async {
    // Define the Flask server URL
    final url = Uri.parse(
      'http://127.0.0.1:5000/run-python',
    ); // Use your server's IP if not local

    try {
      // Send the GET request
      final response = await http.get(url);

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body);
        return data['message']; // Extract the 'message' field
      } else {
        throw Exception(
          'Failed to call Python function: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error: $e');
      return 'Error occurred';
    }
  }  
}
