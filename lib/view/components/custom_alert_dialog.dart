import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squadio_test/view/components/custom_text_widget.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({
    required this.actionText,
    required this.actionOnPress,
    required this.cancelText,
    required this.cancelOnPress,
    required this.title,
    required this.description,
  });
  final String actionText;
  final Function() actionOnPress;
  final String cancelText;
  final Function() cancelOnPress;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: actionOnPress,
          child: CustomText(
            text: actionText,
            fontSize: 13,
            fontColor: Color(0xFFF04A4A),
            maxLines: 1,
          ),
        ),
        TextButton(
          onPressed: cancelOnPress,
          child: CustomText(
            text: cancelText,
            fontSize: 13,
            fontColor: Color(0xFFF04A4A),
          ),
        ),
      ],
      content: CustomText(
        text: description,
        fontSize: 13,
        fontColor: Color(0xFF18345C),
      ),
      title: CustomText(
        text: title,
        fontSize: 13,
        fontColor: Color(0xFFF04A4A),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
