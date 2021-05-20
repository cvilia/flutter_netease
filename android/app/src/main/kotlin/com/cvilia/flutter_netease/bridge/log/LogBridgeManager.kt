package com.cvilia.flutter_netease.bridge.log

import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-05-20-16:59
 * describe：日志通信
 *
 */
@Suppress("UNCHECKED_CAST")
class LogBridgeManager {

    companion object {
        private const val logChannelName: String = "com.cvilia.flutter.log/log"

        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            MethodChannel(
                flutterEngine.dartExecutor,
                logChannelName
            ).setMethodCallHandler { call, _ ->
                val params: Map<String, String> = call.arguments as Map<String, String>

                val method: String = call.method
                val key: String = params["key"]!!
                val msg: String = params["message"]!!

                when (method) {
                    "d" -> Log.d(key, msg)
                    "i" -> Log.i(key, msg)
                    "e" -> Log.e(key, msg)
                    "w" -> Log.w(key, msg)
                    "v" -> Log.v(key, msg)
                    else -> Log.d("NeteaseLogBridgeManager", "Flutter侧日志通信失败")
                }
            }
        }

    }

}