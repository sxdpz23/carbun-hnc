import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/screens/home/dock.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  PageController _controller;
  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    currentPageValue = 1.0;
    _controller = PageController(
      initialPage: currentPageValue.toInt(),
      keepPage: true,
      viewportFraction: 1,
    );
    _controller.addListener(() {
      setState(() => currentPageValue = _controller.page);
    });
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  navigationFunction(int page) {
    page > currentPageValue
        ? _animationController.reverse()
        : _animationController.forward();
    _controller.animateToPage(page,
        duration: Duration(microseconds: 900), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 100.0,
                width: _width,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 10.0)
                    ],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0))),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: '',
                        style: TextStyle(
                            color: accentColor,
                            fontFamily: 'Itim',
                            fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(text: 'carbun\n'),
                          TextSpan(
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 30.0,
                                  letterSpacing: 4.0),
                              text: categories[currentPageValue.toInt()]
                                  .title
                                  .toUpperCase()),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(
                    categories.length,
                    (int index) => categories[index].navigateTo,
                  ),
                  onPageChanged: (int newPage) {
                    currentPageValue = newPage.toDouble();
                  },
                ),
              ),
              Dock(
                height: 70.0,
                width: _width,
                currentPage: currentPageValue.toInt(),
                navigationFunction: (value) => navigationFunction(value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
