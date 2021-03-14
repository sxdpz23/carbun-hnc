import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/models/blogs.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Blog extends StatelessWidget {
  final BlogsData data;
  Blog({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: primaryColor),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Stack(
                  children: [
                    Hero(
                      tag: data.heading,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      top: 0.0,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25.0)),
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_back,
                                color: textColor, size: 30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(25.0),
                  child: Text(data.heading,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: accentColor,
                          fontFamily: 'Itim',
                          fontSize: 24.0,
                          letterSpacing: 1.0))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(data.data,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: textColor,
                          fontFamily: 'Itim',
                          fontSize: 18.0))),
              SizedBox(height: _width * 0.5)
            ],
          )),
        ),
      ),
    );
  }
}
