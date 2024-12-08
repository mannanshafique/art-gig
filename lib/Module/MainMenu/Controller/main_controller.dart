import 'package:get/get.dart';

import '../../PaymentCard/Model/payment_card_model.dart';

class MainController extends GetxController {
  static MainController get i => Get.find();

//!---

RxInt cardSelectedValue = 0.obs;

  RxList<PaymentCardData> paymentCards = [
    PaymentCardData(
      id: "card_1",
      object: "card",
      addressCity: "New York",
      addressCountry: "US",
      addressLine1: "123 Main St",
      addressLine1Check: "pass",
      addressLine2: "Apt 4B",
      addressState: "NY",
      addressZip: "10001",
      addressZipCheck: "pass",
      brand: "Visa",
      country: "US",
      customer: "cust_1",
      cvcCheck: "pass",
      dynamicLast4: "1234",
      expMonth: 12,
      expYear: 2025,
      fingerprint: "abc123",
      funding: "credit",
      last4: "1234",
      name: "John Doe",
      tokenizationMethod: null,
      wallet: null,
    ),
    PaymentCardData(
      id: "card_2",
      object: "card",
      addressCity: "Los Angeles",
      addressCountry: "US",
      addressLine1: "456 Elm St",
      addressLine1Check: "fail",
      addressLine2: "Suite 300",
      addressState: "CA",
      addressZip: "90001",
      addressZipCheck: "pass",
      brand: "MasterCard",
      country: "US",
      customer: "cust_2",
      cvcCheck: "pass",
      dynamicLast4: "5678",
      expMonth: 10,
      expYear: 2026,
      fingerprint: "def456",
      funding: "debit",
      last4: "5678",
      name: "Jane Smith",
      tokenizationMethod: "apple_pay",
      wallet: "Apple Pay",
    ),
  ].obs;

}
