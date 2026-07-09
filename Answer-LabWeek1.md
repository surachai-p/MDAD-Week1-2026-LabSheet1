## 📋 ส่วนที่ 3: แบบบันทึกผลการทดลอง (Lab Report)

### 3.1 ผลการติดตั้ง Flutter

```
flutter doctor output:
```
<img width="1200" height="342" alt="image" src="https://github.com/user-attachments/assets/b497ee2d-ec92-4954-8bb0-c8ae9b75f63c" />


Flutter Version: 3.44.4

Dart Version: 3.12.2

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
| ความเร็ว | เร็วมาก (ใช้เวลาเป็นมิลลิวินาที / ไม่ถึง 1-2 วินาที) | เร็วปานกลาง (ช้ากว่า Hot Reload เล็กน้อย ประมาณ 2-5 วินาที) |
| State ถูก Reset? | ไม่ถูก Reset (รักษาค่าหรือสถานะเดิมของหน้าจอไว้) | ถูก Reset (ล้างสถานะกลับไปเริ่มต้นใหม่ทั้งหมดเหมือนเพิ่งเปิดแอป) |
| ใช้เมื่อไหร่ | ใช้ตอนปรับแก้ UI, เปลี่ยนสี, ปรับ Font, แก้ไขดีไซน์เล็ก ๆ น้อย ๆ | ใช้เมื่อมีการแก้ไขส่วนโครงสร้างหลัก, แก้ไขไฟล์ main.dart, แก้ไขฟังก์ชันใน initState() หรือเปลี่ยนโครงสร้าง Data Model |

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

ให้โค้ดที่สมบูรณ์และใช้งานได้เลย ไม่ต้อง Comment อธิบาย```

**ความแตกต่างของผลลัพธ์:**
```
ใช้ Prompt แบบ Simple
AI จะเน้นการอธิบายทฤษฎีในภาพกว้าง คำตอบที่ได้จะเป็นข้อความสรุปแนวคิดพื้นฐาน 5 ประโยค (เช่น การอธิบายเรื่อง Single Codebase, ภาษา Dart, แนวคิด Everything is a Widget, Rendering Engine และ Hot Reload) เหมาะสำหรับการทำความเข้าใจทฤษฎีเบื้องต้น

เมื่อใช้ Prompt แบบ Detailed
AI จะเปลี่ยนบทบาทเป็นผู้เชี่ยวชาญตาม Role ที่กำหนด ให้ผลลัพธ์เป็น Code ที่มีโครงสร้างตามเงื่อนไขที่ระบุไว้ (เช่น การจัดกลุ่ม Parameter, การเลือกใช้ Icon และ Color Scheme สีฟ้า-ขาวตามสั่ง) โดยไม่มีข้อความอธิบายส่วนเกิน ทำให้นำโค้ดไป Copy-Paste ใช้งานในโปรเจกต์ได้
```

### 3.5 Screenshot ของ AI Chat App

```
<img width="1918" height="907" alt="image" src="https://github.com/user-attachments/assets/9729bf85-dce3-4cfe-b9eb-52bea17045dd" />

<img width="1918" height="908" alt="image" src="https://github.com/user-attachments/assets/5df42f08-62ec-4203-a43f-544cec6e040a" />

<img width="1918" height="912" alt="image" src="https://github.com/user-attachments/assets/f96b37a2-b42e-47ee-8e4c-d50965f73f2c" />

<img width="1918" height="960" alt="image" src="https://github.com/user-attachments/assets/93ae67cc-76e1-4091-8c74-50ae11dff600" />

<img width="1918" height="900" alt="image" src="https://github.com/user-attachments/assets/08dec2e4-3ade-4cd7-b328-f85381e9a31a" />

<img width="1918" height="910" alt="image" src="https://github.com/user-attachments/assets/cc11501c-4947-4487-93d7-ea6f60c4dfd9" />

<img width="1918" height="908" alt="image" src="https://github.com/user-attachments/assets/372f9c20-6adb-4918-aa95-041938ad3d9a" />

<img width="1918" height="893" alt="image" src="https://github.com/user-attachments/assets/89899e28-a7ae-4801-9cf6-62cc654c188e" />

