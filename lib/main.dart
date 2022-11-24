// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:expenser/pages/dataEntry.dart';
import 'package:expenser/pages/home.dart';
import 'package:flutter/material.dart';
import '../database/database.dart';
import 'globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Expense Manager', initialRoute: "/", routes: {
      "/": (context) => const Home(),
      "/dataEntry": (context) => const DataEntry()
    });
  }
}
