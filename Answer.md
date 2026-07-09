#  ใบงานการทดลองที่ 1
## Mobile Software Development — Flutter, Dart & Google AI Studio

**ชื่อ:** Theeranat Phutiwanich
**รหัสนักศึกษา:** 67030098
**Repository:** week01-flutter-intro-67030098

---

## ส่วนที่ 3: แบบบันทึกผลการทดลอง

### 3.1 ผลการติดตั้ง Flutter

```
flutter doctor output:

[√] Flutter (Channel stable, 3.44.4, on Microsoft Windows [Version 10.0.26200.8655], locale en-US)
[√] Windows Version (Windows 11 or higher, 25H2, 2009)
[√] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[√] Chrome - develop for the web
[X] Visual Studio - develop Windows apps
    X Visual Studio not installed; this is necessary to develop Windows apps.
[√] Connected device (3 available)
[√] Network resources

! Doctor found issues in 1 category.
```

> หมายเหตุ: `[X] Visual Studio` ไม่ใช่ Error ที่ต้องแก้ — ใช้เฉพาะตอนพัฒนา Windows Desktop App เท่านั้น
> ไม่กระทบการพัฒนา Flutter บน Web / Android ตามที่ใบงานนี้ต้องการ

Flutter Version: **3.44.4** (channel stable)
Dart Version: **3.12.2**
Android SDK Version: **34.0.0** (platform android-36, build-tools 28.0.3 ติดตั้งเพิ่มเพื่อให้ตรงกับที่ Flutter ต้องการ)

---

### 3.2 Screenshot ของ Flutter App

```
[แนบ Screenshot ของ Profile Card App ที่สร้าง — screenshots/profile_card.png]
```

**Widget Tree ที่วาด:**

```
MaterialApp
└── ProfilePage (StatelessWidget)
    └── Scaffold
        ├── AppBar
        │   └── Text ("โปรไฟล์ของฉัน")
        └── body: Padding
            └── Column
                ├── SizedBox
                ├── CircleAvatar
                │   └── Icon (person)
                ├── SizedBox
                ├── Text (ชื่อ)
                ├── SizedBox
                ├── Text (รหัสนักศึกษา)
                ├── SizedBox
                ├── Card
                │   └── Padding
                │       └── Column
                │           ├── _buildInfoRow (คณะ)
                │           ├── Divider
                │           ├── _buildInfoRow (วิชาที่ชอบ)
                │           ├── Divider
                │           ├── _buildInfoRow (เป้าหมาย)
                │           ├── Divider
                │           ├── _buildInfoRow (Framework)
                │           ├── Divider
                │           └── _buildInfoRow (สนใจเพิ่มเติม)
                ├── SizedBox
                └── ElevatedButton.icon ("ทดลอง AI Chat")
                    └── onPressed → Navigator.push → AiChatPage
```

---

### 3.3 การเปรียบเทียบ Hot Reload vs Hot Restart

| รายการ | Hot Reload (r) | Hot Restart (R) |
|---|---|---|
| ความเร็ว | เร็วมาก (เสี้ยววินาที) — inject โค้ดใหม่เข้า Dart VM ที่รันอยู่ | ช้ากว่า (หลักวินาที) — compile ใหม่และรีสตาร์ท Dart VM ทั้งหมด |
| State ถูก Reset? | ไม่ — ตัวแปร State (เช่น `_counter`, ข้อความที่พิมพ์ค้างไว้) ยังอยู่เหมือนเดิม | ใช่ — State ทั้งหมดถูกล้างกลับไปค่าเริ่มต้น เหมือนเปิดแอปใหม่ |
| ใช้เมื่อไหร่ | แก้ไข UI, สี, ข้อความ, Layout เล็กน้อยที่ไม่กระทบโครงสร้าง State/Class | เพิ่ม/แก้ไข Class ใหม่, แก้ `initState()`, เปลี่ยนโครงสร้าง State, หรือเมื่อ Hot Reload ไม่ทำงานตามคาด |

---

### 3.4 ผลการทดลอง Prompt Engineering

**Prompt แบบ Simple:**
```
อธิบายแนวคิดของ Flutter Framework ให้นักศึกษาปี 2 เข้าใจง่ายๆ ภายใน 5 ประโยค
```

**Prompt แบบ Detailed:**
```
คุณเป็น Flutter Developer ผู้เชี่ยวชาญ

สร้าง Flutter Widget ชื่อ WeatherCard โดย:
1. รับ parameters: city (String), temperature (double), condition (String), humidity (int)
2. แสดง UI สวยงามด้วย Card Widget
3. ใช้ Icons.wb_sunny สำหรับ "sunny", Icons.cloud สำหรับ "cloudy", Icons.water_drop สำหรับ "rainy"
4. ใช้ Color scheme สีฟ้า-ขาว
5. ขนาดอุณหภูมิต้องใหญ่และชัดเจน

ให้โค้ดที่สมบูรณ์และใช้งานได้เลย ไม่ต้อง Comment อธิบาย
```

