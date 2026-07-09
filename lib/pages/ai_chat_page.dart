import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../config/api_config.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;
  late GenerativeModel _model;
  int _currentModelIndex = 0;
  final List<String> _candidateModels = [
    'models/gemini-3.5-flash',
    'models/gemini-3.1-flash-lite',
    'models/gemini-2.5-flash',
    'models/gemini-2.0-flash',
  ];

  @override
  void initState() {
    super.initState();
    _model = _createModel(_candidateModels[_currentModelIndex]);
  }

  GenerativeModel _createModel(String model) {
    return GenerativeModel(
      model: model,
      apiKey: ApiConfig.geminiApiKey,
      requestOptions: const RequestOptions(apiVersion: 'v1'),
    );
  }

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': userMessage});
      _isLoading = true;
    });
    _controller.clear();

    await _sendMessageToModel(userMessage, allowFallback: true);
  }

  Future<void> _sendMessageToModel(
    String userMessage, {
    bool allowFallback = false,
  }) async {
    try {
      final content = [Content.text(userMessage)];
      final response = await _model.generateContent(content);

      setState(() {
        _messages.add({
          'role': 'assistant',
          'text': response.text ?? 'ไม่ได้รับการตอบกลับ',
        });
      });
    } catch (e) {
      final errorText = e.toString();
      if (allowFallback && _tryFallbackModel(errorText)) {
        await _sendMessageToModel(userMessage, allowFallback: false);
        return;
      }

      setState(() {
        _messages.add({
          'role': 'assistant',
          'text': 'เกิดข้อผิดพลาด: $errorText',
        });
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  bool _tryFallbackModel(String errorText) {
    final unsupportedModel =
        errorText.contains('not found') ||
        errorText.contains('not supported') ||
        errorText.contains('No such model');

    if (!unsupportedModel) return false;
    if (_currentModelIndex >= _candidateModels.length - 1) return false;

    _currentModelIndex += 1;
    _model = _createModel(_candidateModels[_currentModelIndex]);
    _messages.add({
      'role': 'assistant',
      'text':
          'กำลังเปลี่ยนเป็นโมเดล ${_candidateModels[_currentModelIndex]} และลองใหม่...',
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini AI Chat'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const Center(
                    child: Text(
                      '👋 ทักทาย Gemini AI!\nลองพิมพ์ข้อความด้านล่าง',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final isUser = message['role'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.blue : Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['text']!,
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'พิมพ์ข้อความ...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                    textInputAction: TextInputAction.send,
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton.small(
                  onPressed: _isLoading ? null : _sendMessage,
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
