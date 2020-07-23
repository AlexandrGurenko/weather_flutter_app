import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: null,
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
              ),
              onPressed: null,
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _headerImage(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _weatherDescription(),
                  Divider(),
                  _temperature(),
                  Divider(),
                  _temperatureForecast(),
                  Divider(),
                  _footerRating(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Image _headerImage() {
    return Image(
      image: NetworkImage(
          "https://img.apmcdn.org/9d8714db45a8d7cd2dbc2e193a91681651243462/uncropped/1f6898-20141209-sunshine.jpg"),
      fit: BoxFit.cover,
    );
  }

  Column _weatherDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Tuesday - May 22",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Divider(),
        Text(
          lipsum.createWord(numWords: 100),
          style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }

  Row _temperature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "29° Clear",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Kiev",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Wrap _temperatureForecast() {
    return Wrap(
      spacing: 10,
      children: List.generate(8, (index) {
        return Chip(
          label: Text(
            '${index + 20}°C',
            style: TextStyle(fontSize: 15),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: Colors.grey)),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Row _footerRating() {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.black,
          size: 15,
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Info with openweathermap.org",
          style: TextStyle(fontSize: 15),
        ),
        stars,
      ],
    );
  }
}
