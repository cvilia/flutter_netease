package com.cvilia.bubblemusic

import android.content.Intent
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    val channle_id: String = "com.cvilia.bubblemusic"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, channle_id).setMethodCallHandler { call, result ->
            run {
                var method: String = call.method
//                var params: Map<String, String> = call.arguments as Map<String, String>
                when (method) {
//                    "logd" -> Log.d(params["tag"], params["message"])
//                    "logv" -> Log.v(params["tag"], params["message"])
                    "play" -> startActivity(Intent(this, Test::class.java))
                    else -> Log.d("MainActivity", "参数错误")
                }
            }
        }
    }

}
