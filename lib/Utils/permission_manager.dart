import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static final PermissionManager _instance = PermissionManager._internal();
  factory PermissionManager() {
    return _instance;
  }
  PermissionManager._internal();
  Future<PermissionState> requestCameraPermission() async {
    var status = await Permission.camera.status;
    log("CAMERA STATUS ${status}");
    if (status.isGranted) {
      // Permission already granted
      return PermissionState.granted;
    } else if (status.isDenied) {
      // Permission has been denied before, ask again
      var result = await Permission.camera.request();
      if (result.isGranted) {
        // Permission granted
        return PermissionState.granted;
      } else if (result.isPermanentlyDenied) {
        // Permission permanently denied, open app settings
        openAppSettings();
        return PermissionState.permnantlyDenied;
      } else {
        // Permission denied
        return PermissionState.deined;
      }
    } else {
      // Permission has not been requested yet, request now
      var result = await Permission.camera.request();
      if (result.isGranted) {
        // Permission granted
        return PermissionState.granted;
      } else if (result.isPermanentlyDenied) {
        // Permission permanently denied, open app settings
        openAppSettings();
        return PermissionState.permnantlyDenied;
      } else {
        // Permission denied
        return PermissionState.deined;
      }
    }
  }

  Future<PermissionState> requestPhotoAndStoragePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        var status = await Permission.photos.status;
        if (status.isGranted) {
          // Permission already granted
          return PermissionState.granted;
        } else if (status.isDenied) {
          // Permission has been denied before, ask again
          var result = await Permission.photos.request();
          if (result.isGranted) {
            // Permission granted
            return PermissionState.granted;
          } else if (result.isPermanentlyDenied) {
            // Permission permanently denied, open app settings
            openAppSettings();
            return PermissionState.permnantlyDenied;
          } else {
            // Permission denied
            return PermissionState.deined;
          }
        } else {
          // Permission has not been requested yet, request now
          var result = await Permission.photos.request();
          if (result.isGranted) {
            // Permission granted
            return PermissionState.granted;
          } else if (result.isPermanentlyDenied) {
            // Permission permanently denied, open app settings
            openAppSettings();
            return PermissionState.permnantlyDenied;
          } else {
            // Permission denied
            return PermissionState.deined;
          }
        }
      } else {
        var status = await Permission.storage.status;
        if (status.isGranted) {
          // Permission already granted
          return PermissionState.granted;
        } else if (status.isDenied) {
          // Permission has been denied before, ask again
          var result = await Permission.storage.request();
          if (result.isGranted) {
            // Permission granted
            return PermissionState.granted;
          } else if (result.isPermanentlyDenied) {
            // Permission permanently denied, open app settings
            openAppSettings();
            return PermissionState.permnantlyDenied;
          } else {
            // Permission denied
            return PermissionState.deined;
          }
        } else {
          // Permission has not been requested yet, request now
          var result = await Permission.storage.request();
          if (result.isGranted) {
            // Permission granted
            return PermissionState.granted;
          } else if (result.isPermanentlyDenied) {
            // Permission permanently denied, open app settings
            openAppSettings();
            return PermissionState.permnantlyDenied;
          } else {
            // Permission denied
            return PermissionState.deined;
          }
        }
      }
    } else {
      // Handle other platforms if needed
      return PermissionState.deined;
    }
  }
}

enum PermissionState { granted, alwaysAsk, deined, permnantlyDenied }
