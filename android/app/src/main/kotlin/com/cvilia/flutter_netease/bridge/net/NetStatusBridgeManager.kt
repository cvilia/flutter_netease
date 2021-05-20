package com.cvilia.flutter_netease.bridge.net

import com.cvilia.flutter_netease.utils.DeviceUtil
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-05-20-17:10
 * describe：描述
 *
 */
class NetStatusBridgeManager {

    companion object {
        private const val channelName = "com.cvilia.flutter.net/net.status"

        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            MethodChannel(
                flutterEngine.dartExecutor,
                channelName
            ).setMethodCallHandler { call, result ->
                val method = call.method
                when (method) {
                    "hasNet" -> {
                    }
                    "isAvailable" -> {
                    }
                    "is4G" -> {
                    }
                    "is5G" -> {
                    }
                    "isWifi" -> result.success(DeviceUtil.isWifi())
                    "isMobile" -> result.success(DeviceUtil.isMobile())
                    "getNetType" -> {
                    }
                }
            }
        }
    }

}