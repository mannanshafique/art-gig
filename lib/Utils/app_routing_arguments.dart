import 'package:flutter/material.dart';

class OtpVerificationArguments {
  final String? userId;
  final String? phoneNumber;
  final String? phoneVerificationId;

  OtpVerificationArguments(
      {this.userId, this.phoneNumber, this.phoneVerificationId});
}

class CreateEditProfileArguments {
  final bool isFromEdit;

  CreateEditProfileArguments({
    required this.isFromEdit,
  });
}



class SelectHourRoutingArguments {
  final String? day, startHr, startMint, endHr, endMint;
  bool? fromEdit;
  int? index;
  ValueChanged<String?>? getStartTime;
  ValueChanged<String?>? getEndTime;
  ValueChanged<bool?>? isActive;
  SelectHourRoutingArguments(
      {this.day,
      this.fromEdit,
      this.index,
      this.getStartTime,
      this.getEndTime,
      this.isActive,
      this.startHr,
      this.startMint,
      this.endHr,
      this.endMint});
}
