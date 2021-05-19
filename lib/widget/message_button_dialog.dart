import 'package:flutter/material.dart';

class MessageButtonDialog extends StatelessWidget {
  final String message;
  final String buttonText;
  final Function? onTap;

  MessageButtonDialog(
      {required this.message, this.buttonText = '确定', this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 240,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 15, color: Colors.black, wordSpacing: 1.2),
                  ),
                ),
                flex: 2,
              ),
              Divider(
                height: 1,
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                    ),
                  ),
                ),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
