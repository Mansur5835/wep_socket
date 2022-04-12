import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  static String SERVER = "wss://ws.bitstamp.net";
  static WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(SERVER));

  static void connectSocketChannel() {
    channel.sink.add(
      jsonEncode({
        "event": "bts:subscribe",
        "data": {"channel": "live_trades_btcusd"}
      }),
    );
  }

  static void closeSocketChannel() {
    channel.sink.close();
  }
}
