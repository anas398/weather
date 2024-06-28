

import 'dart:async';

import 'package:flutter/material.dart';



class MessageBox extends StatefulWidget {
  final String msg;
  final String type;
  final String mode;
  final IconData ? icon;
  const MessageBox({Key? key, required this.msg, required this.type, required this.mode, this.icon}) : super(key: key);

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {

  @override
  void initState() {
    // TODO: implement initState
    fnTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
            color: 
            Colors.white, borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            widget.type != "CLOSE"?
            Row( 
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.cancel_outlined,size: 22,color: Colors.black,),
                )
              ],
            ):SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: 
                  widget.mode == "S"? Colors.greenAccent:widget.mode == "E"? Colors.redAccent: widget.mode == "W"? Colors.amber : widget.mode == "I"? Colors.blue : widget.mode == "C"? Colors.blue :Colors.tealAccent, 
              borderRadius: BorderRadius.circular(50)),
              child:  Icon(widget.mode == "S"? Icons.done_all_rounded:widget.mode == "E"? Icons.error: widget.mode == "W"? Icons.warning_amber_outlined : widget.mode == "I"? Icons.info_outline : widget.mode == "C"? widget.icon :Icons.message,color:widget.mode == "W"?  Colors.black: Colors.white,),
            ),
            SizedBox(height: 10),
            Expanded(child: Text(widget.msg.toString(),style: TextStyle(
              color: Colors.black,fontSize: 16
            ),))
          ],
        )

    );
  }
  //========================================PAGEFN

  fnTimer(){
    var duration = const Duration(seconds: 2);
    if(widget.type == "CLOSE"){
      return Timer(duration, route);
    }

  }
  route() async{
    if(mounted){
      Navigator.pop(context);
    }
  }
}
class PageDialog {
  Future<void> showMessage(context, msg, type, mode, icon) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            content: icon == ""
                ? MessageBox(msg: msg, type: type, mode: mode)
                : MessageBox(
              msg: msg,
              type: type,
              mode: mode,
              icon: icon,
            ));
      },
    );
  }
}


errorMsg(context,msg){
  PageDialog().showMessage(context, msg,"CLOSE","E","");
}