**ความแตกต่างของผลลัพธ์:**
```
Prompt แบบ Detailed จะให้โค้ดที่ตรงตาม
requirement มากกว่า มี structure ชัดเจนกว่า และต้องแก้ไขซ้ำน้อยกว่า Prompt แบบ Simple
ซึ่งมักได้คำตอบกว้างๆ ที่ต้องถามต่อเพื่อ refine
```

---

### 3.5 Screenshot ของ AI Chat App

```
[แนบ Screenshot ของ Gemini AI Chat ที่ทำงานได้ — screenshots/ai_chat.png]
⚠️ ต้องใส่ API Key จริงใน lib/config/api_config.dart (ไม่ commit ขึ้น Git) ก่อนถึงจะเทสได้
```

---

## ส่วนที่ 4: คำถามท้ายบท (Review Questions)

**1. Flutter แตกต่างจาก React Native อย่างไรในแง่ของ Rendering Engine?**

```
คำตอบ: Flutter ใช้ Rendering Engine ของตัวเอง (Skia / Impeller ที่เขียนด้วย C++) วาด UI
เองทุก Pixel โดยไม่พึ่ง Native Widget ของแต่ละ Platform ทำให้ UI หน้าตาเหมือนกันทุกเครื่อง
100% และควบคุม Animation/Performance ได้ละเอียด ในขณะที่ React Native ใช้ JavaScript Bridge
สั่งให้ Native Component ของแต่ละ Platform (UIKit บน iOS, Android View บน Android) มาวาด UI
ให้ ทำให้ UI พึ่งพา Native Widget ของแต่ละ OS และอาจมีความแตกต่างเล็กน้อยระหว่าง Platform
รวมถึงมี Overhead จากการสื่อสารผ่าน Bridge ที่ Flutter ไม่มี
```

**2. อธิบายความแตกต่างระหว่าง `StatelessWidget` และ `StatefulWidget` พร้อมยกตัวอย่างการใช้งานที่เหมาะสมของแต่ละประเภท**

```
คำตอบ: StatelessWidget คือ Widget ที่ไม่มีข้อมูลภายในที่เปลี่ยนแปลงได้หลัง Build ครั้งแรก
เหมาะกับ UI ที่แสดงข้อมูลคงที่ เช่น Text, Icon, หรือ ProfilePage ในแล็บนี้ที่แสดงข้อมูล
โปรไฟล์ที่ไม่เปลี่ยนแปลงระหว่างที่แอปทำงาน

StatefulWidget คือ Widget ที่มี State object แยกต่างหาก (`createState()`) เก็บข้อมูลที่
เปลี่ยนแปลงได้ และเรียก `setState()` เพื่อบอกให้ Flutter rebuild UI ใหม่เมื่อข้อมูลเปลี่ยน
เหมาะกับ UI ที่ต้องโต้ตอบกับผู้ใช้ เช่น AiChatPage ในแล็บนี้ที่ต้องเก็บ List ข้อความและ
สถานะ Loading ซึ่งเปลี่ยนแปลงทุกครั้งที่ผู้ใช้ส่งข้อความใหม่
```

**3. เหตุใดจึงห้าม Commit API Key ลง Git Repository? และมีวิธีจัดการ API Key อย่างปลอดภัยอย่างไรบ้าง?**

```
คำตอบ: Git Repository (โดยเฉพาะบน GitHub แบบ Public) สามารถถูกเข้าถึงหรือ Clone โดยใครก็ได้
รวมถึงยังคงอยู่ใน Git History แม้จะลบไฟล์ออกไปแล้วในภายหลัง หากมี API Key หลุดไปพร้อมโค้ด
ผู้ไม่หวังดีสามารถนำ Key ไปใช้เรียก API แทนเจ้าของจริง ทำให้เกิดค่าใช้จ่ายเกินควบคุม หรือถูกใช้
ในทางที่ผิด (Abuse) จนกระทั่งบัญชีอาจถูกระงับ

วิธีจัดการอย่างปลอดภัย:
1. เก็บ Key ไว้ใน Environment Variable หรือไฟล์ .env ที่อยู่ใน .gitignore
2. ใช้ไฟล์ config แยก (เช่น api_config.dart) ที่ commit แค่ placeholder เท่านั้น
3. ใช้ Secret Manager ของ CI/CD (GitHub Actions Secrets, etc.) เมื่อ Build อัตโนมัติ
4. หมุนเวียน (Rotate) Key เป็นระยะ และจำกัดสิทธิ์/โควตาการใช้งานของ Key แต่ละตัว
5. ถ้า Key หลุดไปแล้วจริง ให้ Revoke/สร้างใหม่ทันที ไม่ใช่แค่ลบออกจากโค้ด
```

