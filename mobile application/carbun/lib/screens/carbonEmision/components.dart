import 'package:carbun/models/filtersCarbonEmission.dart';
import 'package:flutter/material.dart';

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

class FlightOptions extends StatelessWidget {
  final List<FilterOptions> optionsList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18.0, left: 25.0),
      child: ListView.separated(itemBuilder: (context, index) => SizedBox(), separatorBuilder: (context, index) => SizedBox(), itemCount: ),
    );
  }
}
