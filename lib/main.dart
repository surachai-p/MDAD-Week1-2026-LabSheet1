import 'package:flutter/material.dart';
import 'pages/ai_chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์ของฉัน'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'กฤษฏิณัช สำราญกิจ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'รหัสนักศึกษา: 67030270',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow(
                      Icons.school,
                      'คณะ',
                      'ครุศาสตร์อุตสาหกรรมและเทคโนโลยี',
                    ),
                    const Divider(),
                    _buildInfoRow(Icons.code, 'สาขา', 'เทคโนโลยีสารสนเทศ'),
                    const Divider(),
                    _buildInfoRow(
                      Icons.favorite,
                      'งานอดิเรก',
                      'เล่นเกมและฟังเพลง',
                    ),
                    const Divider(),
                    _buildInfoRow(
                      Icons.location_on,
                      'ที่อยู่',
                      'กรุงเทพมหานคร',
                    ),
                    const Divider(),
                    _buildInfoRow(
                      Icons.star,
                      'เป้าหมาย',
                      'พัฒนาแอปให้สำเร็จและเรียนรู้ Flutter',
                    ),
                    const Divider(),
                    _buildInfoRow(Icons.phone, 'ติดต่อ', 'example@email.com'),
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AiChatPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.smart_toy),
                        label: const Text('ทดลอง AI Chat'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
