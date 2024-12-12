// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/custom_image_preview.dart';
import '../Model/whishlist_product_model.dart';
// import 'package:google_maps_webservice/places.dart';

class AuthController extends GetxController {
  static AuthController get i => Get.find();
  RxString merchantURL = ''.obs;
//!---Editing Controllers
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phNoEditingController = TextEditingController();
  // final TextEditingController fullNameEditingController =
  //     TextEditingController();
  final TextEditingController fullNameEditingController =
      TextEditingController();

  final TextEditingController locationEditingController =
      TextEditingController();
  final TextEditingController cityEditingController = TextEditingController();
  final TextEditingController stateEditingController = TextEditingController();
  final TextEditingController zipEditingController = TextEditingController();
  final TextEditingController dateOfBirthEditingController =
      TextEditingController();
  final TextEditingController genderEditingController = TextEditingController();

  final TextEditingController descriptionEditingController =
      TextEditingController();

  RxList<String> selectedCareerInterest = <String>[].obs;

  //!---
  final TextEditingController gradeLevelEditingController =
      TextEditingController();
  final TextEditingController institueNameEditingController =
      TextEditingController();
  final TextEditingController gpaEditingController = TextEditingController();
  final TextEditingController otherCareerEditingController =
      TextEditingController();

//!-- Account Detail

  RxString loginType = ''.obs;

  RxString pickedProfileImagePath = "".obs;
  void setProfileImage(String imagePath) {
    pickedProfileImagePath.value = imagePath;
  }

  RxList<ImageModel> selectedMediaPath = <ImageModel>[].obs;

  void setSelectedImage(String imagePath) {
    if (selectedMediaPath.isNotEmpty) {
      selectedMediaPath[0] = ImageModel(path: imagePath, type: 'File');
    } else {
      selectedMediaPath.add(ImageModel(path: imagePath, type: 'File'));
    }
  }

  // var city;
  // var state;
  // var currentLocation;
  var latitude;
  String? fulladdress;
  var longitude;

  // Future<void> getAddress(context) async {
  //   LocationResult t = await Constants().showPlacePicker(context);
  //   latitude = t.latLng?.latitude ?? 0;
  //   longitude = t.latLng?.longitude ?? 0;
  //   locationEditingController.text = t.formattedAddress ?? '';
  //   cityEditingController.text = t.city?.name ?? '';
  //   stateEditingController.text = t.country?.name ?? '';
  //   zipEditingController.text = t.postalCode ?? '';
  //   fulladdress = locationEditingController.text;
  // }

  void clearAllAuthControllerData() {
    locationEditingController.clear();
    emailEditingController.clear();
    phNoEditingController.clear();
    fullNameEditingController.clear();
    cityEditingController.clear();
    stateEditingController.clear();
    zipEditingController.clear();
    dateOfBirthEditingController.clear();
    loginType.value = '';
    pickedProfileImagePath.value = '';
    // selectedMediaPath.clear();
  }

//!---

  List<WhishlistProductModel> whishlistProductData =
      <WhishlistProductModel>[].obs;
}
