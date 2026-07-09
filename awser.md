4.5 ตรวจสอบผลลัพธ์หลังติดตั้ง Android SDK
<img width="1032" height="311" alt="image" src="https://github.com/user-attachments/assets/3cc7bc80-572f-4bbf-acf8-0093214fd414" />




ขั้นตอนที่ 3: ทำความเข้าใจโค้ดเริ่มต้น
แบบฝึกหัด: วาด Widget Tree ของโค้ดนี้ลงในใบงาน
MyApp
│
└── MaterialApp
    │
    └── MyHomePage
        │
        └── Scaffold
            ├── AppBar
            │   └── Text
            │
            ├── Body
            │   └── Center
            │       └── Column
            │           ├── Text
            │           └── Text
            │
            └── FloatingActionButton
                └── Icon

TODO สำหรับนักศึกษา:

 ✓ เปลี่ยนชื่อและรหัสนักศึกษาให้เป็นของตัวเอง
 ✓ เปลี่ยนข้อมูลในแถวข้อมูลให้เป็นของตัวเอง
 ✓ เพิ่ม Row ข้อมูลเพิ่มเติมอีก 2 แถว
 ✓ ลองเปลี่ยนสี Theme จาก Colors.teal เป็นสีอื่น


<img width="1916" height="1012" alt="image" src="https://github.com/user-attachments/assets/549e0b03-73d1-42f9-b6c6-64713f60bffe" />


ขั้นตอนที่ 6: ทดลอง Hot Reload
รันแอปให้แสดงบน Emulator/Device
เปลี่ยนข้อความ 'Profile' ใน AppBar เป็น 'โปรไฟล์ของฉัน'
บันทึกไฟล์ (Ctrl+S) → สังเกตว่า UI อัปเดตทันที
เปลี่ยนสี Colors.teal เป็น Colors.orange
บันทึกไฟล์อีกครั้ง → สังเกตการเปลี่ยนสีทันที
ลองกด R ใน Terminal เพื่อ Hot Restart

<img width="1913" height="1018" alt="image" src="https://github.com/user-attachments/assets/ae7dbecd-1bc4-40f9-9f58-608e30f3ee95" />

