import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/models/users.dart';
import 'package:carbun/screens/authenticate/login.dart';
import 'package:carbun/services/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Coupons extends StatefulWidget {
  @override
  _CouponsState createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  final List<String> imageList = [
    'https://www.newsbharati.com/Encyc/2019/6/4/2_04_58_21_1596_1_H@@IGHT_531_W@@IDTH_800.jpg',
    'https://c.stocksy.com/a/8nGA00/z9/2447830.jpg',
    'https://www.prashantthakur.in/wp-content/uploads/2017/07/19756482_279885705819477_5779509052238496149_n.jpg',
    'https://i.ytimg.com/vi/GOpREnpIuTE/maxresdefault.jpg',
    'https://www.sayingtruth.com/wp-content/uploads/2017/08/tree-plantation-panchkula-selfi.jpg'
  ];
  int coupons = 0, plants = 0;

  @override
  void initState() {
    super.initState();
    plants = imageList.length;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context);
    final double _width = MediaQuery.of(context).size.width;

    return user == null
        ? Container(
            color: primaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: _width * 0.1),
                    child: Text(
                      'Login to start collecting coupons and vouchers and avail them',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'Itim',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(PageTransition(
                        child: Login(), type: PageTransitionType.fade)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: primaryColor,
                              letterSpacing: 4.0,
                              fontFamily: 'Itim'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container(
            color: primaryColor,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(25.0),
                  width: _width,
                  height: _width * 0.3,
                  child: Row(
                    children: List.generate(3, (index) {
                      String title, subtitle;
                      switch (index) {
                        case 0:
                          title = coupons.toString();
                          subtitle = 'coupons';
                          break;
                        case 1:
                          title = plants.toString();
                          subtitle = 'credits';
                          break;
                        case 2:
                          title = null;
                          subtitle = 'Sign-Out';
                      }
                      return Expanded(
                          child: GestureDetector(
                        onTap: () => index == 2
                            ? AuthenticationService().signOut()
                            : null,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              border: Border.symmetric(
                                  vertical: index == 1
                                      ? BorderSide(color: Colors.black26)
                                      : BorderSide.none)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Center(
                                child: title != null
                                    ? Text(
                                        title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: textColor,
                                            fontFamily: 'Inter',
                                            fontSize: 24.0),
                                      )
                                    : Icon(
                                        Feather.log_out,
                                        color: textColor,
                                        size: 24.0,
                                      ),
                              )),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  subtitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textColor,
                                      fontFamily: 'Itim',
                                      fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    }),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) => AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: imageList[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.0),
                      itemCount: imageList.length),
                )),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60.0,
                    width: _width,
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: plantAccent),
                    child: Center(
                      child: Text(
                        'new tree planted?'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primaryColor,
                            letterSpacing: 2.0,
                            fontFamily: 'Itim'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
