import 'package:flutter/material.dart';
import 'package:carbun/helperFunctions/constants.dart';

class Dock extends StatelessWidget {
  final int currentPage;
  final double height, width;
  final Function navigationFunction;
  Dock({
    Key key,
    this.height,
    this.width,
    this.currentPage,
    this.navigationFunction,
  }) : super(key: key);

  BorderRadius individualRadius(int index) {
    BorderRadius _leftBuddy =
        BorderRadius.only(topRight: Radius.circular(20.0));
    BorderRadius _rightBuddy =
        BorderRadius.only(topLeft: Radius.circular(20.0));
    BorderRadius _midSelected =
        BorderRadius.vertical(bottom: Radius.circular(20.0));
    BorderRadius _leftSelected = BorderRadius.only(
        bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(25.0));
    BorderRadius _rightSelected = BorderRadius.only(
        bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(25.0));
    switch (currentPage) {
      case 0:
        switch (index) {
          case 0:
            return _leftSelected;
            break;
          case 1:
            return _rightBuddy;
            break;
          default:
            return BorderRadius.zero;
        }
        break;
      case 1:
        switch (index) {
          case 0:
            return _leftBuddy;
            break;
          case 1:
            return _midSelected;
            break;
          default:
            return _rightBuddy;
        }
        break;
      default:
        switch (index) {
          case 0:
            return BorderRadius.zero;
            break;
          case 1:
            return _leftBuddy;
            break;
          default:
            return _rightSelected;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget individualBox(int position, {double height, double width}) =>
        GestureDetector(
          onTap: () => navigationFunction(position),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: currentPage == position ? primaryColor : textColor,
              borderRadius: individualRadius(position),
            ),
            child: Center(
              child: categories[position].icon == null
                  ? Text(
                      'C',
                      style: TextStyle(
                          color: currentPage == position
                              ? textColor
                              : primaryColor,
                          fontSize: currentPage == position ? 35.0 : 30.0,
                          fontFamily: 'Inter'),
                    )
                  : Icon(categories[position].icon,
                      color: currentPage == position ? textColor : primaryColor,
                      size: currentPage == position ? 35.0 : 30.0),
            ),
          ),
        );

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor, textColor])),
      child: Row(
        children: List<Widget>.generate(
          3,
          (index) => individualBox(index, height: height, width: width / 3),
        ),
      ),
    );
  }
}
