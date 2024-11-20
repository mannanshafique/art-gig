// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:mecca/Common/Auth/Bloc/social_login_bloc.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_routing_arguments.dart';
// import 'package:mecca/Utils/app_strings.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class FirebaseAuthBloc {
//   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   UserCredential? _userCredential;
//   User? _user;
//   SocialLoginBloc _socialLoginBloc = SocialLoginBloc();

//   ///-------------------- Google Sign In -------------------- ///
//   Future<void> signInWithGoogle({required BuildContext context}) async {
//     try {
//       GoogleSignIn _googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//       );

//       GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();

//       if (_googleSignInAccount != null) {
//         await _googleSignIn.signOut();

//         log("Display First NAme:${_googleSignInAccount.displayName?.split(' ').first}");
//         log("Display Last name:${_googleSignInAccount.displayName?.split(' ').last}");
//         log("Social id:${_googleSignInAccount.id}");
//         log("Social email:${_googleSignInAccount.email}");

//         _socialLoginMethod(
//             context: context,
//             firstName: _googleSignInAccount.displayName?.split(' ').first ?? "",
//             lastName: _googleSignInAccount.displayName?.split(' ').last ?? "",
//             email: _googleSignInAccount.email,
//             socialToken: _googleSignInAccount.id,
//             socialType: AppStrings.GOOGLE_SOCIAL_TYPE);
//       }
//     } catch (error) {
//       log(error.toString());
//       AppDialogs.showToast(message: error.toString());
//     }
//   }

//   //-------------------- Apple Sign In -------------------- //

//   Future<void> signInWithApple({required BuildContext context}) async {
//     try {
//       final credential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );

//       if (credential != null) {
//         _socialLoginMethod(
//             context: context,
//             firstName: credential.givenName,
//             lastName: credential.familyName,
//             email: credential.email,
//             socialToken: credential.userIdentifier,
//             socialType: AppStrings.APPLE_SOCIAL_TYPE);
//       }
//     } on SignInWithAppleAuthorizationException catch (e) {
//       if (e.code == AuthorizationErrorCode.canceled) {
//       } else {
//         AppDialogs.showToast(message: e.toString());
//       }
//     }
//     // catch (error) {
//     //   //print(error.toString());
//     //   AppDialogs.showToast(message: error.toString());
//     // }
//   }

//   //////////////////////// Phone Sign In //////////////////////////////////
//   Future<void> signInWithPhone(
//       {required BuildContext context,
//       required String countryCode,
//       required String dialCode,
//       required String phoneNumber,
//       required VoidCallback setProgressBar,
//       required VoidCallback cancelProgressBar}) async {
//     try {
//       setProgressBar();
//       FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: '+' + dialCode + phoneNumber,
//           timeout: Duration(seconds: 60),
//           verificationCompleted: (AuthCredential authCredential) async {
//             print("verification completed");
//           },
//           verificationFailed: (FirebaseAuthException authException) {
//             if (authException.code == AppStrings.INVALID_PHONE_NUMBER) {
//               cancelProgressBar();
//               AppDialogs.showToast(
//                   message: AppStrings.INVALID_PHONE_NUMBER_MESSAGE);
//             } else {
//               cancelProgressBar();
//               print(authException.message);
//               log(authException.message.toString());
//               AppDialogs.showToast(message: authException.message);
//             }
//             //print(authException.message);
//           },
//           codeSent: (String verificationId, int? forceResendingToken) {
//             log("Verification Id:${verificationId}");
//             cancelProgressBar();
//             AppNavigation.navigateReplacement(
//                 context, AppRouteName.VERIFICATION_SCREEN_ROUTE,
//                 arguments: OtpVerificationArguments(
//                     phoneNumber: phoneNumber,
//                     phoneVerificationId: verificationId));
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             // cancelProgressBar();
//             log("Timeout Verification id:${verificationId.toString()}");
//           });
//     } catch (error) {
//       print("error");
//       log("error");
//       cancelProgressBar();
//       AppDialogs.showToast(message: error.toString());
//     }
//   }

//   //
//   Future<void> verifyPhoneCode(
//       {required BuildContext context,
//       String? countryCode,
//       String? dialCode,
//       String? phoneNo,
//       required String verificationId,
//       required String verificationCode}) async {
//     try {
//       //print("Verify Phone Code Starts");

//       AuthCredential _credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: verificationCode);

//       _userCredential = await _firebaseAuth.signInWithCredential(_credential);

//       _user = _userCredential?.user;

//       if (_user != null) {
//         await _firebaseUserSignOut();

//         // API Call Here

//         _socialLoginMethod(
//           context: context,
//           phoneNo: phoneNo,
//           dialCode: dialCode,
//           countryCode: countryCode,
//           socialToken: _user?.uid,
//           socialType: AppStrings.PHONE_SOCIAL_TYPE,
//         );
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: error.toString());
//     }
//   }

//   //
//   //
//   //
//   Future<void> resendPhoneCode(
//       {required BuildContext context,
//       required String countryCode,
//       required String dialCode,
//       required String phoneNumber,
//       required ValueChanged<String?> getVerificationId,
//       required VoidCallback setProgressBar,
//       required VoidCallback cancelProgressBar}) async {
//     setProgressBar();
//     try {
//       _firebaseAuth.verifyPhoneNumber(
//           phoneNumber: '+' + dialCode + phoneNumber,
//           timeout: Duration(seconds: 60),
//           verificationCompleted: (AuthCredential authCredential) async {},
//           verificationFailed: (FirebaseAuthException authException) {
//             cancelProgressBar();
//             AppDialogs.showToast(message: authException.message);
//             //print(authException.message);
//           },
//           codeSent: (String verificationId, int? forceResendingToken) {
//             cancelProgressBar();
//             getVerificationId(verificationId);
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             log(verificationId.toString());
//           });
//     } catch (error) {
//       cancelProgressBar();
//       AppDialogs.showToast(message: error.toString());
//     }
//   }

//   ///-------------------- Sign Out -------------------- ///
//   Future<void> _firebaseUserSignOut() async {
//     await _firebaseAuth.signOut();
//   }

//   void _socialLoginMethod(
//       {required BuildContext context,
//       String? firstName,
//       String? lastName,
//       String? email,
//       String? phoneNo,
//       String? countryCode,
//       String? dialCode,
//       String? socialToken,
//       String? socialType}) {
//     log("First Name:${firstName}");
//     log("Last Name:${lastName}");
//     log("Email :${email}");
//     log("Phone No:${phoneNo}");
//     log("Country Code:${countryCode}");
//     log("Social token:${socialToken}");
//     log("Social type:${socialType}");

//     _socialLoginBloc.socialLoginBlocMethod(
//         context: context,
//         socialType: socialType,
//         userSocialToken: socialToken ?? '',
//         firstName: firstName ?? "",
//         lastName: lastName ?? "",
//         userEmail: email,
//         phoneNo: phoneNo,
//         dialCode: dialCode,
//         countryCode: countryCode,
//         setProgressBar: () {
//           AppDialogs.progressAlertDialog(context: context);
//         });
//   }
// }
