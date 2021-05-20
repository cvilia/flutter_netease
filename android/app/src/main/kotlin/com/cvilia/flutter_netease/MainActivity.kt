package com.cvilia.flutter_netease

import com.cvilia.flutter_netease.bridge.NeteaseBridgeManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NeteaseBridgeManager.init(flutterEngine)
    }

}
