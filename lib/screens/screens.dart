import 'package:flutter/material.dart';
import 'package:seproject/constants/Color.dart';
import 'package:seproject/screens/setting.dart';
import 'package:seproject/constants/image.dart';
import 'package:seproject/main.dart';
import 'package:seproject/testModel/model.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => Screens_State();

// static void ImageType(BuildContext context, var image) {
//   final Screens_State state = context.findAncestorStateOfType<Screens_State>()!;
//   state.setImage(image);
// }
}

class Screens_State extends State<Screens> {
  var demo = "";
  // var scnum = 0;
  late TextEditingController textEditingController = TextEditingController();
  String get message => textEditingController.text;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: menu_highlite,
        title: const Text("새 채팅"),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      drawer: NavigationDrawerNew(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: MyApp.a == 0
                  ? Image(
                      image: AssetImage(mainimage),
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    )
                  : Text(demo),
            ),
            Expanded(
              // child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20), // 좌우 여백
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await MessageCheack(
                          //chatProvider: chatProvider
                      );
                    },
                    decoration: InputDecoration(
                        hintText: "메시지를 입력하세요!",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), //모서리 경계
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            MessageCheack(
                            //chatProvider: chatProvider
                            );
                            // MyApp.a = 1;
                            // Navigator.of(context).pushReplacement(  야매 창을 계속 띄워주는거
                            //     MaterialPageRoute(
                            //         builder: (context) => Screens()));
                            // print("test");
                            // await sendMe
                          },
                          // onPressed: () async {
                          //   scnum = 1;
                          //   print("test");
                          //   // await sendMe
                          // },
                          icon: Transform.rotate(
                            angle: 320,
                            child: Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            // ),
            // if (scnum==0){
            //    Image(image: AssetImage('image/test.png'));
            // }
            // Text("이미지")
          ],
        ),
      ),
    );
  }
 Future<void> MessageCheack() async {
   if (textEditingController.text.isEmpty) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(
           "글자를 입력해주세요.",
         ),
         backgroundColor: Colors.red,
       ),
     );
     return;
   }
   ChatModel chatModel = ChatModel(
     chat_room_id: 123456,
     msg: textEditingController.text,
     chatIndex: 0,
   );
   ChatRoomModel chatRoomModel = ChatRoomModel(title: "test"); //객체 생성

   chatRoomModel.add(chatModel); //객체 추가

   // print(chatRoomModel.get_chat());
   for (ChatModel chat in chatRoomModel.chatlist) {
     demo = demo + chat.msg + "\n";
   }
   print(",,,,찌방!!!1");
 }


}

class NavigationDrawerNew extends StatelessWidget {
  const NavigationDrawerNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: menu_highlite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildHeader(context),
                  buildMenuItems(context),
                ],
              ),
            ),
          ),
          buildsettings(context),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.all(24.0),
        child: Wrap(
          runSpacing: 20.0,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 25.0),
        child: Wrap(
          runSpacing: 10.0,
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: Icon(Icons.add, color: Colors.white),
              title: Text("New Chat"),
              titleTextStyle: TextStyle(color: Colors.white),
              onTap: () {
                MyApp.a = 0;
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => Screens()));
                //작동 시 DB리스트 출력
              },
            ),
          ],
        ),
      );

  Widget buildsettings(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(24.0),
        child: Wrap(
          runSpacing: 20.0,
          children: [
            Divider(color: Colors.white),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: Colors.white),
              title: Text('Settings'),
              titleTextStyle: TextStyle(color: Colors.white),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return setting();
                    });
                //   Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (context) => settings()));
              },
            ),
          ],
        ),
      );
}
