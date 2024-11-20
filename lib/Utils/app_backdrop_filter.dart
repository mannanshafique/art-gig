import 'dart:ui';

class CustomBlurFilter {
  //! ============> Background Blur Effect
  static ImageFilter getBlurFilter({double sigmaX = 5.0, double sigmaY = 5.0}) {
    return ImageFilter.blur(
      sigmaX: sigmaX,
      sigmaY: sigmaY,
    );
  }
}
