package com.lollipop.wan_android

import android.content.Context
import android.content.Intent
import android.icu.lang.UCharacter.GraphemeClusterBreak.L
import android.net.Uri
import android.os.Build
import androidx.core.content.FileProvider
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File


/**
 * created by Lollipop
 * on 2021/9/13
 */
class InstallApkPlugin(val context: Context) :MethodChannel.MethodCallHandler {
   companion object{
       fun register(flutterEngine: FlutterEngine,context: Context){
           val methodChannel = MethodChannel(flutterEngine.dartExecutor, "com.lollipop/install_apk_plugin")
           methodChannel.setMethodCallHandler(InstallApkPlugin(context))
       }
   }
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if(call.method=="installApk"){
            val path = call.argument<String>("apkPath")
            installApk(path!!,context)
            result.success(true)
        }else{
            result.notImplemented()
        }
    }

    private fun installApk(apkPath:String,context: Context){
        val intent = Intent(Intent.ACTION_VIEW)
        val file = File(apkPath)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            val apkUri: Uri = FileProvider.getUriForFile(context, "${context.packageName}.fileprovider", file)
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            intent.setDataAndType(apkUri, "application/vnd.android.package-archive")
        } else {
            val uri: Uri = Uri.fromFile(file)
            intent.setDataAndType(uri, "application/vnd.android.package-archive")
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(intent)
    }
}