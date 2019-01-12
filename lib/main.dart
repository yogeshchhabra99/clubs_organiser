import 'package:flutter/material.dart';
import 'dart:async';
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
        primarySwatch: Colors.deepPurple,
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

class _MyHomePageState extends State<MyHomePage> {

  @override
    void initState() {
      // TODO: implement initState
      playNews();
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
                  icon: Icon(Icons.more_vert,color: (currentNav==0)?Colors.lightBlue[300]:Colors.white),
                  onPressed: ()=>setState(()=>currentNav=0),
                )),
                decoration: BoxDecoration(
                  color: (currentNav==0)?Colors.white:Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container( 
                child:Center(child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.home,color: (currentNav==1)?Colors.lightBlue[300]:Colors.white),
                  onPressed: ()=>setState(()=>currentNav=1),
                )),
                decoration: BoxDecoration(
                  color: (currentNav==1)?Colors.white:Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Container( 
                child:Center(child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.calendar_today,color: (currentNav==2)?Colors.lightBlue[300]:Colors.white),
                  onPressed: ()=>setState(()=>currentNav=2),
                )),
                decoration: BoxDecoration(
                  color: (currentNav==2)?Colors.white:Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(10)
                ),
              ),

            ],
          )),
          decoration: BoxDecoration(
            color: Colors.lightBlue[200],
          ),
        ),
      ),
      body: Center(
        child: new Container(
          padding: EdgeInsets.all(15),
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
                            child: new Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue[100],
                                  shape: BoxShape.circle),
                            )),
                        new Expanded(flex: 5, child: new Container()),
                        new Expanded(
                            flex: 60,
                            child: new Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue[100],
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
                                    flex: 3,
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
                            )),
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
                      padding: EdgeInsets.all(10),
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(10, (index) {
                          return Container(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.purple[100],
                                ),
                                child: Center(
                                    child: Text(
                                  "Item $index",
                                  style: TextStyle(
                                      fontFamily: 'Karla', fontSize: 15),
                                )),
                              ));
                        }),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
