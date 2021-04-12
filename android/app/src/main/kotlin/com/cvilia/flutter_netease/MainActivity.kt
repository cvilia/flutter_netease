package com.cvilia.flutter_netease

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

const val channelId = "com.cvilia.bubble-log"

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, channelId).setMethodCallHandler { call, result ->
            run {
                val method: String = call.method
                when (method) {
                    "log" -> log(call)
                }
            }
        }
    }

}
