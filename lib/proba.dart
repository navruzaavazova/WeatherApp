import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Search',
      home: CitySearchScreen(),
    );
  }
}

class CitySearchScreen extends StatefulWidget {
  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  List<String> _cities = [];
  TextEditingController _controller = TextEditingController();
  Dio _dio = Dio();
  final String _apiKey = 'aaf1c7acee10cea938a859d888778520';

  Future<void> _fetchCities(String query) async {
    if (query.length < 3) {
      setState(() {
        _cities.clear();
      });
      return;
    }

    try {
      final response = await _dio.get(
        'http://api.openweathermap.org/geo/1.0/direct',
        queryParameters: {
          'q': query,
          'limit': 50,
          'appid': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        setState(() {
          _cities = data.map<String>((city) => city['name'].toString()).toList();
        });
      }
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
              ),
              onChanged: (query) {
                _fetchCities(query);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_cities[index]),
                    onTap: () {
                      print('Selected city: ${_cities[index]}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
