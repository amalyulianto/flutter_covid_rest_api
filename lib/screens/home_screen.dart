import 'package:covid_rest_api/app/services/api.dart';
import 'package:covid_rest_api/app/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _accessToken = "";

  void _updateAccessToken() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();
    setState(() {
      _accessToken = accessToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Rest API'),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        child: Text('+'),
        onPressed: () {
          _updateAccessToken();
        },
      ),
      body: Center(
        child: Text('$_accessToken'),
      ),
    );
  }
}
