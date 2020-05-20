import 'dart:math';

import 'package:beta_project/data/models/contact.dart';
import 'package:beta_project/data/models/device.dart';
import 'package:beta_project/data/models/member.dart';
import 'package:beta_project/data/models/room.dart';
import 'package:beta_project/data/models/scene.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';

/// Testing
const List<Scene> kScenes = [
  const Scene("Home", Feather.home),
  const Scene("Away", FlutterIcons.door_open_faw5s),
  const Scene("Sleep", EvaIcons.moonOutline),
  const Scene("Get up", EvaIcons.sunOutline),
];
const List<Room> kRooms = [
  const Room("Living Room", "assets/lr/lr.webp", 4),
  const Room("Bedroom", "assets/br/br.webp", 3),
  const Room("Kitchen", "assets/kt/kt.webp", 2),
];
final List<Device> kDevices = [
  Device("Light", FlutterIcons.oil_lamp_mco, Random().nextBool(),
      metadata: "60%"),
  Device("AC", FlutterIcons.snowflake_faw5s, Random().nextBool(),
      metadata: "23%"),
  Device("WiFi", EvaIcons.wifiOutline, Random().nextBool(), metadata: "On"),
  Device("Smart TV", FlutterIcons.tv_faw5s, Random().nextBool(),
      metadata: "Off"),
];

/// Visitors at the door
final kVisitors = <Visitor>[];
const List<Contact> kContacts = [
  const Contact(
      "Sarah Doe",
      "",
      "123",
      "https://images.unsplash.com/photo-1574981370294-edbbf06bb159?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Wife"),
  const Contact(
      "Samuel Bradley",
      "",
      "123",
      "https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Father"),
  const Contact(
      "Esther Mensah",
      "",
      "123",
      "https://images.unsplash.com/flagged/photo-1571837360114-edf5dba7b1dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Cousin"),
  const Contact(
      "Emmanuel Ashley",
      "",
      "123",
      "https://images.unsplash.com/photo-1526667900883-4a817696e7e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
      1234,
      "Brother"),
];
