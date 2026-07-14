void main() {
  print("1. เริ่ม");

  Future.delayed(Duration(seconds: 3)).then((_) {
    print("2. โหลดเสร็จ");
  });

  print("3. จบ");
}