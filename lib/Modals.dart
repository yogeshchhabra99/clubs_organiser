import 'package:flutter/material.dart';

class Club{
 String id;
 AssetImage dp;
 String Name;
 List<User> coordinators;
 List<User> members;
 List<Events> eventsToAttend;
}

class User{
 String id;
 List<Club> clubs;
 String mobile_no;
}

class Events{
  String id;
  Club club;
  User organizer;
  DateTime dateTime;
  int peopleAttending;
}