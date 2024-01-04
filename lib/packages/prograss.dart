import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String message;

  const ProgressDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20.0),
              Text(
                message,
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
