import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wan_android/compents/provider_widget.dart';
import 'package:wan_android/viewmodel/person_view_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginKeyState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            //TODO:关闭当前页面
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          //背景
          Column(
            children: [
              Container(
                  height: ScreenUtil.getInstance().screenHeight / 4,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: FlutterLogo(
                      size: 90,
                    ),
                  )),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Positioned(
            top: ScreenUtil.getInstance().screenHeight / 5,
            left: 0.0,
            right: 0.0,
            child: Container(
                margin: EdgeInsets.all(
                    ScreenUtil.getInstance().getAdapterSize(20.0)),
                padding: EdgeInsets.all(
                    ScreenUtil.getInstance().getAdapterSize(20.0)),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2, //阴影范围
                        spreadRadius: 1, //阴影浓度
                        color: Colors.grey.withOpacity(0.5), //阴影颜色
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        ScreenUtil.getInstance().getAdapterSize(8.0))),
                child: ProviderWidget<LoginUserModel>(
                  model: LoginUserModel(),
                  builder: (context, model, child) {
                    return Form(
                      key: loginKeyState,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                suffixIcon: model.userName.isEmpty
                                    ? null
                                    : IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          model.clearText();
                                        },
                                      )),
                            onSaved: (value) {
                              model.setUserName(value);
                            },
                            onChanged: (value) {
                              model.setUserName(value);
                            },
                            controller: model.userNameController,
                            autovalidateMode: model.autovalidateMode,
                            validator: model.validateUserName,
                          ),
                          SizedBox(
                              height: ScreenUtil.getInstance()
                                  .getAdapterSize(10.0)),
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: model.isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    model.setObscure(!model.isObscure);
                                  },
                                )),
                            onSaved: (value) {
                              model.setUserPwd(value);
                            },
                            obscureText: model.isObscure,
                            controller: model.userPwdController,
                            autovalidateMode: model.autovalidateMode,
                            validator: model.validateUserPwd,
                          ),
                          SizedBox(
                              height: ScreenUtil.getInstance()
                                  .getAdapterSize(20.0)),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil.getInstance()
                                        .getAdapterSize(10.0)),
                                child: Text("登录"),
                              ),
                              onPressed: () {
                                model.submitForm(loginKeyState);
                              },
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "没有账号?去注册",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Fluttertoast.showToast(msg: "去注册");
                            },
                          )
                        ],
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
