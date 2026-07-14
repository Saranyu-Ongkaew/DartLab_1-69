import 'dart:async';

Future<Map<String, dynamic>> fetchProfile(int userId) async {
  // หน่วงเวลา 2 วินาทีเสมือนดึงข้อมูลจาก Server
  await Future.delayed(Duration(seconds: 2));

  if (userId <= 0) {
    throw Exception(
      "ไม่พบข้อมูลผู้ใช้: userId ต้องมากกว่า 0 (ได้รับค่า $userId)",
    );
  }

  return {
    "userId": userId,
    "name": "สมชาย ใจดี",
    "role": "Developer",
    "active": true,
  };
}

void main() async {
  print("--- เริ่มต้นการทดสอบระบบดึงข้อมูล ---");

  print("\n[กรณีที่ 1] กำลังดึงข้อมูลของ userId: 42...");
  await runFetchProfileDemo(42);

  print("\n----------------------------------");

  print("\n[กรณีที่ 2] กำลังดึงข้อมูลของ userId: -5...");
  await runFetchProfileDemo(-5);

  print("\n--- สิ้นสุดการทดสอบระบบ ---");
}

Future<void> runFetchProfileDemo(int id) async {
  try {
    final profile = await fetchProfile(id);
    print("✅ สำเร็จ! ข้อมูลโปรไฟล์: $profile");
  } catch (error) {
    print("❌ เกิดข้อผิดพลาด: ${error.toString()}");
  } finally {
    print("🧹 [finally] ทำความสะอาด/ปิดการเชื่อมต่อทรัพยากรเสร็จสิ้น");
  }
}
