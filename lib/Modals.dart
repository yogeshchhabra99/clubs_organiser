import 'package:flutter/material.dart';

class Club{
 String id;
 AssetImage dp;
 String Name;
 List<User> coordinators;
 List<User> members;
}

class User{
 String id;
 List<Club> clubs;
 
}