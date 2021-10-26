import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:venvice/view/chat/received_message.dart';
import 'package:venvice/view/chat/sended_message.dart';

class ChatPageView extends StatefulWidget {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  _ChatPageViewState createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  @override
  void initState() {
    super.initState();
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Halo Bang?',
        time: '21:36 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Mesin cuci saya rusak, kira2 abangnya bisa cek-kan?',
        time: '21:36 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Halo mas, boleh mas.. ada foto mesin cucinya?',
        time: '22:40 PM',
        isImage: false,
      ),
    ));
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: 'Ini Mas..',
        time: '22:57 PM',
        isImage: true,
        imageAddress: 'assets/images/ss_peps.png',
      ),
    ));
    childList.add(Align(
      alignment: Alignment(-1, 0),
      child: ReceivedMessageWidget(
        content: 'Oke siap mas, di tunggu yaa..',
        time: '22:40 PM',
        isImage: false,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    child: Container(
                      color: Colors.deepPurple.shade500,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              child: ClipRRect(
                                child: Container(
                                    child: SizedBox(
                                      child: Image.asset(
                                        "assets/images/ss_peps.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    color: Colors.amberAccent),
                                borderRadius: new BorderRadius.circular(50),
                              ),
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(0.0),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 2.0,
                                        offset: Offset(0.0, 2.0))
                                  ]),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Bang Tukang",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: childList,
                          )),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        maxLines: 20,
                        controller: _text,
                        decoration: InputDecoration(
                          suffixIcon: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.image),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          border: InputBorder.none,
                          hintText: "enter your message",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
