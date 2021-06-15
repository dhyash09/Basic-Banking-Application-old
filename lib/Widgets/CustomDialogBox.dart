import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;
  final Function onPressed;
  final bool isSuccess;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.onPressed,
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 120,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(
            top: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isSuccess ? Colors.greenAccent[700] : Colors.red,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: onPressed,
                  child: Text("Ok"),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 16,
          right: 16,
          child: isSuccess ? SvgPicture.asset(
            'assets/icons/successful.svg',
            width: 100,
            height: 100,
          ) : SvgPicture.asset(
            'assets/icons/unsuccessful.svg',
            width: 100,
            height: 100,
          ),
        )
      ],
    );
  }
}
