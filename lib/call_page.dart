import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';


class ZegoCallPage extends StatefulWidget {
  final String roomId;

  const ZegoCallPage({super.key, required this.roomId});

  @override
  State<ZegoCallPage> createState() => _ZegoCallPageState();
}

class _ZegoCallPageState extends State<ZegoCallPage> {
  Timer? _callTimer;

  @override
  void initState() {
    super.initState();

    // Start a 20-minute timer (1200 seconds)
    _callTimer = Timer(const Duration(minutes: 20), () {
      // Auto leave call after 20 minutes
      if (mounted) {
        Navigator.of(context).pop(); // Go back to previous page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('call is ended')),
        );
      }
    });
  }

  @override
  void dispose() {
    _callTimer?.cancel(); // Cancel timer if user leaves early
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Call')),
      body: ZegoUIKitPrebuiltCall(
        appID: 903242293, // Your ZEGO AppID
        appSign: 'fbf2b2e56424e1d986c781b2d2197af189ccc58ff4733694a63e2d05f75061fa', // Your ZEGO AppSign
        userID: DateTime.now().millisecondsSinceEpoch.toString(),
        userName: 'User-${DateTime.now().second}',
        callID: widget.roomId,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      ),
    );
  }
}
