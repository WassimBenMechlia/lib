import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userMessage = TextEditingController();
  static const apiKey = "AIzaSyBpn7q3pP4qJ9ahnNlRaHy9xJNjDVHqZtI";
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  final List<Message> _messages = [];
  bool _isLoading = false;

  Future<void> sendMessage() async {
    final message = _userMessage.text.trim();
    if (message.isEmpty) return;
    _userMessage.clear();
    setState(() {
      _messages.add(
        Message(isUser: true, message: message, date: DateTime.now()),
      );
      _isLoading = true;
    });
    try {
      final content = [Content.text(message)];
      final response = await model.generateContent(content);
      setState(() {
        _messages.add(
          Message(
            isUser: false,
            message: response.text ?? "Désolé, pas de réponse.",
            date: DateTime.now(),
          ),
        );
      });
    } catch (e) {
      setState(() {
        _messages.add(
          Message(
            isUser: false,
            message:
                ":danger: Erreur : Impossible d'obtenir une réponse. Détails : $e",
            date: DateTime.now(),
          ),
        );
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return Messages(
                isUser: message.isUser,
                message: message.message,
                date: DateFormat('HH:mm').format(message.date),
              );
            },
          ),
        ),
        if (_isLoading)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CircularProgressIndicator(
              color: Colors.red[400],
              strokeWidth: 3,
            ),
          ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _userMessage,
                  decoration: InputDecoration(
                    hintText: "Posez votre question...",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: _isLoading ? null : sendMessage,
                backgroundColor: Colors.red[400],
                elevation: 0,
                shape: const CircleBorder(),
                child: Icon(Icons.send, color: Colors.white, size: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.red[400] : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: TextStyle(
                color: isUser ? Colors.white70 : Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}
