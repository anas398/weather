


import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              Image.asset("assets/img/nointernet.gif",width: 200,),
              Text('Connection Lost', style: TextStyle(
                fontSize: 15,color: Colors.black
              ),),
              Text('Server connection lost, try again',style: TextStyle(
                color: Colors.black,fontSize: 10
              ),),
              SizedBox(height: 10),
              Bounce(
                duration: const Duration(milliseconds: 110),
                onTap: (){
                 Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('Close', style: TextStyle(
                    fontSize: 12,color: Colors.black
                  ),),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
