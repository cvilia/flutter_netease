package com.cvilia.bubblemusic

import android.util.Log
import io.flutter.app.FlutterApplication

/**
 * author: lzy
 * date: 1/6/21
 * describe：描述
 *
 */
class NeteaseApplication : FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        if (BuildConfig.DEBUG) {
            Log.i("UMLog", "UMConfigure.init@NeteaseApplication")
        }

    }

}