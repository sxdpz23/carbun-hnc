import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/screens/carbonEmision/components.dart';
import 'package:flutter/material.dart';

class CarbonEmission extends StatefulWidget {
  @override
  _CarbonEmissionState createState() => _CarbonEmissionState();
}

class _CarbonEmissionState extends State<CarbonEmission> {
  int modeSelected = -1;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width,
        _height = MediaQuery.of(context).size.height;

    return Container(
      color: primaryColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              child: Text(
                'Calculate & offset your daily carbon emission',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: textColor.withAlpha(0xAA), fontFamily: 'Itim'),
              ),
            ),
            HeaderCaption(heading: 'Mode of Emission', color: textColor),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 13.0, top: 8.0),
              child: Container(
                height: _width * 0.55,
                width: _width,
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List<Widget>.generate(
                      filterList.length,
                      (index) => Tooltip(
                            message: filterList[index].label,
                            child: GestureDetector(
                              onTap: () => setState(() => modeSelected = index),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: modeSelected == index
                                        ? secondaryColor
                                        : primaryColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: modeSelected == index
                                        ? []
                                        : [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 10.0)
                                          ]),
                                child: Center(
                                  child: Icon(
                                    filterList[index].icon,
                                    color: modeSelected == index
                                        ? primaryColor
                                        : secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
            modeSelected >= 0
                ? SizedBox(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Column(
                        children: <Widget>[
                          HeaderCaption(heading: 'Calculate', color: textColor),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: filterList[modeSelected].screen),
                        ],
                      ),
                      switchInCurve: Curves.easeInOut,
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
