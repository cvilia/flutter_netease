package com.cvilia.flutter_netease.utils

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import com.cvilia.bubblemusic.NeteaseApplication

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-05-20-17:16
 * describe：描述
 *
 */
class DeviceUtil {

    companion object {

        private fun getCapabilities(): NetworkCapabilities? {
            val manager: ConnectivityManager =
                NeteaseApplication.app.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
            val network: Network? = manager.activeNetwork
            return manager.getNetworkCapabilities(network)
        }

        @JvmStatic
        fun isWifi(): Boolean? {
            return getCapabilities()?.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)
        }

        @JvmStatic
        fun isMobile():Boolean?{
            return getCapabilities()?.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)
        }
    }

}