import 'package:flutter/material.dart';

showCustomBottomSheet(BuildContext context, Widget content,) {
  showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16)),
  builder: (context) {
    return  content;
  });
}