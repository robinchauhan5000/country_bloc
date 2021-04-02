import 'package:country_list_bloc/bloc/country_bloc.dart';
import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  CountryBloc _countryBloc;

  CountryProvider() {
    _countryBloc = CountryBloc();
  }

  CountryBloc get countryBloc => _countryBloc;
}
