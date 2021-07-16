import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wan_android/controller/person/express_delivery_controller.dart';
import 'package:wan_android/theme/app_color.dart';
import 'package:wan_android/theme/app_style.dart';

class ExpressDeliveryPage extends GetView<ExpressDeliveryController> {
  var textController = TextEditingController(text: "804967979558203287");
  ExpressDeliveryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("快递查询"),
      ),
      body: Container(
        child: Column(
          children: [
            _searchNumber(),
            _expressDeliver(),
            Expanded(child: _expressTrajectory()),
          ],
        ),
      ),
    );
  }

  ///快递单号输入框
  Widget _searchNumber() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.blue),
          color: Colors.blue,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
                cursorColor: Colors.blue,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onChanged: (value) {
                  if(value.length>=13) {
                    controller.getExpressBySingleNumber(value);
                  }
                },
                controller: textController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                    EdgeInsets.only(left: 8.w, top: 0, right: 8.w, bottom: 0),
                    hintText: "请输入快递单号",
                    border: kInputBorder,
                    focusedBorder: kInputBorder),
              )
            ),
            SizedBox(width: 10.w),
            ElevatedButton(
              child: Text("查询"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue)
              ),
              onPressed: (){
                if(textController.text.isEmpty){
                  showToast("请输入快递单号");
                  return;
                }
                controller.queryExpressInfo(textController.text,controller.logisticsTypeId.value);
              },
            )
          ],
        ));
  }

  ///快递公司名称
  Widget _expressDeliver() {
    return Container(
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.blue),
          color: Colors.blue,
        ),
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
        child: Row(
          children: [
            Text("快递公司"),
            SizedBox(width: 5.w),
            Text("|"),
            SizedBox(width: 5.w),
            Obx(() => TextButton(
                  child: Text(
                    controller.logisticsTypeName.value,
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                  onPressed: () {

                  },
                ))
          ],
        ));
  }

  ///快递轨迹记录
  Widget _expressTrajectory(){
    return Obx((){
      return controller.logistics.value.data!=null?ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context,index){
          return Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 35.w),
                width: 1.w,
                height: 30.h,
                color: Colors.grey.withOpacity(0.8),
              )
            ],
          );
        },
        itemBuilder: (context,index){
          var trajectory = controller.logistics.value.data[index];
          String date = trajectory.time.split(" ")[0];
          String time =  trajectory.time.split(" ")[1];
          String desc = trajectory.desc;
          return Container(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(time,style: TextStyle(color: Colors.black,fontSize: 15.sp)),
                    Text(date,style: TextStyle(color: KColors.kMessageBgDarkColor,fontSize: 12.sp)),
                  ],
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(desc,style: TextStyle(color: Colors.black,fontSize: 15.sp))
                )
              ]
            ),
          );
        },
        reverse:true ,
        itemCount: controller.logistics.value.data.length,
      ):Container();
    });
  }

  ///热门快递
  Widget _hotExpressDelivery() {
    return Obx(() {
      return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              controller.expressDeliverys[index].logisticsName,
              style: TextStyle(color: Colors.black),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1.h, color: KColors.kMessageBgLightColor);
        },
        itemCount: controller.expressDeliverys.length,
      );
    });
  }
}
