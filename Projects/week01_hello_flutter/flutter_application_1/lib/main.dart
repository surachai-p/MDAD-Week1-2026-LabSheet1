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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
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
        backgroundColor: const Color.fromARGB(171, 13, 255, 0),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // รูปโปรไฟล์
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 254, 2, 174),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 16),

            // ชื่อ — TODO: เปลี่ยนเป็นชื่อของคุณ
            const Text(
              'นายภูมิชนะ เทียมแก้ว',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // รหัสนักศึกษา — TODO: เปลี่ยนเป็นรหัสของคุณ
            const Text(
              'รหัสนักศึกษา: 67030180',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // Card ข้อมูล
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
                    _buildInfoRow(
                      Icons.code,
                      'วิชาที่ชอบ',
                      'Mobile Development',
                    ),
                    const Divider(),
                    _buildInfoRow(
                      Icons.star,
                      'เป้าหมาย',
                      'พัฒนาแอปให้ได้ 7 ตัว',
                    ),
                    const Divider(),
                    _buildInfoRow(Icons.email, 'อีเมล', '67030180@kmitl.ac.th'),
                    const Divider(),
                    _buildInfoRow(Icons.phone, 'เบอร์โทรศัพท์', '092-772-3609'),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method สร้างแถวข้อมูล
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(189, 15, 0, 150)),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
