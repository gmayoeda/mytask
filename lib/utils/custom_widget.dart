// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomWidgets {
  CustomWidgets._();

  static formatDate(DateTime date) {
    String formattedDate = DateFormat('yyyy-MM-dd  |  kk:mm').format(date);
    return formattedDate;
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      displaySnackBar(BuildContext context,
          {required String message,
          required bool warning,
          TextAlign? textAlign}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: warning == true ? Colors.orange : Colors.green,
        content: Text(
          textAlign: textAlign ?? TextAlign.left,
          message,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  // CustomWidgets.displaySnackBar(context,message: "UYEEEEEEEE", warning: false);

  static displayAlerts(
    BuildContext context, {
    required String title,
    desc,
    required String titleButton1,
    required Function action1,
    required String titleButton2,
    required Function action2,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(desc),
      actions: <Widget>[
        TextButton(
          onPressed: action1(),
          child: Text(titleButton1),
        ),
        TextButton(
          onPressed: action2(),
          child: Text(titleButton2),
        ),
      ],
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  String title;
  Function action;
  Widget icon;
  Color? color;
  ButtonPrimary(
      {super.key,
      required this.title,
      required this.action,
      required this.icon,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      icon: icon,
      onPressed: () {
        action();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          minimumSize: Size(MediaQuery.of(context).size.width, 43)),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 42,
        decoration: BoxDecoration(
          // color: mainColors,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: 0.7,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Loading . . .",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
