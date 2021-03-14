import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFF00919E),
          size: 50.0,
        ),
      ),
    );
  }
}
