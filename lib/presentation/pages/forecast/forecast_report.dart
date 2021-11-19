import 'package:flutter/material.dart';
import 'package:forecast/constants.dart';

class ForecastReport extends StatelessWidget {
  final Function()? onDismiss;

  ForecastReport({@required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        height: constraint.maxHeight,
        width: constraint.maxWidth,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                onDismiss?.call();
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: kPrimaryTransparentColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: constraint.maxHeight * 0.8,
                width: constraint.maxWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 3,
                        width: 100,
                        color: Color(0xff9D9D9D),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      InkWell(
                        onTap: () {
                          onDismiss?.call();
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(112, 71, 235, 0.1),
                              borderRadius: BorderRadius.circular(20)),
                          height: 43,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Forecast report",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
