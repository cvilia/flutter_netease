package com.cvilia.flutter_netease.utils.util

import com.tencent.mmkv.MMKV

/**
 * author: lzy
 * email: v_lizhenyu@tal.com
 * date: 2021-06-21-17:46
 * describe：描述
 *
 */
class MMKVUtil {

    companion object {
        //根据文档只有未执行初始化的时候才会为null，现在已确定执行了初始化
        private val instance = MMKV.defaultMMKV()!!

        @JvmStatic
        fun setInt(value: Int, key: String): Boolean {
            return instance.encode(key, value)
        }

        @JvmStatic
        fun setDouble(value: Float,key:String):Boolean{
            return instance.encode(key,value)
        }

        @JvmStatic
        fun setString(value: String, key: String): Boolean {
            return instance.encode(key, value)
        }

        @JvmStatic
        fun setBool(value: Boolean, key: String): Boolean {
            return instance.encode(key, value)
        }

        @JvmStatic
        fun getInt(defaultValue: Int, key: String): Int {
            return instance.getInt(key, defaultValue)
        }

        @JvmStatic
        fun getDouble(defaultValue: Float, key: String): Float {
            return instance.getFloat(key, defaultValue)
        }

        @JvmStatic
        fun getBool(defaultValue: Boolean, key: String): Boolean {
            return instance.getBoolean(key, defaultValue)
        }


        @JvmStatic
        fun getString(defaultValue: String, key: String): String? {
            return instance.getString(key, defaultValue)
        }
    }
}