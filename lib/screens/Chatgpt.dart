 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ChatScreen());
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat with AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreenPage(),
    );
  }
}

class ChatScreenPage extends StatefulWidget {
  @override
  _ChatScreenPageState createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  Future<String> _getAIResponse(List<Map<String, String>> messages) async {
  final apiKey = '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'; // Replace with your OpenAI API key
  final endpoint = 'https://api.openai.com/v1/chat/completions';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  final data = {
    'model': 'gpt-3.5-turbo-0125', // Adjust based on your requirement
    'messages': messages,
  };

  try {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['choices'][0]['message']['content'];
    } else {
      throw Exception(
          'Failed to fetch AI response: ${response.statusCode} ${response.body}');
    }
  } catch (e) {
    throw Exception('Failed to fetch AI response: $e');
  }
}


  void _handleSubmitted(String text) async {
  _controller.clear();
  
  // Create a list with a single message
  List<Map<String, String>> messages = [
    {'role': 'user', 'content': text}
  ];

  ChatMessage userMessage = ChatMessage(
    text: text,
    isAi: false,
  );

  setState(() {
    _messages.insert(0, userMessage);
  });

  try {
    String response = await _getAIResponse(messages);
    ChatMessage aiMessage = ChatMessage(
      text: response,
      isAi: true,
    );
    setState(() {
      _messages.insert(0, aiMessage);
    });
  } catch (e) {
    print('Error fetching AI response: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with AI'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _controller,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_controller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isAi});

  final String text;
  final bool isAi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isAi
              ? CircleAvatar(
                  child: Text('AI'),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  isAi ? 'AI' : 'You',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
