import 'package:carbun/screens/carbonEmision/calculateOffset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/models/filtersCarbonEmission.dart';

class HeaderCaption extends StatelessWidget {
  final String heading;
  final Color color;
  HeaderCaption({Key key, this.heading, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Text(
        heading,
        textAlign: TextAlign.left,
        style: TextStyle(color: color, fontFamily: 'Itim'),
      ),
    );
  }
}

class Options extends StatefulWidget {
  final List<FilterOptions> list;
  Options({Key key, this.list}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selected = -1;
  List<FocusNode> focusList = [];
  List<TextEditingController> textList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.list.length; i++)
      widget.list[i].values == null
          ? focusList.add(FocusNode())
          : focusList.add(null);
    textList =
        List.generate(widget.list.length, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width,
        _height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 10.5),
      child: Column(
        children: <Widget>[
          Wrap(
            children: List.generate(
                widget.list.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() => selected = index);
                        if (widget.list[index].values != null)
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                    height: _height * 0.3,
                                    width: _width,
                                    color: primaryColor,
                                    child: CupertinoPicker.builder(
                                      backgroundColor: primaryColor,
                                      scrollController:
                                          FixedExtentScrollController(
                                              initialItem: 0),
                                      itemExtent: 50,
                                      useMagnifier: true,
                                      magnification: 1.5,
                                      onSelectedItemChanged: (num) =>
                                          setState(() {
                                        textList[index].text =
                                            widget.list[index].values[num];
                                        widget.list[index].output =
                                            widget.list[index].values[num];
                                      }),
                                      childCount:
                                          widget.list[index].values.length,
                                      itemBuilder: (context, i) => Container(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          widget.list[index].values[i],
                                          style: TextStyle(
                                              color: textColor,
                                              fontFamily: 'Itim'),
                                        ),
                                      ),
                                    ),
                                  ));
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 60.0,
                        width: _width,
                        margin: EdgeInsets.symmetric(vertical: 7.5),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: selected == index
                                ? [
                                    BoxShadow(
                                        color: Colors.black38, blurRadius: 15.0)
                                  ]
                                : [],
                            border: selected == index
                                ? Border.fromBorderSide(BorderSide.none)
                                : Border.all(
                                    color: accentColor.withAlpha(0x55))),
                        child: widget.list[index].values != null
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  textList[index].text == null ||
                                          textList[index].text == ''
                                      ? widget.list[index].label
                                      : textList[index].text,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: accentColor, fontFamily: 'Itim'),
                                ),
                              )
                            : TextField(
                                focusNode: focusList[index],
                                controller: textList[index],
                                autofocus: false,
                                decoration: InputDecoration(
                                    hintText: widget.list[index].label,
                                    hintStyle: TextStyle(
                                        color: accentColor, fontFamily: 'Itim'),
                                    border: InputBorder.none),
                                style: TextStyle(
                                    color: accentColor, fontFamily: 'Itim'),
                                onTap: () {
                                  setState(() => selected = index);
                                  focusList[index].requestFocus();
                                },
                                onChanged: (value) => setState(
                                    () => widget.list[index].output = value),
                              ),
                      ),
                    )),
          ),
          SizedBox(height: _height * 0.1),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: widget.list.contains('')
                ? SizedBox(height: _height * 0.1)
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageTransition(
                          child: CalculateOffset(selected: selectedFilter),
                          type: PageTransitionType.fade));
                    },
                    child: Container(
                      height: 60.0,
                      width: _width,
                      margin: EdgeInsets.symmetric(vertical: 25.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: secondaryColor),
                      child: Center(
                        child: Text(
                          'calculate & offset'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              letterSpacing: 2.0,
                              fontFamily: 'Itim'),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
