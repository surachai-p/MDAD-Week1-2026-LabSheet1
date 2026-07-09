## 📋 ส่วนที่ 3: แบบบันทึกผลการทดลอง (Lab Report)

### 3.1 ผลการติดตั้ง Flutter

```
flutter doctor output:
```
<img width="1200" height="342" alt="image" src="https://github.com/user-attachments/assets/b497ee2d-ec92-4954-8bb0-c8ae9b75f63c" />


Flutter Version: 3.44.4

Dart Version: ______________________

Android SDK Version: 36.0.0
```

### 3.2 Screenshot ของ Flutter App

```
<img width="1295" height="995" alt="image" src="https://github.com/user-attachments/assets/b4225566-ea9f-449d-b1a9-876b9f9df06c" />

```

**Widget Tree ที่วาด:**


(วาด Widget Tree ของแอปที่สร้างด้วยมือ)

MaterialApp
└── ProfilePage
    └── Scaffold
        ├── AppBar
        │   └── Text
        └── Padding
            └── Column
                ├── SizedBox
                ├── CircleAvatar
                │   └── Icon
                ├── SizedBox
                ├── Text (ชื่อ)
                ├── SizedBox
                ├── Text (รหัสนักศึกษา)
                ├── SizedBox
                ├── Card
                │   └── Padding
                │       └── Column
                │           ├── Row (คณะ)
                │           ├── Divider
                │           ├── Row (วิชาที่ชอบ)
                │           ├── Divider
                │           ├── Row (เป้าหมาย)
                │           ├── Divider
                │           ├── Row (สาขา)
                │           ├── Divider
                │           └── Row (สถาบัน)
                ├── SizedBox
                └── ElevatedButton.icon
                    ├── Icon
                    └── Text ("ทดลอง AI Chat")
```

### 3.3 การเปรียบเทียบ Hot Reload vs Hot Restart

| รายการ | Hot Reload (r) | Hot Restart (R) |
|---|---|---|
| ความเร็ว | | |
| State ถูก Reset? | | |
| ใช้เมื่อไหร่ | | |

### 3.4 ผลการทดลอง Prompt Engineering

**Prompt แบบ Simple:**
```
(วาง Prompt ที่ใช้)
```

**Prompt แบบ Detailed:**
```
(วาง Prompt ที่ใช้)
```

**ความแตกต่างของผลลัพธ์:**
```
(บันทึกสิ่งที่สังเกต)
```

### 3.5 Screenshot ของ AI Chat App

```
[แนบ Screenshot ของ Gemini AI Chat ที่ทำงานได้]
```

---

## 📝 ส่วนที่ 4: คำถามท้ายบท (Review Questions)

ตอบคำถามต่อไปนี้ลงในใบงาน:

**1.** Flutter แตกต่างจาก React Native อย่างไรในแง่ของ Rendering Engine?

```
คำตอบ: _______________________________________________
```

**2.** อธิบายความแตกต่างระหว่าง `StatelessWidget` และ `StatefulWidget` พร้อมยกตัวอย่างการใช้งานที่เหมาะสมของแต่ละประเภท

```
คำตอบ: _______________________________________________
```

**3.** เหตุใดจึงห้าม Commit API Key ลง Git Repository? และมีวิธีจัดการ API Key อย่างปลอดภัยอย่างไรบ้าง?

```
คำตอบ: _______________________________________________
```

**4.** Hot Reload ทำงานอย่างไร และมีข้อจำกัดอะไรบ้าง?

```
คำตอบ: _______________________________________________
```

**5.** จากการทดลองใช้ Gemini API ในวันนี้ คุณคิดว่าสามารถนำ AI มาช่วยพัฒนาแอปในแง่ไหนได้บ้าง? ยกตัวอย่าง Use Case 3 อย่าง

```
คำตอบ: 
1. _______________________________________________
2. _______________________________________________
3. _______________________________________________
```

---

## 🏆 ส่วนที่ 5: งานเพิ่มเติม (Challenge)

**(Optional — สำหรับผู้ที่ต้องการพัฒนาทักษะเพิ่มเติม)**

### Challenge 1: ปรับปรุง Profile Card
- เพิ่ม Animation เมื่อกดปุ่ม (ใช้ `AnimatedContainer`)
- เพิ่ม Dark Mode Support
- เพิ่ม Social Media Links

### Challenge 2: ปรับปรุง AI Chat
- เพิ่มประวัติการสนทนา (Chat History) โดยส่ง Message History ไปกับ Request
- เพิ่ม System Prompt เพื่อกำหนดบุคลิกของ AI
- เพิ่มปุ่ม Clear Chat

### Challenge 3: รวม Profile + AI
- เพิ่มปุ่มใน Profile Page ที่ให้ AI สร้าง "Introduction" จากข้อมูลของคุณ
- ส่งข้อมูล Profile ไปใน Prompt และให้ Gemini เขียนแนะนำตัว

---

## 📤 การส่งงาน (Submission)

### สิ่งที่ต้องส่ง

1. **Source Code** — Push ขึ้น GitHub Repository
   ```
   Repository Name: week01-flutter-intro-[รหัสนักศึกษา]
   ```

2. **ใบงานที่กรอกเสร็จแล้ว** — ส่งเป็น PDF หรือ Markdown

3. **Screenshot** อย่างน้อย 3 รูป:
   - Flutter Profile Card App
   - Google AI Studio Prompt Test
   - AI Chat Demo ที่ทำงานได้

### โครงสร้าง Repository ที่ต้องการ

```
week01-flutter-intro-XXXXXXXX/
├── lib/
│   ├── config/
│   │   └── api_config.dart   (⚠️ แทนที่ key ด้วย placeholder)
│   ├── pages/
│   │   └── ai_chat_page.dart
│   └── main.dart
├── .gitignore                  (ต้องมี!)
├── pubspec.yaml
├── screenshots/
    ├── profile_card.png
    ├── ai_studio.png
    └── ai_chat.png

```

### Checklist ก่อนส่ง

- [ ] `flutter doctor` ไม่มี `[✗]` (มี `[!] Android Studio` ได้ — ปกติสำหรับ VS Code Workflow)
- [ ] App รันได้บน Chrome หรือ Android Device/Emulator
- [ ] Profile Card แสดงข้อมูลของตัวเอง
- [ ] AI Chat คุยกับ Gemini ได้จริง
- [ ] API Key ไม่ถูก Commit ลง Git (ตรวจสอบ `.gitignore`)
- [ ] ตอบคำถามท้ายบทครบทุกข้อ
- [ ] Push ขึ้น GitHub แล้ว


*ใบงานนี้เป็นส่วนหนึ่งของวิชา Mobile Software Development | สัปดาห์ที่ 1*  
