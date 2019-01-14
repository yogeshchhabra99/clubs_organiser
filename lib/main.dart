import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:after_layout/after_layout.dart';

void main() => runApp(MyApp());
/*colors(rgb)
(168,150,255)(184,174,246)(203,194,246)(221,214,256)
(191,153,253)(205,175,251)(221,191,253)(235,214,253)
(237,146,255)(237,173,251)(238,194,253)(246,215,255)
(251,153,228)(246,172,226)(255,191,238)(252,215,246)
*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Karla',
        primarySwatch: Colors.teal
        
      ),
      
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  bool slided=true;
  AnimationController dpAnimationController;
 // AnimationController detailsAnimationController;
 static var list = List<Container>.generate(10, (index) {
                          return Container(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: Text(
                                  "Item $index",
                                  style: TextStyle(
                                      fontFamily: 'Karla', fontSize: 15),
                                )),
                              ));
                        });
 var grids=GridView.count(
                        crossAxisCount: 2,
                        children: list,
                        shrinkWrap: true,
                      );
  @override
    void initState() {
      // TODO: implement initState
      
      dpAnimationController = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
        ..addListener(() {
                setState(() {
                  // the state that has changed here is the animation object’s value
                
                });
              });
      // dpAnimationController = new AnimationController(
      //   duration: const Duration(milliseconds: 4000), vsync: this)
      //   ..addListener(() {
      //           setState(() {
      //             // the state that has changed here is the animation object’s value
                
      //           });
      //         });
              playNews();
              
      //WidgetsBinding.instance.addPoseFrameCallback
      super.initState();
    }
  @override
    void dispose() {
        // TODO: implement dispose
      super.dispose();
    }
  playNews(){
    var duration= Duration(seconds: 2);
    return new Timer(duration,(){
      if(pageController.page!=3)
        pageController.nextPage(duration: Duration(milliseconds: 500),curve: Curves.easeIn);
      else  
        pageController.animateToPage(0, duration: Duration(milliseconds: 500),curve: Curves.easeIn);
        playNews();
    });
  }
  

  final pageController = new PageController();
  var currentNav=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomAppBar(
        elevation: 16,
        
        child: new Container(
          height: 50,
          child:  Container(
            padding: EdgeInsets.all(4),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container( 
                child:Center(child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.menu,color: (currentNav==0)?Colors.tealAccent[400]:Colors.white),
                  onPressed: ()=>setState(()=>currentNav=0),
                )),
                decoration: BoxDecoration(
                  color: (currentNav==0)?Colors.white:Colors.tealAccent[400],
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container( 
                child:Center(child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.home,color: (currentNav==1)?Colors.tealAccent[400]:Colors.white),
                  onPressed: ()=>setState(()=>currentNav=1),
                )),
                decoration: BoxDecoration(
                  color: (currentNav==1)?Colors.white:Colors.tealAccent[400],
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container( 
                child:Center(child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.calendar_today,color: (currentNav==2)?Colors.tealAccent[400]:Colors.white),
                  onPressed: ()=>setState(()=>currentNav=2),
                )),
                decoration: BoxDecoration(
                  color: (currentNav==2)?Colors.white:Colors.tealAccent[400],
                  borderRadius: BorderRadius.circular(10)
                ),
              ),

            ],
          )),
          decoration: BoxDecoration(
            color: Colors.tealAccent[400],
          ),
        ),
      ),
      body:new Container(
        decoration: BoxDecoration(
          /*image: DecorationImage(
            image: AssetImage('assets/bg2.png')
          )*/
          color: Colors.black
        ),
        //child: Center(
        child: new Container(
          padding: EdgeInsets.fromLTRB(10, 1, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(),
              ),
              Expanded(
                  flex: 29,
                  child: new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Expanded(
                            flex: 35,
                            child: RotationTransition(
                              turns: new Tween<double>(begin:4.00,end: 0.00).animate(
                                CurvedAnimation(
                                  parent: dpAnimationController,
                                  curve: Curves.elasticOut
                                )),
                              child:SlideTransition(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: new Container(
                                padding: EdgeInsets.all(2),
                                child: new Container(
                                  decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/dp2.jpeg'),
                                    fit: BoxFit.fill
                                    
                                  ),
                                  //color: Colors.orange,
                                  shape: BoxShape.circle),
                                ),,
                              )
                                
                                  //child: Image.asset('assets/dp2.jpeg',),
                                
                              ),
                              position: new Tween<Offset>(
                                begin:Offset(-200.00, 0.00),
                                end: Offset(00.00, 0.00)).animate(CurvedAnimation(
                                  parent: dpAnimationController,
                                  curve: Curves.easeOut
                                )),
                            ))),
                        new Expanded(flex: 5, child: new Container()),
                        new Expanded(
                          flex: 60,
                          child:RotationTransition(
                            turns: new Tween<double>(begin:4.00,end: 0.00).animate(
                              CurvedAnimation(
                                parent: dpAnimationController,
                                curve: Curves.elasticOut,
                              )),
                            child:SlideTransition(
                            child: new Container(
                              decoration: BoxDecoration(
                                  color: Colors.tealAccent[400],
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(19),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Yogesh Chhabra",
                                      style: TextStyle(
                                          fontFamily: 'Karla',
                                          fontSize: 23,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Indian Institute of Technlogy Ropar",
                                      style: TextStyle(
                                          fontFamily: 'Karla',
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: new Container(),
                                  ),
                                  Expanded(
                                      flex: 5,
                                      child: new Container(
                                        child:PageView(
                                          
                                          children:List.generate(4, (index){
                                            var col = Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "$index Club Name",

                                                  style: TextStyle(
                                                      fontFamily: 'Karla',
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(1),
                                                  child: new Container(),
                                                ),
                                                new Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "$index Event Name",
                                                      style: TextStyle(
                                                          fontFamily: 'Karla',
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(6),
                                                      child: new Container(),
                                                    ),
                                                    Text(
                                                      "$index Event Time",
                                                      style: TextStyle(
                                                          fontFamily: 'Karla',
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                )
                                              ]);
                                              return Container(child:col);
                                          }),
                                          controller: pageController,
                                          scrollDirection: Axis.horizontal,
                                    )
                                  )),
                                ],
                              ),
                            ),
                            position: new Tween<Offset>(
                                begin:Offset(0.00, -200.00),
                                end: Offset(00.00, 0.00)).animate(CurvedAnimation(
                                  parent: dpAnimationController,
                                  curve: Curves.easeOut
                              )
                            ),
                          )) 
                            
                            
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Container(),
              ),
              Expanded(
                  flex: 60,
                  child: new Container(
                      //color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
                      child: grids,
                    )
                  )
            ],
          ),
        //),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: (){
          (slided)?dpAnimationController.forward():dpAnimationController.reverse();
        //  (slided)?detailsAnimationController.forward():detailsAnimationController.reverse();
          slided=!slided;
        },
      ),
    );
  }
}
