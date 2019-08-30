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

  static void unfocus(context) {
    FocusScope.of(context).unfocus();
  }

  static void insertText(
      TextEditingController _textEditingController, String text) {
    var value = _textEditingController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = "";
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
        end = start;
      }

      _textEditingController.value = value.copyWith(
          text: newText,
          selection: value.selection.copyWith(
              baseOffset: end + text.length, extentOffset: end + text.length));
    } else {
      _textEditingController.value = TextEditingValue(
          text: text,
          selection:
              TextSelection.fromPosition(TextPosition(offset: text.length)));
    }
  }
}
