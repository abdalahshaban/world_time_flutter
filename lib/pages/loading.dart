import 'package:flutter/material.dart';
import 'package:WorldTime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async {
  //   Response response =
  //       await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data['title']);
  // }

  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'cairo', flag: 'cairo.png', url: 'Africa/Cairo');
    await instance.getTime();
    print(instance.time);
    // Navigator.pushNamed(context,'/home');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    // getData();
    // getTime();
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.pink,
          size: 50,
        ),
      ),
    );
  }
}
