## 📋 ส่วนที่ 3: แบบบันทึกผลการทดลอง (Lab Report)

### 3.1 ผลการติดตั้ง Flutter

```
flutter doctor output:
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  D:\ProjectY3\week01_hello_flutter>flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 3.44.4, on Microsoft Windows [Version 10.0.26200.8655], locale th-TH)
[√] Windows Version (11 Home Single Language 64-bit, 25H2, 2009)
[√] Android toolchain - develop for Android devices (Android SDK version 36.0.0)
[√] Chrome - develop for the web
[√] Visual Studio - develop Windows apps (Visual Studio Build Tools 2022 17.13.5)
[√] Connected device (3 available)
[√] Network resources

• No issues found!                    │
│                                                         │
└─────────────────────────────────────────────────────────┘

Flutter Version: 3.44.4
Dart Version: 3.12.2
Android SDK Version: 36.0.0
```

### 3.2 Screenshot ของ Flutter App

<img width="1918" height="1017" alt="Screenshot 2026-07-09 141228" src="https://github.com/user-attachments/assets/94fabdd5-ee18-42dd-bcd3-b8bf614224fd" />


**Widget Tree ที่วาด:**

```
MaterialApp
        └── MyHomePage
              └── Scaffold
                    ├── appBar: AppBar
                    │     └── title: Text
                    │
                    ├── body: Center
                    │     └── child: Column
                    │           ├── Text
                    │           └── Text
                    │
                    └── floatingActionButton: FloatingActionButton
                          └── child: Icon
```

### 3.3 การเปรียบเทียบ Hot Reload vs Hot Restart

| รายการ | Hot Reload (r) | Hot Restart (R) |
|---|---|---|
| ความเร็ว | 1 วินาที | 2-3 วินาที |
| State ถูก Reset? | ไม่รีเซ็ต | รีเซ็ต |
| ใช้เมื่อไหร่ | ตอนปรับแต่งดีไซน์ UI, แก้สี, ปรับขนาดฟอนต์ | ตอนแก้โครงสร้าง Logic, เพิ่มฟังก์ชัน, แก้ไขตัวแปรเริ่มต้น |

### 3.4 ผลการทดลอง Prompt Engineering

**Prompt แบบ Simple:**
```
เขียน Flutter Widget ชื่อ WeatherCard ที่แสดง:
- ชื่อเมือง
- อุณหภูมิ (ตัวเลขขนาดใหญ่)
- ไอคอนสภาพอากาศ (sunny/cloudy/rainy)
- ความชื้น

ใช้ Material Design 3 และรับค่าผ่าน Constructor Parameters
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

<img width="1918" height="1017" alt="Screenshot 2026-07-09 143549" src="https://github.com/user-attachments/assets/92fd588d-310b-4286-92b3-80df8fef1c0d" />

<img width="1918" height="1017" alt="Screenshot 2026-07-09 143134" src="https://github.com/user-attachments/assets/53fbc79d-7af7-4db1-9505-3ac6ada255fa" />


### 3.5 Screenshot ของ AI Chat App


<img width="1918" height="1017" alt="Screenshot 2026-07-09 145914" src="https://github.com/user-attachments/assets/0cc822f7-7731-45e8-8054-1f31f150842d" />


---

## 📝 ส่วนที่ 4: คำถามท้ายบท (Review Questions)

ตอบคำถามต่อไปนี้ลงในใบงาน:

**1.** Flutter แตกต่างจาก React Native อย่างไรในแง่ของ Rendering Engine?

```
คำตอบ: Flutter วาดหน้าจอเองทั้งหมด ทำให้แอปทำงานได้ลื่นไหลและหน้าตาเหมือนกันทุกเครื่อง ส่วน React Native จะแปลงโค้ดไปเรียกใช้หน้าจอของระบบ (iOS/Android) ผ่านตัวเชื่อมทำให้บางครั้งหน้าตาแอปอาจเพี้ยนได้ครับ
```

**2.** อธิบายความแตกต่างระหว่าง `StatelessWidget` และ `StatefulWidget` พร้อมยกตัวอย่างการใช้งานที่เหมาะสมของแต่ละประเภท

```
คำตอบ: StatelessWidget หน้าจอแบบนิ่ง ข้อมูลไม่เปลี่ยน เช่น หน้าประวัติ (Profile Card) ส่วน StatefulWidget หน้าจอแบบขยับได้ ข้อมูลเปลี่ยนได้ตลอด เช่น หน้าจอแชทที่มีข้อความเด้งเข้าเด้งออก
```

**3.** เหตุใดจึงห้าม Commit API Key ลง Git Repository? และมีวิธีจัดการ API Key อย่างปลอดภัยอย่างไรบ้าง?

```
คำตอบ: เพราะคนอื่นจะขโมยรหัสเราไปใช้จนเสียเงินหรือโควตาเต็มได้ วิธีแก้คือ แยกกุญแจไปไว้ในไฟล์อื่น แล้วเขียนชื่อไฟล์นั้นลงใน .gitignore เพื่อซ่อนไม่ให้ถูกอัปโหลดขึ้นเน็ต
```

**4.** Hot Reload ทำงานอย่างไร และมีข้อจำกัดอะไรบ้าง?

```
คำตอบ: ทำงานโดยอัปเดตเฉพาะ UI ที่เพิ่งแก้ลงหน้าจอทันที โดยไม่ล้างข้อมูลเก่าที่กดค้างไว้ ข้อจำกัดคือ ใช้ไม่ได้กับการแก้ระบบหลัก หรือแก้ฟังก์ชัน main
```

**5.** จากการทดลองใช้ Gemini API ในวันนี้ คุณคิดว่าสามารถนำ AI มาช่วยพัฒนาแอปในแง่ไหนได้บ้าง? ยกตัวอย่าง Use Case 3 อย่าง

```
คำตอบ: 
1. ทำ Chatbot คอยตอบคำถามลูกค้า
2. ทำ ระบบสรุปเนื้อหา ย่อบทความหรือข่าวยาวๆ ให้สั้นลงอ่านง่าย
3. ทำ ระบบแปลภาษา หรือตรวจคำผิดภาษาอังกฤษให้ผู้ใช้แบบเรียลไทม์
```
