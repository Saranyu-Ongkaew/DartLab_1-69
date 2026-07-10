mixin Loggable {
  void log(String msg) {
    DateTime now = DateTime.now();
    String timestamp = '${now.hour}:${now.minute}:${now.second}';
    print('[$timestamp] [LOG]: $msg');
  }
}

class Stack<T> with Loggable {
  final List<T> _storage = [];

  void push(T element) {
    _storage.add(element);
    log(
      'ใส่ข้อมูล "$element" เข้ามาใน Stack | จำนวนปัจจุบัน: ${_storage.length} ชิ้น',
    );
  }

  T? pop() {
    if (_storage.isEmpty) {
      log('พยายามจะ Pop แต่ Stack ว่างเปล่า!');
      return null;
    }

    T lastElement = _storage.removeLast();
    log(
      'ดึงข้อมูล "$lastElement" ออกจาก Stack | จำนวนคงเหลือ: ${_storage.length} ชิ้น',
    );
    return lastElement;
  }

  void showStack() {
    print('--> สภาพของ Stack ปัจจุบัน: $_storage');
    print('--------------------------------------------------');
  }
}

void main() {
  print('=== ระบบจำลอง Stack พร้อมบันทึกข้อมูล (Mixin & Generics) ===\n');

  print('--- [ทดสอบที่ 1: Stack ของ String] ---');
  Stack<String> textStack = Stack<String>();

  textStack.push('ข้อมูลชุดที่ A');
  textStack.push('ข้อมูลชุดที่ B');
  textStack.showStack();

  textStack.pop();
  textStack.showStack();

  print('\n--- [ทดสอบที่ 2: Stack ของ Integer] ---');
  Stack<int> numberStack = Stack<int>();

  numberStack.push(100);
  numberStack.push(200);
  numberStack.showStack();

  numberStack.pop();
  numberStack.pop();
  numberStack.pop();
  numberStack.showStack();
}
