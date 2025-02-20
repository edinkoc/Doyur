import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../colors.dart';
import '../widgets/big_text.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    '',
    '',
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigText(color: Colors.white, text: title, size: 18,),
      ],
    ),
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
    colorText: MyColors.customColor4,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.green,
  );
}

