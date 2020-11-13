import 'dart:async';

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

import './videocall.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  final _channel = 'randdgecb';

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      onJoin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/splash.png'),
      ),
    );
  }

  Future<void> onJoin() async {
    await _handleCameraAndMic();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCall(
          channelName: _channel,
          role: _role,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.storage.request();
  }
}
