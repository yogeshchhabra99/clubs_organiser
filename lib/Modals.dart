import 'package:flutter/material.dart';

class Club {
  String id;
  AssetImage dp;
  String name;
  List<User> coordinators;
  List<User> members;
  List<Events> eventsToAttend;

//  Club({id, dp, name, coordinators, members, eventsToAttend});
}

class User {
  String id;
  List<Club> clubs;
  String mobileNo;
  String college;
  String emailId;
  String name;

  User(
      {this.id,
      this.clubs,
      this.college,
      this.mobileNo,
      this.emailId,
      this.name});
}

class Events {
  String id;
  Club club;
  User organizer;
  DateTime dateTime;
  int peopleAttending;
}
