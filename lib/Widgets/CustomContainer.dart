import 'dart:ui';

import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  const CustomContainer({Key key, this.child}) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            // color: Colors.grey[200],
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.shade200.withOpacity(0.5),
          ),
          child: new Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
