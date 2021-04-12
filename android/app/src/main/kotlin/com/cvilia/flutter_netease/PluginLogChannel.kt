package com.cvilia.flutter_netease

import android.util.Log
import io.flutter.plugin.common.MethodCall

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-04-12-1:53 PM
 * describe：描述
 *
 */


fun log(call: MethodCall) {
    val params: Map<String, String> = call.arguments as Map<String, String>

    val method: String = params["method"]!!
    val key: String = params["key"]!!
    val msg: String = params["message"]!!

    when (method) {
        "d" -> Log.d(key, msg)
        "i" -> Log.i(key, msg)
        "e" -> Log.e(key, msg)
        "w" -> Log.w(key, msg)
        "v" -> Log.v(key, msg)
        else -> Log.d(key, msg)
    }

}