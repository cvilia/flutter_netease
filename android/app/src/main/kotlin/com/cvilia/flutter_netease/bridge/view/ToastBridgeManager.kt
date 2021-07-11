
import android.widget.Toast
import com.cvilia.flutter_netease.MainActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * created by: cvilia
 * e-mail: cvilia@163.com
 * date: 2021-06-20-12:53
 * describe:
 */
class ToastBridgeManager {
    companion object{
        private const val toastChannelName:String = "com.cvilia.bubblemusic.ui/toast"
        @JvmStatic
        fun init(flutterEngine: FlutterEngine) {
            MethodChannel(flutterEngine.dartExecutor, toastChannelName).setMethodCallHandler { call, _ ->
                val message = call.arguments as String
                when(call.method){
                    "short"->Toast.makeText(MainActivity.mainActivity,message,Toast.LENGTH_SHORT).show()
                    "long"->Toast.makeText(MainActivity.mainActivity,message,Toast.LENGTH_LONG).show()
                }
            }
        }
    }
}