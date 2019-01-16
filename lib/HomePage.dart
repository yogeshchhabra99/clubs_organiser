import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:after_layout/after_layout.dart';
import 'Config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Modals.dart';
import 'SplashScreen.dart';
import 'Auth.dart';

class HomePage extends StatefulWidget {
  HomePage();
  static String tag = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  User user;
  bool slided = false;
  bool visible =true;
  AnimationController dpAnimationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
            child:ListView(
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage('assets/club.jpg')
                   // color: Colors.green[400],
                    ),
                  shape: BoxShape.circle,
                  ),
                ),
                new Center(child:Text(
                  "Club ${index+1}",
                  style: TextStyle(fontFamily: 'Karla', fontSize: 15),
                )),
                new Container(child:ListTile(
                  leading: new Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/dp2.jpeg'))),),
                  title: Text("Yogesh Chhabra"),
                ),),
                new Container(child:ListTile(
                  leading: new Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/vineet.png'))),),
                  title: Text("Vineet Madan"),
                ))
              ],
            ),
           ),
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
    SignIn.getUser().then((User user1)=>user=user1).then((e){
      print(e);
      Navigator.of(context).pushReplacementNamed(SplashScreen.tag);
    });
    dpAnimationController = new AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this)
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
  _launchUrl() async{
    const url ='https://github.com/vinx-2105/clubs_organiser';
    if(await canLaunch(url))
      await launch(url);
    else  
      throw 'could not launch';
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

  var currentNav = 1;
  final pageController = new PageController();
  _animate(){
          if(slided){
            dpAnimationController.forward();
            Timer(Duration(seconds: 1),(){
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
        slided=!slided;
          //initially slided is false so, when first time this function is called, animation goes reverse and changes the offset, object go out 
        }
  @override
  Widget build(BuildContext context) {
    final _drawer=new Drawer(
      child: new Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              child: new Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/iit_ropar.jpeg'),
                  fit: BoxFit.fill
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Your Profile",style: TextStyle(fontSize: 17),),
            ),
            new Divider(indent: 10,color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Join a club",style: TextStyle(fontSize: 17),),
            ),
            new Divider(indent: 10,color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.create),
              title: Text("Create a club",style: TextStyle(fontSize: 17),),
            ),
            new Divider(indent: 10,color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings",style: TextStyle(fontSize: 17),),
            ),
            new Divider(indent: 10,color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.build),
              title: Text("Contribute",style: TextStyle(fontSize: 17),),
              onTap: ()=>_launchUrl(),
            ),
            new Divider(indent: 10,color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.bug_report),
              title: Text("Report a bug",style: TextStyle(fontSize: 17),),
              onTap: (){},
            ),

          ],
        ),
      ),
    );
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
                  onPressed: (){
                    setState(() => {});
                    //(!_scaffoldKey.currentState.isDrawerOpen)?
                    _scaffoldKey.currentState.openDrawer();
                    //_scaffoldKey.currentState.;
                    },
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
              child:  SlideTransition(
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
                            begin: Offset(-20.00, 0.00),
                            end: Offset(00.00, 0.00))
                        .animate(CurvedAnimation(
                            parent: dpAnimationController,
                            curve: Interval(0.06, 0.60,curve: Curves.easeOut))),
                  )),
          new Expanded(flex: 5, child: new Container()),
          new Expanded(
              flex: 60,
              child:  SlideTransition(
                    child: new Container(
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(17, 17, 17, 5),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Text(
                              "${user.name}",
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
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(3),
                                              child: new Container(),
                                            ),
                                            Text(
                                              "$index Event Time",
                                              style: TextStyle(
                                                  fontFamily: 'Karla',
                                                  fontSize: 12,
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
                            begin: Offset(0.00, -20.00),
                            end: Offset(00.00, 0.00))
                        .animate(CurvedAnimation(
                            parent: dpAnimationController,
                            curve: Interval(0.06, 0.60,curve: Curves.easeOut)
                            )),
                  )),
        ],
      ),
    );
//---------------------------------topdetails-end---------------------------------//
    if (!slided) dpAnimationController.forward();
    int flex1=28 -(28* Tween<double>(begin:1.00,end:0.00).animate(CurvedAnimation(
                          parent: dpAnimationController,
                          curve: Interval(0.10, 0.25,curve: Curves.easeIn)
                        )).value).toInt();
    
    return Scaffold(
      key: _scaffoldKey,
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
                  flex: 4,
                  child: Container(),
                ),
                Expanded(
                  flex: flex1+3,
                  child: new GestureDetector(child: new Column(
                    children: <Widget>[
                      new Expanded(
                        flex:flex1,
                        child: (flex1>25)?topDetails:new Container(),
                      ),
                      new Expanded(
                        flex: 5,
                        child: Center(child:IconButton(icon:Icon(Icons.more_horiz,color: Colors.white,),onPressed: (){
                          _animate();
                        },)),
                      )
                    ],
                  ),
                  onHorizontalDragEnd: (DragEndDetails details){
                    Offset v=details.velocity.pixelsPerSecond;
                    print(v);
                    if(v.dy<-400 || v.dy>400){
                      _animate();
                    }                    
                  },
                  ),
                ),
                Expanded(
                  flex: 1,
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
        onPressed: ()=>_animate() 
      ),
      drawer: _drawer,
    );
  }
}
