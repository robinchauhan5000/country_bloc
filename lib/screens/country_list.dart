import 'package:country_list_bloc/model/country_model.dart';
import 'package:country_list_bloc/provider/country_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryBloc = Provider.of<CountryProvider>(context).countryBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: StreamBuilder<List<CountryModel>>(
          stream: countryBloc.country,
          builder: (context, snapshot) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  onTap: () {
                    print('index $index, id ${snapshot.data[index].id}');
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          }),
    );
  }
}
