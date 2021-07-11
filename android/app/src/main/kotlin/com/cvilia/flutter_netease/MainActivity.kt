package com.cvilia.flutter_netease

import android.os.Bundle
import com.cvilia.flutter_netease.bridge.NeteaseBridgeManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    companion object{
        var mainActivity:MainActivity? = null
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mainActivity = this
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NeteaseBridgeManager.init(flutterEngine)
    }

}
