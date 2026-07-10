class Temperature {
  double _celsius = 0.0;

  double get celsius => _celsius;

  set celsius(double value) {
    if (value < -273.15) {
      print(
        'ข้อผิดพลาด: อุณหภูมิไม่สามารถต่ำกว่าศูนย์สัมบูรณ์ (-273.15 °C) ได้',
      );
    } else {
      _celsius = value;
    }
  }

  double get fahrenheit => (_celsius * 9 / 5) + 32;
}

void main() {
  Temperature temp = Temperature();

  print('=== ทดสอบการทำงานของคลาส Temperature ===\n');

  print('--- การทำงานปกติ ---');
  temp.celsius = 25.0;
  print('อุณหภูมิในระบบ (Celsius): ${temp.celsius} °C');
  print('แปลงเป็น Fahrenheit: ${temp.fahrenheit} °F');
  print('--------------------------\n');

  print('--- ทดสอบเงื่อนไข Setter (ป้อนค่า -300) ---');
  temp.celsius = -300.0;
  print('ค่าปัจจุบันในระบบยังคงเป็น: ${temp.celsius} °C');
  print('--------------------------');
}
