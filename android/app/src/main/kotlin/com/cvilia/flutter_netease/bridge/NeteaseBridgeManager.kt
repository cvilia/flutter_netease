package com.cvilia.flutter_netease.bridge

import com.cvilia.flutter_netease.bridge.log.LogBridgeManager
import com.cvilia.flutter_netease.bridge.mmkv.MMKVBridgeManager
import com.cvilia.flutter_netease.bridge.net.NetStatusBridgeManager
import io.flutter.embedding.engine.FlutterEngine

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-05-20-16:55
 * describe：通信管理工具
 *
 */
class NeteaseBridgeManager {

    companion object {
        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            LogBridgeManager.init(flutterEngine)
            NetStatusBridgeManager.init(flutterEngine)
            MMKVBridgeManager.init(flutterEngine)
            ToastBridgeManager.init(flutterEngine)
        }
    }

}