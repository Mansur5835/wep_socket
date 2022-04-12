import 'package:flutter/material.dart';
import 'package:no/wep_socket.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SocketService.connectSocketChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: StreamBuilder(
          stream: SocketService.channel.stream,
          builder: (context, snapshot) {
            return Center(
              child: Text(snapshot.hasData != null
                  ? snapshot.data.toString()
                  : "no data"),
            );
          },
        ),
      ),
    );
  }
}