```

---

## 📝 ส่วนที่ 4: คำถามท้ายบท (Review Questions)

ตอบคำถามต่อไปนี้ลงในใบงาน:

**1.** Flutter แตกต่างจาก React Native อย่างไรในแง่ของ Rendering Engine?

```
คำตอบ: Flutter จะใช้ Engine ของตัวเองที่ชื่อ Impeller (หรือ Skia) ในการวาดและควบคุม UI ขึ้นมาบนหน้าจอเองทั้งหมดแบบพิกเซลต่อพิกเซล ทำให้แอปดูลื่นไหลและหน้าตาเหมือนกันในทุกอุปกรณ์ ส่วน React Native จะไม่ได้วาดเอง แต่จะใช้วิธีส่งข้อมูลผ่าน Bridge ไปเรียกใช้องค์ประกอบ UI ดั้งเดิม (Native Components) ของระบบปฏิบัติการนั้นๆ (เช่น Android/iOS) ในการแสดงผลแทน
```

**2.** อธิบายความแตกต่างระหว่าง `StatelessWidget` และ `StatefulWidget` พร้อมยกตัวอย่างการใช้งานที่เหมาะสมของแต่ละประเภท

```
คำตอบ: StatelessWidget คือหน้าจอหรือ Widget ประเภทนิ่งๆ ที่วาดเสร็จแล้วจะไม่มีการเปลี่ยนแปลงข้อมูลหรือหน้าตาในตัวเองอีก เหมาะกับพวกหน้าโชว์โลโก้ หรือหน้าการ์ดโปรไฟล์ ส่วน StatefulWidget คือหน้าจอที่ข้อมูลสามารถเปลี่ยนแปลงได้ตลอดเวลาแบบเรียลไทม์ โดยสั่ง setState() เพื่อให้แอปวาดหน้าจอใหม่ตอนข้อมูลเปลี่ยนได้ เหมาะกับหน้าระบบแชทบอตที่เราต้องกดส่งข้อความแล้วมีข้อความใหม่เด้งขึ้นมาเพิ่มในลิสต์
```

**3.** เหตุใดจึงห้าม Commit API Key ลง Git Repository? และมีวิธีจัดการ API Key อย่างปลอดภัยอย่างไรบ้าง?

```
คำตอบ: เพราะถ้าอัปโหลด API Key ขึ้นบนเว็บ Git (เช่น GitHub) คนอื่นจะสามารถแอบเอาคีย์ของเราไปใช้สวมรอยยิงข้อมูลได้ อาจทำให้โควตาฟรีของเราเต็ม หรือถ้าผูกบัตรไว้ก็อาจจะโดนคิดเงิน เสี่ยงเรื่องความปลอดภัยด้วย วิธีจัดการ ต้องแยกเก็บรหัสพวกนี้ไว้ในไฟล์ต่างหาก (เช่น .env หรือ api_config.dart) แล้วเอาชื่อไฟล์นั้นไปใส่ไว้ในไฟล์ .gitignore เพื่อไม่ให้ Git ตรวจจับและดึงไฟล์นี้ขึ้นระบบออนไลน์
```

**4.** Hot Reload ทำงานอย่างไร และมีข้อจำกัดอะไรบ้าง?

```
คำตอบ: Hot Reload ทำงานโดยการนำโค้ดเฉพาะส่วนที่เราเพิ่งเซฟแก้ไขเข้าไปใน Dart Virtual Machine (VM) ของแอปที่กำลังรันอยู่ ทำให้เราเห็นความเปลี่ยนแปลงบนหน้าจอได้ทันทีภายในไม่กี่วินาทีโดยไม่ต้องปิดแล้วบิวด์แอปใหม่ และยังรักษาค่าหรือสถานะเดิม (State) บนหน้าจอไว้ได้ด้วย ส่วนข้อจำกัดคือ มันจะไม่ทำงานถ้าเราไปแก้ตัวแปรระดับ Global, แก้โค้ดในฟังก์ชัน main(), ปรับแต่งไฟล์คอนฟิกฝั่ง Native (เช่น โฟลเดอร์ android/ios) หรือไปแก้ไขโค้ดที่รันผ่าน initState() ไปเรียบร้อยแล้ว ซึ่งกรณีเหล่านี้เราต้องกด Hot Restart แทน
```

**5.** จากการทดลองใช้ Gemini API ในวันนี้ คุณคิดว่าสามารถนำ AI มาช่วยพัฒนาแอปในแง่ไหนได้บ้าง? ยกตัวอย่าง Use Case 3 อย่าง

```
คำตอบ: 
1. ทำระบบแชทบอตคอยช่วยเหลือ ตอบคำถามพนักงานหรือผู้ใช้งานแอปเบื้องต้นแบบเรียลไทม์ตลอด 24 ชั่วโมง
2. ทำระบบช่วยสรุปเนื้อหา เช่น สรุปเอกสาร ข้อมูล หรือบทความขนาดยาวภายในแอปให้สั้นกระชับและเข้าใจง่ายขึ้นในไม่กี่ประโยค
3. ช่วยวิเคราะห์ แนะนำข้อมูล เช่น นำข้อความที่ผู้ใช้พิมพ์คุยมาวิเคราะห์หาความสนใจ แล้วเลือกแนะนำสินค้าหรือบทเรียนที่ตรงใจผู้ใช้คนนั้นๆ แบบเฉพาะบุคคล
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

- [✓ ] `flutter doctor` ไม่มี `[✗]` (มี `[!] Android Studio` ได้ — ปกติสำหรับ VS Code Workflow)
- [ ✓] App รันได้บน Chrome หรือ Android Device/Emulator
- [✓ ] Profile Card แสดงข้อมูลของตัวเอง
- [ ✓ ] AI Chat คุยกับ Gemini ได้จริง
- [ ] API Key ไม่ถูก Commit ลง Git (ตรวจสอบ `.gitignore`)
- [✓ ] ตอบคำถามท้ายบทครบทุกข้อ
- [ ] Push ขึ้น GitHub แล้ว


*ใบงานนี้เป็นส่วนหนึ่งของวิชา Mobile Software Development | สัปดาห์ที่ 1*  
