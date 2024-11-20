class UserDataModel {
/*
{
  "_id": "66d702fb6a6882b7da10135d",
  "email": "r1@yopmail.com",
  "firstName": "mms",
  "lastName": "dsfasd",
  "middleInitial": null,
  "address": "Shareh e faisal",
  "city": "karachi",
  "state": "sindh",
  "zip": "74350",
  "dob": "2023-10-05",
  "gender": "male",
  "imageName": null,
  "gradeLevel": "5",
  "InstituteName": "Alpha",
  "postSecondaryInterest": null,
  "careerInterest": [
    " programimg "
  ],
  "HBCUList": null,
  "topThreeColleges": [
    " programimg "
  ],
  "currentWeightedGPA": 3.8,
  "currentUnWeightedGPA": null,
  "SATScore": null,
  "language": "english",
  "countryCode": "+1",
  "ISOCode": "US",
  "phone": "214124",
  "designation": null,
  "otp": 123456,
  "notification": 1,
  "notificationCount": 0,
  "stripeId": "cus_QmUybqq3jxmmSX",
  "merchantId": null,
  "block": false,
  "isVerified": 1,
  "isProfileCompleted": 1,
  "isScheduleCompleted": 0,
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmQ3MDJmYjZhNjg4MmI3ZGExMDEzNWQiLCJpYXQiOjE3MjUzNjcxMTR9.leyaBc21sfjKcvoFawA3g5s1OjwK6TaBGBc1Er8Pwrw",
  "user_social_token": null,
  "user_social_type": null,
  "user_device_type": "android",
  "user_device_token": "dsgaedhgsdfhsd",
  "role": "user",
  "isDeleted": 0,
  "createdAt": "2024-09-03T12:37:15.659Z",
  "updatedAt": "2024-09-03T12:38:34.536Z",
  "__v": 1,
  "schedule": [
    " programimg "
  ]
} 
*/

  String? Id;
  String? email;
  String? firstName;
  String? lastName;
  String? middleInitial;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? dob;
  String? gender;
  String? imageName;
  String? gradeLevel;
  String? InstituteName;
  String? postSecondaryInterest;
  List<String?>? careerInterest;
  String? HBCUList;
  List<String?>? topThreeColleges;
  double? currentWeightedGPA;
  String? currentUnWeightedGPA;
  String? SATScore;
  String? language;
  String? countryCode;
  String? ISOCode;
  String? phone;
  String? designation;
  int? otp;
  int? notification;
  int? notificationCount;
  String? stripeId;
  String? merchantId;
  bool? block;
  int? isVerified;
  int? isProfileCompleted;
  int? isScheduleCompleted;
  String? token;
  String? userSocialToken;
  String? userSocialType;
  String? userDeviceType;
  String? userDeviceToken;
  String? role;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;
  dynamic schedule;

  UserDataModel({
    this.Id,
    this.email,
    this.firstName,
    this.lastName,
    this.middleInitial,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.dob,
    this.gender,
    this.imageName,
    this.gradeLevel,
    this.InstituteName,
    this.postSecondaryInterest,
    this.careerInterest,
    this.HBCUList,
    this.topThreeColleges,
    this.currentWeightedGPA,
    this.currentUnWeightedGPA,
    this.SATScore,
    this.language,
    this.countryCode,
    this.ISOCode,
    this.phone,
    this.designation,
    this.otp,
    this.notification,
    this.notificationCount,
    this.stripeId,
    this.merchantId,
    this.block,
    this.isVerified,
    this.isProfileCompleted,
    this.isScheduleCompleted,
    this.token,
    this.userSocialToken,
    this.userSocialType,
    this.userDeviceType,
    this.userDeviceToken,
    this.role,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.schedule,
  });
  UserDataModel.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    email = json['email']?.toString();
    firstName = json['firstName']?.toString();
    lastName = json['lastName']?.toString();
    middleInitial = json['middleInitial']?.toString();
    address = json['address']?.toString();
    city = json['city']?.toString();
    state = json['state']?.toString();
    zip = json['zip']?.toString();
    dob = json['dob']?.toString();
    gender = json['gender']?.toString();
    imageName = json['imageName']?.toString();
    gradeLevel = json['gradeLevel']?.toString();
    InstituteName = json['InstituteName']?.toString();
    postSecondaryInterest = json['postSecondaryInterest']?.toString();
    if (json['careerInterest'] != null) {
      final v = json['careerInterest'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      careerInterest = arr0;
    }
    HBCUList = json['HBCUList']?.toString();
    if (json['topThreeColleges'] != null) {
      final v = json['topThreeColleges'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      topThreeColleges = arr0;
    }
    currentWeightedGPA = json['currentWeightedGPA']?.toDouble();
    currentUnWeightedGPA = json['currentUnWeightedGPA']?.toString();
    SATScore = json['SATScore']?.toString();
    language = json['language']?.toString();
    countryCode = json['countryCode']?.toString();
    ISOCode = json['ISOCode']?.toString();
    phone = json['phone']?.toString();
    designation = json['designation']?.toString();
    otp = json['otp']?.toInt();
    notification = json['notification']?.toInt();
    notificationCount = json['notificationCount']?.toInt();
    stripeId = json['stripeId']?.toString();
    merchantId = json['merchantId']?.toString();
    block = json['block'];
    isVerified = json['isVerified']?.toInt();
    isProfileCompleted = json['isProfileCompleted']?.toInt();
    isScheduleCompleted = json['isScheduleCompleted']?.toInt();
    token = json['token']?.toString();
    userSocialToken = json['user_social_token']?.toString();
    userSocialType = json['user_social_type']?.toString();
    userDeviceType = json['user_device_type']?.toString();
    userDeviceToken = json['user_device_token']?.toString();
    role = json['role']?.toString();
    isDeleted = json['isDeleted']?.toInt();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    v = json['__v']?.toInt();
    schedule = json['schedule'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleInitial'] = middleInitial;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip'] = zip;
    data['dob'] = dob;
    data['gender'] = gender;
    data['imageName'] = imageName;
    data['gradeLevel'] = gradeLevel;
    data['InstituteName'] = InstituteName;
    data['postSecondaryInterest'] = postSecondaryInterest;
    if (careerInterest != null) {
      final v = careerInterest;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['careerInterest'] = arr0;
    }
    data['HBCUList'] = HBCUList;
    if (topThreeColleges != null) {
      final v = topThreeColleges;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['topThreeColleges'] = arr0;
    }
    data['currentWeightedGPA'] = currentWeightedGPA;
    data['currentUnWeightedGPA'] = currentUnWeightedGPA;
    data['SATScore'] = SATScore;
    data['language'] = language;
    data['countryCode'] = countryCode;
    data['ISOCode'] = ISOCode;
    data['phone'] = phone;
    data['designation'] = designation;
    data['otp'] = otp;
    data['notification'] = notification;
    data['notificationCount'] = notificationCount;
    data['stripeId'] = stripeId;
    data['merchantId'] = merchantId;
    data['block'] = block;
    data['isVerified'] = isVerified;
    data['isProfileCompleted'] = isProfileCompleted;
    data['isScheduleCompleted'] = isScheduleCompleted;
    data['token'] = token;
    data['user_social_token'] = userSocialToken;
    data['user_social_type'] = userSocialType;
    data['user_device_type'] = userDeviceType;
    data['user_device_token'] = userDeviceToken;
    data['role'] = role;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    data['schedule'] = schedule;
    return data;
  }
}
