import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';

class ForecastActionBox extends StatelessWidget {
  final String promptText;
  final String actionButtonText;
  final IconData actionButtonIcon;
  final Function onActionButtonPressed;

  ForecastActionBox(
      {required this.onActionButtonPressed,
      required this.promptText,
      required this.actionButtonIcon,
      required this.actionButtonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryTransparentColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: Color(0xffB9BCF2))),
      width: double.infinity,
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            promptText,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onActionButtonPressed();
            },
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.1),
                  borderRadius: BorderRadius.circular(15)),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    actionButtonText,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    actionButtonIcon,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
