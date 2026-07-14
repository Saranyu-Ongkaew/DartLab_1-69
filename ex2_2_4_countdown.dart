import 'dart:async';

Stream<dynamic> countdown(int from) async* {
  // ลูปนับถอยหลังตามตัวเลขที่กำหนด
  for (int i = from; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1));

    yield i;
  }

  yield "หมดเวลา!";
}

void main() async {
  print("--- เริ่มต้นระบบนับถอยหลัง (Stream) ---");

  int startValue = 5;
  print("ตั้งเวลาไว้ที่: $startValue วินาที\n");

  await for (var value in countdown(startValue)) {
    if (value is int) {
      print("⏱️ เหลือเวลา: $value วินาที");
    } else {
      print("🚨 $value");
    }
  }

  print("\n--- จบการทำงานของโปรแกรม ---");
}
