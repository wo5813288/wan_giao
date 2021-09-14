package com.lollipop.wan_android

import android.app.Activity
import android.content.pm.PackageManager
import com.pgyer.pgyersdk.PgyerSDKManager
import com.pgyer.pgyersdk.callback.CheckoutCallBack
import com.pgyer.pgyersdk.callback.CheckoutVersionCallBack
import com.pgyer.pgyersdk.model.CheckSoftModel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.lang.invoke.MethodHandle

/**
 * created by Lollipop
 * on 2021/9/13
 */
class CheckUpDatePGYPlugin(val ac:Activity) :MethodChannel.MethodCallHandler {
    companion object{
        fun register(flutterEngine: FlutterEngine,activity: MainActivity){
            val methodChannel = MethodChannel(flutterEngine.dartExecutor, "com.lollipop/check_update_plugin")
            methodChannel.setMethodCallHandler(CheckUpDatePGYPlugin(activity))
        }
    }
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if(call.method=="checkUpdate"){
            check(result)
        }
    }

    private fun check(result: MethodChannel.Result){
        //检查更新
        PgyerSDKManager.checkVersionUpdate(ac,object :CheckoutCallBack{

            override fun onNewVersionExist(model: CheckSoftModel?) {
                print(model);
                model?.let {
                    val remoteVersionSplit =it .buildVersion.split(".")
                    val packageManager = ac.packageManager
                    val localVersionSplit =
                        packageManager.getPackageInfo(ac.packageName,0).versionName.split(".")
                    val map = HashMap<String,Any>()
                    when{
                        remoteVersionSplit[0].toInt()>localVersionSplit[0].toInt()->{
                            map["isNewVersion"] = true

                        }
                        remoteVersionSplit[0].toInt()==localVersionSplit[0].toInt()
                                &&remoteVersionSplit[1].toInt()>localVersionSplit[1].toInt()->{
                            map["isNewVersion"] = true
                        }
                        remoteVersionSplit[1].toInt()==localVersionSplit[1].toInt()
                                &&remoteVersionSplit[2].toInt()>localVersionSplit[2].toInt()->{
                            map["isNewVersion"] = true
                        }
                    }

                    map["buildVersionName"] = model.buildVersion
                    map["downloadUrl"] = model.downloadURL
                    map["buildUpdateDescription"] = model.buildUpdateDescription
                    result.success(map)

                }


            }

            override fun onNonentityVersionExist(s: String?) {
                print(s);
                result.success(false)
            }

            override fun onFail(s: String?) {
                result.success(false)
            }


        })
    }
}