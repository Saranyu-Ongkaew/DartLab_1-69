abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard implements PaymentMethod {
  String cardNumber;
  String cardHolder;

  CreditCard(this.cardNumber, this.cardHolder);

  @override
  void pay(double amount) {
    print('💳 ชำระเงินผ่าน บัตรเครดิต เป็นจำนวน $amount บาท');
    print('[ระบบ]: ตัดเงินจากบัตรหมายเลข $cardNumber (คุณ $cardHolder) สำเร็จ');
    print('--------------------------------------------------');
  }
}

class PromptPay implements PaymentMethod {
  String phoneNumber;

  PromptPay(this.phoneNumber);

  @override
  void pay(double amount) {
    print('📱 ชำระเงินผ่าน พร้อมเพย์ เป็นจำนวน $amount บาท');
    print(
      '[ระบบ]: เจนเนอเรต QR Code ไปยังเบอร์ $phoneNumber เพื่อให้ลูกค้าสแกนเรียบร้อย',
    );
    print('--------------------------------------------------');
  }
}

class CashOnDelivery implements PaymentMethod {
  String shippingAddress;

  CashOnDelivery(this.shippingAddress);

  @override
  void pay(double amount) {
    print('📦 เลือกชำระเงินแบบ เก็บเงินปลายทาง (COD) เป็นจำนวน $amount บาท');
    print(
      '[ระบบ]: บันทึกข้อมูล จัดส่งสินค้าไปยัง: $shippingAddress (รอเก็บเงินตอนรับของ)',
    );
    print('--------------------------------------------------');
  }
}

void main() {
  print('=== ระบบจำลองการชำระเงิน (Abstract & Interface) ===\n');

  PaymentMethod option1 = CreditCard('4567-8901-2345-6789', 'สมชาย ใจดี');
  PaymentMethod option2 = PromptPay('081-234-5678');
  PaymentMethod option3 = CashOnDelivery('123/45 ถ.สุขุมวิท กรุงเทพฯ');

  option1.pay(1550.0);
  option2.pay(320.0);
  option3.pay(890.0);
}
