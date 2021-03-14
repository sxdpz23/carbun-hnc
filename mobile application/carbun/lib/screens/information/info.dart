import 'package:carbun/helperFunctions/constants.dart';
import 'package:carbun/screens/information/blog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        itemCount: blogs.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(PageTransition(
              child: Blog(data: blogs[index]), type: PageTransitionType.fade)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Hero(
              tag: blogs[index].heading,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: blogs[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
