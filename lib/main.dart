import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class _InfoItem {
  _InfoItem(this.label, this.value);
  String label;
  String value;
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;

  final List<_InfoItem> _infoItems = [
    _InfoItem('คณะ', 'ครุศาสตร์อุตสาหกรรมและเทคโนโลยี'),
    _InfoItem('วิชาที่ชอบ', 'Mobile Development'),
    _InfoItem('เป้าหมาย', 'พัฒนาแอปให้ได้ 1 ตัว'),
    _InfoItem('งานอดิเรก', 'ดูหนัง ฟังเพลง เล่นเกม'),
    _InfoItem('อีเมล', '67030116@kmitl.ac.th'),
  ];

  Future<void> _pickImage() async {
    final XFile? picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  // เปิด dialog เพิ่มข้อมูลใหม่ (index == null) หรือแก้ไขข้อมูลเดิม (ระบุ index)
  Future<void> _showInfoDialog({int? index}) async {
    final existing = index != null ? _infoItems[index] : null;
    final labelController = TextEditingController(text: existing?.label);
    final valueController = TextEditingController(text: existing?.value);

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existing == null ? 'เพิ่มข้อมูล' : 'แก้ไขข้อมูล'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              decoration: const InputDecoration(labelText: 'หัวข้อ'),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(labelText: 'ข้อมูล'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              if (labelController.text.isNotEmpty) {
                setState(() {
                  if (existing != null) {
                    existing.label = labelController.text;
                    existing.value = valueController.text;
                  } else {
                    _infoItems.add(
                      _InfoItem(labelController.text, valueController.text),
                    );
                  }
                });
              }
              Navigator.pop(context);
            },
            child: Text(existing == null ? 'เพิ่ม' : 'บันทึก'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // รูปโปรไฟล์ — แตะเพื่อเลือกรูปจากคลังภาพ
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.indigo,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : null,
                child: _profileImage == null
                    ? const Icon(Icons.person, size: 60, color: Colors.white)
                    : null,
              ),
            ),

            const SizedBox(height: 16),

            // ชื่อ — TODO: เปลี่ยนเป็นชื่อของคุณ
            const Text(
              'Nithi Thipprasoet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // รหัสนักศึกษา — TODO: เปลี่ยนเป็นรหัสของคุณ
            const Text(
              'รหัสนักศึกษา: 67030116',
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
                    for (int i = 0; i < _infoItems.length; i++) ...[
                      if (i > 0) const Divider(),
                      _buildInfoRow(
                        _iconForLabel(_infoItems[i].label),
                        _infoItems[i].label,
                        _infoItems[i].value,
                        onEdit: () => _showInfoDialog(index: i),
                        onDelete: () =>
                            setState(() => _infoItems.removeAt(i)),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AiChatPage()),
                );
              },
              icon: const Icon(Icons.smart_toy),
              label: const Text('ทดลอง AI Chat'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInfoDialog(),
        tooltip: 'เพิ่มข้อมูล',
        child: const Icon(Icons.add),
      ),
    );
  }

  // Helper Method สร้างแถวข้อมูล
  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    VoidCallback? onEdit,
    VoidCallback? onDelete,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
          if (onEdit != null)
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Colors.grey),
              onPressed: onEdit,
            ),
          if (onDelete != null)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.grey),
              onPressed: onDelete,
            ),
        ],
      ),
    );
  }

  // เลือกไอคอนให้เข้ากับหัวข้อโดยดูจากคำสำคัญ
  IconData _iconForLabel(String label) {
    if (label.contains('คณะ') || label.contains('สาขา')) {
      return Icons.school;
    } else if (label.contains('วิชา')) {
      return Icons.code;
    } else if (label.contains('เป้าหมาย')) {
      return Icons.star;
    } else if (label.contains('งานอดิเรก') || label.contains('อดิเรก')) {
      return Icons.favorite;
    } else if (label.contains('อีเมล') || label.contains('email')) {
      return Icons.email;
    } else if (label.contains('เบอร์') || label.contains('โทร')) {
      return Icons.phone;
    } else if (label.contains('ที่อยู่')) {
      return Icons.location_on;
    } else if (label.contains('เกิด')) {
      return Icons.cake;
    } else if (label.contains('เว็บ') || label.contains('website')) {
      return Icons.link;
    }
    return Icons.info;
  }
}
