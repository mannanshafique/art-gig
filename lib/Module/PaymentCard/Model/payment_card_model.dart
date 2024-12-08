// class PaymentCardData {
// /*
// {
//   "cardId": "card_1OyBklLpLuFneqIF5FeT47OE",
//   "last4": "1111",
//   "brand": "Visa"
// } 
// */

//   String? cardId;
//   String? last4;
//   String? brand;

//   PaymentCardData({
//     this.cardId,
//     this.last4,
//     this.brand,
//   });
//   PaymentCardData.fromJson(Map<String, dynamic> json) {
//     cardId = json['id']?.toString();
//     last4 = json['last4']?.toString();
//     brand = json['brand']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = cardId;
//     data['last4'] = last4;
//     data['brand'] = brand;
//     return data;
//   }
// }

//!---
///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class PaymentCardData {

  String? id;
  String? object;
  String? addressCity;
  String? addressCountry;
  String? addressLine1;
  String? addressLine1Check;
  String? addressLine2;
  String? addressState;
  String? addressZip;
  String? addressZipCheck;
  String? brand;
  String? country;
  String? customer;
  String? cvcCheck;
  String? dynamicLast4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? last4;
  String? name;
  String? tokenizationMethod;
  String? wallet;

  PaymentCardData({
    this.id,
    this.object,
    this.addressCity,
    this.addressCountry,
    this.addressLine1,
    this.addressLine1Check,
    this.addressLine2,
    this.addressState,
    this.addressZip,
    this.addressZipCheck,
    this.brand,
    this.country,
    this.customer,
    this.cvcCheck,
    this.dynamicLast4,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.last4,
    this.name,
    this.tokenizationMethod,
    this.wallet,
  });
  PaymentCardData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    object = json['object']?.toString();
    addressCity = json['address_city']?.toString();
    addressCountry = json['address_country']?.toString();
    addressLine1 = json['address_line1']?.toString();
    addressLine1Check = json['address_line1_check']?.toString();
    addressLine2 = json['address_line2']?.toString();
    addressState = json['address_state']?.toString();
    addressZip = json['address_zip']?.toString();
    addressZipCheck = json['address_zip_check']?.toString();
    brand = json['brand']?.toString();
    country = json['country']?.toString();
    customer = json['customer']?.toString();
    cvcCheck = json['cvc_check']?.toString();
    dynamicLast4 = json['dynamic_last4']?.toString();
    expMonth = json['exp_month']?.toInt();
    expYear = json['exp_year']?.toInt();
    fingerprint = json['fingerprint']?.toString();
    funding = json['funding']?.toString();
    last4 = json['last4']?.toString();
    name = json['name']?.toString();
    tokenizationMethod = json['tokenization_method']?.toString();
    wallet = json['wallet']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['address_city'] = addressCity;
    data['address_country'] = addressCountry;
    data['address_line1'] = addressLine1;
    data['address_line1_check'] = addressLine1Check;
    data['address_line2'] = addressLine2;
    data['address_state'] = addressState;
    data['address_zip'] = addressZip;
    data['address_zip_check'] = addressZipCheck;
    data['brand'] = brand;
    data['country'] = country;
    data['customer'] = customer;
    data['cvc_check'] = cvcCheck;
    data['dynamic_last4'] = dynamicLast4;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['fingerprint'] = fingerprint;
    data['funding'] = funding;
    data['last4'] = last4;
    data['name'] = name;
    data['tokenization_method'] = tokenizationMethod;
    data['wallet'] = wallet;
    return data;
  }
}

