import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../common/constants/text_style.dart';

class WidgetTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final MaskTextInputFormatter? formatter;

  const WidgetTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.maxLines,
    this.textInputType,
    this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChanged,
        keyboardType: textInputType,
        maxLines: maxLines,
        controller: controller,
        inputFormatters: [
          if(formatter != null) formatter!,
        ],
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: Styles.textField,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        style: Styles.size17);
  }
}
