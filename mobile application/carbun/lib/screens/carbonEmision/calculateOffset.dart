import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/models/filtersCarbonEmission.dart';
import 'package:carbun/shared/functions.dart';
import 'package:flutter/material.dart';

class CalculateOffset extends StatefulWidget {
  final Filters selected;
  CalculateOffset({Key key, this.selected}) : super(key: key);

  @override
  _CalculateOffsetState createState() => _CalculateOffsetState();
}

class _CalculateOffsetState extends State<CalculateOffset> {
  List<FilterOptions> selectedInfo = [];
  List<Widget> _list = [];
  List<String> labelList = [];
  bool plantClicked = false;

  String _captionText() {
    switch (widget.selected.label) {
      case 'Car':
        return selectedInfo[2].output;
        break;
      case 'Household':
        return selectedInfo[1].output;
        break;
      default:
        return '0';
    }
  }

  @override
  void initState() {
    super.initState();
    selectedInfo = widget.selected.screen.list;
    labelList = List.generate(selectedInfo.length,
        (index) => selectedInfo[index].label.toLowerCase());
    _list = List.generate(
        (widget.selected.label == 'Flight') ||
                (widget.selected.label == 'Cruise') ||
                (widget.selected.label == 'Footprint')
            ? 1
            : 2,
        (index) => DecoratedBox(
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(color: Colors.black38, blurRadius: 20.0)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        index == 0
                            ? (widget.selected.label == 'Flight'
                                ? CalculatorFunctions()
                                    .calculateForPlane(distance: 1100)
                                    .toInt()
                                    .toString()
                                : CalculatorFunctions()
                                    .calculateForCar(
                                        fuel: int.parse(selectedInfo[2].output))
                                    .toString())
                            : _captionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: textColor,
                            fontFamily: 'Inter',
                            fontSize: 36.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      index == 0 ? 'C02 Amount (kg)' : 'Fuel Consumption (kg)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: secondaryColor,
                          fontFamily: 'Itim',
                          fontSize: 16.0),
                    ),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: primaryColor,
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 100.0,
                width: _width,
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: textColor,
                      iconSize: 30.0,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: widget.selected.label == 'Flight' ||
                              widget.selected.label == 'Car'
                          ? Text(
                              (widget.selected.label == 'Car'
                                      ? selectedInfo[0].output
                                      : '1100') +
                                  ' km',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.red[600],
                                  fontFamily: 'Inter',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18.0),
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: _width * 0.225,
                      height: _width * 0.225,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0.0,
                            top: 0.0,
                            right: _width * 0.03,
                            bottom: _width * 0.03,
                            child: Hero(
                              tag: heroTagCarbonPlant,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Icon(widget.selected.icon,
                                      color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0.0,
                            bottom: 0.0,
                            child: Container(
                              height: _width * 0.08,
                              width: _width * 0.08,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 15.0,
                                        offset: Offset(2, 2))
                                  ]),
                              child: Center(
                                child: Text('C',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: textColor,
                                        fontFamily: 'Inter',
                                        fontSize: 18.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    widget.selected.label == 'Flight'
                        ? Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: RichText(
                                text: TextSpan(
                                    text: selectedInfo[0].output,
                                    style: TextStyle(
                                      color: textColor,
                                      fontFamily: 'Itim',
                                      fontSize: 24.0,
                                      letterSpacing: 1.0,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              '\nTo ' + selectedInfo[1].output,
                                          style: TextStyle(fontSize: 20.0)),
                                      (widget.selected.label == 'Flight' &&
                                              selectedInfo[2].output != null)
                                          ? TextSpan(
                                              text: '\nVia ' +
                                                  (widget.selected.label ==
                                                          'Flight'
                                                      ? selectedInfo[2].output
                                                      : ''),
                                              style: TextStyle(fontSize: 18.0))
                                          : TextSpan(text: ' '),
                                    ]),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(
                      _list.length,
                      (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: _width * 0.3,
                            width: _width * 0.35,
                            child: _list[index],
                          )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: RichText(
                  text: TextSpan(
                      text: 'In order to stop climate change, ',
                      style: TextStyle(
                          color: textColor, fontFamily: 'Itim', fontSize: 16.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: '0.011 t C02',
                            style:
                                TextStyle(color: accentColor, fontSize: 20.0)),
                        TextSpan(
                            text:
                                ' is the maximum amount of CO2 that can be generated by a single person in a week.')
                      ]),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: RichText(
                  text: TextSpan(
                      text:
                          'The average weekly amount of CO2 generated by a single person is ',
                      style: TextStyle(
                          color: textColor, fontFamily: 'Itim', fontSize: 16.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: '0.16 t CO2',
                            style:
                                TextStyle(color: accentColor, fontSize: 20.0)),
                        TextSpan(text: '.')
                      ]),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    switchInCurve: Curves.easeInOut,
                    child: plantClicked
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 30.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                            'The average weekly amount of CO2 generated by a single young tree is ',
                                        style: TextStyle(
                                            color: textColor,
                                            fontFamily: 'Itim',
                                            fontSize: 16.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '0.23 CO2',
                                              style: TextStyle(
                                                  color: plantAccent,
                                                  fontSize: 20.0)),
                                          TextSpan(text: '.')
                                        ]),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 30.0),
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'You need to plant ',
                                        style: TextStyle(
                                            color: textColor,
                                            fontFamily: 'Itim',
                                            fontSize: 16.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '4 trees',
                                              style: TextStyle(
                                                  color: plantAccent,
                                                  fontSize: 20.0)),
                                          TextSpan(text: '.')
                                        ]),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => plantClicked = !plantClicked),
                              child: Container(
                                height: 60.0,
                                width: _width,
                                margin: EdgeInsets.symmetric(vertical: 25.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: plantAccent),
                                child: Center(
                                  child: Text(
                                    'plant trees'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: primaryColor,
                                        letterSpacing: 2.0,
                                        fontFamily: 'Itim',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
