import 'package:flutter/material.dart';
import 'Config.dart';
import 'dart:async';
import 'HomePage.dart';

class SplashScreen extends StatelessWidget{
  home(BuildContext context){
   // var duration= Duration(seconds: 2);
   // return new Timer(duration,(){
      Navigator.of(context).pushReplacementNamed(HomePage.tag);
   // });
  }


  static String tag='SplashScreen';
  @override
    Widget build(BuildContext context) {
        //home(context);
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(),
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: BoxDecoration(
                     color: Colors.white,
                     shape: BoxShape.circle,
                    ),
                    child: Center(child:Text("Logo here")),
                  ),
                ),
                
                new Expanded(
                  flex: 1,
                  child:Center(child: Text(Config.title,style: TextStyle(color: Config.primaryColor,fontSize: 40),),
                )),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    child: FlatButton(
                      
                      onPressed: ()=> home(context),
                      child: Text("ENTER",style:TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                          )
                        ),
                    ),
                    decoration: BoxDecoration(
                     // color: Colors.green[700],
                    ),
                  ),
                  
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(),
                ),                
              ],
            )
            
          ),
        
      );
      
    }
}