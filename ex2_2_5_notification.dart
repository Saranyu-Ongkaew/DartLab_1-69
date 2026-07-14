import 'dart:async';

void main() {
  print("--- เริ่มต้นระบบจำลองการแจ้งเตือน (StreamController) ---");

  final StreamController<String> notificationController =
      StreamController<String>();

  notificationController.stream.listen(
    (notification) {
      print("🔔 แจ้งเตือนใหม่: $notification");
    },
    onError: (error) {
      print("❌ เกิดข้อผิดพลาดในระบบแจ้งเตือน: $error");
    },
    onDone: () {
      print("🏁 [onDone] ระบบสตรีมสิ้นสุดการทำงาน และปิดตัวลงเรียบร้อยแล้ว");
    },
  );

  print("📡 กำลังส่งข้อมูลการแจ้งเตือน...");
  notificationController.add("คุณมี 1 ข้อความใหม่จากสมชาย");
  notificationController.add("ยอดเงินของคุณถูกหัก 150 บาท");
  notificationController.add("แอปพลิเคชันอัปเดตเวอร์ชันใหม่สำเร็จ");

  print("🛑 กำลังสั่งปิดระบบสตรีม...");
  notificationController.close();

  print("--- จบโค้ดส่วนของฟังก์ชัน main ---");
}
