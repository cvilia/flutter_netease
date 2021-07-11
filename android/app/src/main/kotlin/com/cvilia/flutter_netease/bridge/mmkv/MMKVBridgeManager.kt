package com.cvilia.flutter_netease.bridge.mmkv

import com.cvilia.flutter_netease.utils.util.MMKVUtil
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-06-21-17:44
 * describe：描述
 *
 */
class MMKVBridgeManager {
    companion object {
        private const val mmkvChannel = "com.cvilia.bubblemusic.io/mmkv"

        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            MethodChannel(
                flutterEngine.dartExecutor,
                mmkvChannel
            ).setMethodCallHandler { call, result ->
                val map = call.arguments as Map<*, *>
                val key: String = map["key"] as String
                when (call.method) {
                    "setInt" -> result.success(MMKVUtil.setInt(map["value"] as Int, key))
                    "setDouble" -> result.success(MMKVUtil.setDouble(map["value"] as Float, key))
                    "setString" -> result.success(MMKVUtil.setString(map["value"] as String, key))
                    "setBool" -> result.success(MMKVUtil.setBool(map["value"] as Boolean, key))
                    "getInt" -> {
                        val intValue = MMKVUtil.getInt(map["defaultValue"] as Int, key)
                        result.success(intValue)
                    }
                    "getDouble" -> {
                        val doubleValue = MMKVUtil.getDouble(map["defaultValue"] as Float, key)
                        result.success(doubleValue)
                    }
                    "getString" -> {
                        val stringValue = MMKVUtil.getString(map["defaultValue"] as String, key)
                        result.success(stringValue)
                    }
                    "getBool" -> {
                        val boolValue = MMKVUtil.getBool(map["defaultValue"] as Boolean, key)
                        result.success(boolValue)
                    }
                }
            }
        }
    }
}