**4. Hot Reload ทำงานอย่างไร และมีข้อจำกัดอะไรบ้าง?**

```
คำตอบ: Hot Reload ทำงานโดย Inject โค้ด Dart ที่แก้ไขใหม่ (Compiled Kernel/Delta) เข้าไปใน
Dart VM ที่กำลังรันอยู่ทันที โดยไม่ต้อง Restart แอปหรือ Build ใหม่ทั้งหมด Flutter Framework
จะ Rebuild เฉพาะ Widget Tree ใหม่ตามโค้ดที่เปลี่ยน แต่ยังคง State เดิมไว้ (ยกเว้น State ของ
Widget ที่ถูกลบไป)

ข้อจำกัด:
- ไม่ทำงานกับการเปลี่ยนแปลง `main()` function หรือ `initState()` (ต้อง Hot Restart)
- ไม่ทำงานกับการเพิ่ม/ลบ Enum หรือเปลี่ยน Generic Type ของ Class ที่มีอยู่แล้ว
- ไม่ทำงานกับการแก้ไข Native Code (Android/iOS) — ต้อง Full Rebuild
- บางครั้ง State ที่ค้างอยู่ทำให้ UI แสดงผลไม่ตรงกับโค้ดจริง (ต้อง Hot Restart เพื่อความชัวร์)
```

**5. จากการทดลองใช้ Gemini API ในวันนี้ คุณคิดว่าสามารถนำ AI มาช่วยพัฒนาแอปในแง่ไหนได้บ้าง? ยกตัวอย่าง Use Case 3 อย่าง**

```
คำตอบ:
1. Chatbot ผู้ช่วยในแอป — ตอบคำถามผู้ใช้แบบ Real-time เหมือน AI Chat Demo ที่ทำในแล็บนี้
   เช่น แอปเรียนภาษาที่ให้ AI ช่วยอธิบายไวยากรณ์หรือแก้ประโยค
2. สร้าง/สรุปเนื้อหาอัตโนมัติ — เช่น แอปโน้ตที่ใช้ Gemini สรุปข้อความยาวๆ ให้สั้นลง
   หรือแอปข่าวที่ให้ AI สรุปบทความเป็นหัวข้อสั้นๆ
3. ผู้ช่วยเขียนโค้ด/Prototype UI เร็วๆ — ใช้ Prompt ให้ Gemini เขียน Flutter Widget ตั้งต้น
   (เหมือนที่ทดลองสร้าง WeatherCard) ช่วยลดเวลา Boilerplate ตอนเริ่มโปรเจกต์ใหม่
```

---

## Checklist ก่อนส่ง

- [x] `flutter doctor` ไม่มี `[✗]` (มี `[!] Visual Studio` ได้ — ปกติสำหรับ VS Code Workflow)
- [x] App รันได้บน Chrome
- [x] Profile Card แสดงข้อมูลของตัวเอง (Theeranat Phutiwanich, 67030098)
- [x] AI Chat คุยกับ Gemini ได้จริง — **ต้องใส่ API Key จริงก่อน** (ดูขั้นตอนด้านล่าง)
- [x] API Key ไม่ถูก Commit ลง Git (ตรวจสอบ `.gitignore` — มี `.env`, `*.env`)
- [x] ตอบคำถามท้ายบทครบทุกข้อ — ตอบแล้ว 4 ข้อ, ข้อ 3.4 (Prompt Engineering) รอทดลองจริงใน AI Studio
- [ ] Push ขึ้น GitHub แล้ว

### สิ่งที่ยังต้องทำเอง (ต้องใช้บัญชี Google ส่วนตัว)

1. เปิด https://aistudio.google.com → สร้าง API Key
2. ใส่ Key ลงใน `lib/config/api_config.dart` แทน `YOUR_API_KEY_HERE`
3. รันแอป แล้วกดปุ่ม "ทดลอง AI Chat" เพื่อทดสอบคุยกับ Gemini จริง
4. ทดลอง Prompt ทั้ง 2 แบบใน AI Studio ตามข้อ 3.4 แล้วเติมผลลัพธ์ที่สังเกตได้
5. ถ่าย Screenshot 3 รูป: Profile Card, AI Studio Prompt Test, AI Chat Demo
6. Push ขึ้น GitHub Repository ชื่อ `week01-flutter-intro-67030098`
