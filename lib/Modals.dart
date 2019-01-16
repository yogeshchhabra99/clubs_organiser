import 'package:flutter/material.dart';

class Club{
 String id;       //this is the firebase id 
 AssetImage dp;
 String Name;
 List<User> coordinators;
 List<User> members;
 List<Events> eventsToAttend;
 
}

class User{
 String id;       //this is the firebase id
 String name;
 List<Club> clubs;
 String mobileNo;
 User({this.id,this.name,this.clubs=null,this.mobileNo});
}

class Events{ 
  String id;        //this is the firebase id
  Club club;
  User organizer;
  DateTime dateTime;
  int peopleAttending;
}