import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';

class CustomIconButton extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  CustomIconButton({required this.iconData, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryTransparentColor,
            borderRadius: BorderRadius.circular(10)),
        width: 44,
        height: 44,
        child: Center(
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
