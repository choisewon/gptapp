import 'package:flutter/material.dart';
import 'package:seproject/main.dart';
import 'package:seproject/constants/Color.dart';
import 'package:seproject/constants/image.dart';
import 'package:seproject/screens/screens.dart';
import 'package:flutter/cupertino.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  setting_State createState() => setting_State();
}

class setting_State extends State<setting> {
  //bool _darkMode = MyApp.darkMode;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: Center(
          child: Text('darkmode')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
              value: MyApp.darkMode,
              onChanged: (value) {
                setState(() {
                  MyApp.darkMode = value;
                  if(value){
                    MyApp.ColorType(context, color_black);

                    mainimage = 'image/test2.png';
                    // Screens.ImageType(context,'image/test2.png');
                  }
                  else{
                    MyApp.ColorType(context, color_white);
                    mainimage = 'image/test.png';
                    // Screens.ImageType(context,'image/test.png');
                  }
                });
              }),
          // ElevatedButton(
          //     onPressed: () {
          //       //Navigator.of(context).pop()
          //     },
          //     child: Text('확인'))
        ],
      ),
    );
  }
}
