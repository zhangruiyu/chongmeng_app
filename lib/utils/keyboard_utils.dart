import 'package:flutter/services.dart';

class KeyboardUtils {
  static void hide() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
