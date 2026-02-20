import 'dart:io';
import 'dart:ui';

class PlatformUtils {
  static Size getScreenSize() {
    final isAndroid = Platform.isAndroid;
    switch (isAndroid) {
      case true:
        return Size(360, 640);
      case false:
        return Size(430, 932);
    }
  }
}
