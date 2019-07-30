import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardUtils {
  //慎用,会导致输入删除问题
  static void hide() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static void hideByContext(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
