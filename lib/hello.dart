import 'dart:async';

import 'package:flutter/services.dart';

class Hello {
  static const MethodChannel _channel = MethodChannel('hello');
  static const MethodChannel _channelLauncher =
      MethodChannel('ios_url_launcher');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> launchUrl(String url) async {
    await _channelLauncher.invokeMethod('launchUrl', url);
  }
}
