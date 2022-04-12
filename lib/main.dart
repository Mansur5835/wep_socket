import 'package:flutter/material.dart';
import 'package:no/wep_socket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? response;

  _initSocketServises() {
    SocketService.connectSocketChannel();

    SocketService.channel.stream.listen((data) {
      response = data.toString();
      print(response);
      setState(() {});
    }, onError: (error) {
      response = error.toString();
      print(response);

      setState(() {});
    });

    print(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSocketServises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              response != null ? response! : "no data",
            ),
          ],
        ),
      ),
    );
  }
}
