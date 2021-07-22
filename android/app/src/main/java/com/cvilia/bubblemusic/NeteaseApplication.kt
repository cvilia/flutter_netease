package com.cvilia.bubblemusic

import android.app.Application
import android.util.Log
import com.tencent.mmkv.MMKV
import io.flutter.app.FlutterApplication

/**
 * author: lzy
 * date: 1/6/21
 * describe：描述
 *
 */
class NeteaseApplication : FlutterApplication() {

    companion object{
        lateinit var app:Application
    }

    override fun onCreate() {
        super.onCreate()
        app = this
        initThird()
        if (BuildConfig.DEBUG) {
            Log.i("UMLog", "UMConfigure.init@NeteaseApplication")
        }

    }

    private fun initThird() {
        MMKV.initialize(this)
    }

}