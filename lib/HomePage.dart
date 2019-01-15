import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:after_layout/after_layout.dart';
import 'Config.dart';

class HomePage extends StatefulWidget {
  HomePage();
  static String tag = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool slided = false;
  bool visible =true;
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
            style: TextStyle(fontFamily: 'Karla', fontSize: 15),
          )),
        ));
  });
  var grids = GridView.count(
    crossAxisCount: 2,
    children: list,
    shrinkWrap: true,
  );
  @override
  void initState() {
    // TODO: implement initState

    dpAnimationController = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    playNews();
        super.initState();
  }

  @override
  void dispose() {
    dpAnimationController.dispose();
    super.dispose();
  }

  playNews() {
    var duration = Duration(seconds: 2);
    return new Timer(duration, () {
      if (pageController.page != 3)
        pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      else
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      playNews();
    });
  }

  var currentNav = 0;
  final pageController = new PageController();

  @override
  Widget build(BuildContext context) {

//---------------------------------------bottombar---------------------------------------------//
    final bottomBar = new Container(
      height: 50,
      child: Container(
          padding: EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Center(
                    child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.menu,
                      color: (currentNav == 0)
                          ? Colors.greenAccent[400]
                          : Colors.white),
                  onPressed: () => setState(() => currentNav = 0),
                )),
                decoration: BoxDecoration(
                    color: (currentNav == 0)
                        ? Colors.white
                        : Colors.greenAccent[400],
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                child: Center(
                    child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.home,
                      color: (currentNav == 1)
                          ? Colors.greenAccent[400]
                          : Colors.white),
                  onPressed: () => setState(() => currentNav = 1),
                )),
                decoration: BoxDecoration(
                    color: (currentNav == 1)
                        ? Colors.white
                        : Colors.greenAccent[400],
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                child: Center(
                    child: IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: Icon(Icons.calendar_today,
                      color: (currentNav == 2)
                          ? Colors.greenAccent[400]
                          : Colors.white),
                  onPressed: () => setState(() => currentNav = 2),
                )),
                decoration: BoxDecoration(
                    color: (currentNav == 2)
                        ? Colors.white
                        : Colors.greenAccent[400],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          )),
      decoration: BoxDecoration(color: Colors.greenAccent[400], boxShadow: [
        new BoxShadow(
          color: Colors.black,
          blurRadius: 15.0,
        ),
      ]),
    );
//-------------------------------bottom nav bar end---------topdetails-begin------------------------------------------------//

    final topDetails = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
              flex: 35,
              child: RotationTransition(
                  turns: new Tween<double>(begin: 0.00, end: 0.00).animate(
                      CurvedAnimation(
                          parent: dpAnimationController, curve: Curves.easeIn)),
                  child: SlideTransition(
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: new Container(
                          padding: EdgeInsets.all(2),
                          child: new Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                image: DecorationImage(
                                    image: AssetImage('assets/dp2.jpeg'),
                                    fit: BoxFit.fill),
                                //color: Colors.orange,
                                shape: BoxShape.circle),
                          ),
                        )

                        //child: Image.asset('assets/dp2.jpeg',),

                        ),
                    position: new Tween<Offset>(
                            begin: Offset(-50.00, 0.00),
                            end: Offset(00.00, 0.00))
                        .animate(CurvedAnimation(
                            parent: dpAnimationController,
                            curve: Curves.easeOut)),
                  ))),
          new Expanded(flex: 5, child: new Container()),
          new Expanded(
              flex: 60,
              child: RotationTransition(
                  turns: new Tween<double>(begin: 0.00, end: 0.00)
                      .animate(CurvedAnimation(
                    parent: dpAnimationController,
                    curve: Curves.elasticIn,
                  )),
                  child: SlideTransition(
                    child: new Container(
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
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
                                  child: PageView(
                                children: List.generate(4, (index) {
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
                                              padding: EdgeInsets.all(6),
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
                                  return Container(child: col);
                                }),
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                              ))),
                        ],
                      ),
                    ),
                    position: new Tween<Offset>(
                            begin: Offset(0.00, -50.00),
                            end: Offset(00.00, 0.00))
                        .animate(CurvedAnimation(
                            parent: dpAnimationController,
                            curve: Curves.easeOut)),
                  ))),
        ],
      ),
    );
//---------------------------------topdetails-end---------------------------------//
    if (!slided) dpAnimationController.forward();

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 16,
        child: bottomBar,
      ),
      body: new Container(
          decoration: BoxDecoration(
              /*image: DecorationImage(
            image: AssetImage('assets/bg2.png')
          )*/
              color: Colors.black),
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
                  child: topDetails,
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Expanded(
                    flex: 60,
                    child: new Container(
                     
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
                      child: grids,
                    ))
              ],
            ),
            
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          if(slided){
            dpAnimationController.forward();
            Timer(Duration(seconds:1),(){
              //animate the expanded box by changing the flex
              // make it go up
              });
          }
          else{
              Timer(Duration(seconds:1),(){
              //animate the expanded box by changing the flex
              // make it go down
              });
              dpAnimationController.reverse();
          }
        
          //initially slided is false so, when first time this function is called, animation goes reverse and changes the offset, object go out 
        },
      ),
    );
  }
}
