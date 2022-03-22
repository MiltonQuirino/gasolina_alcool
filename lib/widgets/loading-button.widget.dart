import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  LoadingButton({
    required this.busy,
    required this.func,
    required this.invert,
    required this.text,
  });

  var busy = false;
  var invert = false;
  Function()? func;
  var text = "";

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: const EdgeInsets.all(30),
            height: 60,
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(60)),
            child: TextButton(
              child: Text(
                text,
                style: TextStyle(
                    color:
                        invert ? Colors.white : Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontFamily: "Big Sholders Display"),
              ),
              onPressed: func,
            ),
          );
  }
}
