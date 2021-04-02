import 'package:country_list_bloc/provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/country_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CountryList(),
      ),
    );
  }
}
