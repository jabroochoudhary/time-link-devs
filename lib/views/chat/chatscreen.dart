import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
import 'package:flutter/cupertino.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  DateTime sendTime;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.sendTime});
}

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController mesgCtrl = new TextEditingController();
  String hours = "";
  String minuts = "";

  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello, Will",
        messageType: "receiver",
        sendTime: DateTime.now()),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        sendTime: DateTime.now()),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        sendTime: DateTime.now()),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        sendTime: DateTime.now()),
    ChatMessage(
        messageContent: "Is there any thing wrong?",
        messageType: "sender",
        sendTime: DateTime.now()),
  ];
  bool isMic = true;
  ScrollController _scrollController = ScrollController(keepScrollOffset: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final DateTime _time = DateTime.now();
    hours = _time.hour.toString();
    minuts = _time.minute.toString();
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: customAppbar(
            isBackIcon: true,
            isChat: true,
            // defaultBackIcon: false,
            onPressedIconBack: (() {
              Navigator.pop(context);
            })),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.only(bottom: 50),
              color: const Color(0xffF9FCFF),
              child: ListView.builder(
                itemCount: messages.length,
                controller: _scrollController,
                shrinkWrap: true,
                dragStartBehavior: DragStartBehavior.down,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width * 0.7),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                messages[index].messageType == "receiver"
                                    ? const BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      )
                                    : const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                            color: (messages[index].messageType == "receiver"
                                ? const Color.fromARGB(255, 205, 198, 198)
                                : const Color(0xffDCF7C5)),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messages[index].messageContent,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(81, 158, 158, 158),
                                    borderRadius: BorderRadius.circular(6)),
                                // color: Colors.red,
                                alignment: Alignment.bottomRight,
                                width: 60,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${messages[index].sendTime.minute}:${messages[index].sendTime.hour}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    const Icon(
                                      Icons.done_all_rounded,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: EdgeInsets.only(bottom: 100),
              color: Color(0xffEFEFEF),
              width: width,
              child: Row(
                children: [
                  const SizedBox(
                    width: 13,
                  ),
                  const Icon(
                    Icons.add,
                    color: Color(0xff007AFF),
                    size: 35,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                    width: width * 0.6,
                    height: 55,
                    child: TextField(
                      // textAlign: TextAlign.center,
                      controller: mesgCtrl,
                      onSubmitted: ((value) {
                        sendMessage(mesgCtrl.text, isMic, context);
                      }),
                      onChanged: (msg) {
                        if (msg.length == 1) {
                          setState(() {
                            isMic = false;
                            print("mic val=  $isMic ");
                          });
                        } else if (msg.length == 0) {
                          setState(() {
                            isMic = true;
                            print("mic val=  $isMic ");
                          });
                        }
                      },

                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        suffixIcon: Icon(Icons.insert_drive_file_outlined),
                        suffixIconColor: Color(0xff007AFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xff007AFF),
                    size: 35,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: (() {
                      sendMessage(
                        mesgCtrl.text,
                        isMic,
                        context,
                      );
                    }),
                    child: Icon(
                      isMic ? Icons.mic_none : Icons.send,
                      color: const Color(0xff007AFF),
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text, bool isMic, BuildContext context) {
    if (!isMic) {
      Random r = new Random();
      int isSender = r.nextInt(2);
      messages.add(ChatMessage(
          messageContent: mesgCtrl.text,
          messageType: isSender == 1 ? "sender" : "receiver",
          sendTime: DateTime.now()));
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100), curve: Curves.easeOut);
      mesgCtrl.clear();
      setState(() {
        isMic = true;
      });
    }
  }
}
