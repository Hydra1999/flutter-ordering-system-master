import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'Welcome.dart';
import 'models/user.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/";

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();

    _pwdEditController.addListener(() => setState(() => {}));
    _userNameEditController.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<UserStatus>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.turned_in),
        title: Text("员工登录"),
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildImage(),
            SizedBox(
              height: 40,
            ),
            buildEditWidget(context),
            buildLoginButton(loginStatus)
          ],
        ),
      ),
    );
  }

  /// 头部
  Widget buildImage() {
    return Image.asset(
      'images/timg.jpg',
      fit: BoxFit.contain,
    );
  }

  Widget buildEditWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: <Widget>[
          buildLoginNameTextField(),
          SizedBox(height: 20.0),
          buildPwdTextField(),
        ],
      ),
    );
  }

  Widget buildLoginNameTextField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16,
            top: 11,
            width: 18,
            height: 18,
            child: Icon(Icons.person),
          ),
          Positioned(
            left: 45,
            top: 10,
            bottom: 10,
            width: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 55,
            right: 10,
            top: 10,
            height: 30,
            child: TextField(
              controller: _userNameEditController,
              focusNode: _userNameFocusNode,
              decoration: InputDecoration(
                hintText: "请输入用户名",
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPwdTextField() {
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 16,
              top: 11,
              width: 18,
              height: 18,
              child: Icon(Icons.lock_open),
            ),
            Positioned(
              left: 45,
              top: 10,
              bottom: 10,
              width: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 55,
              right: 10,
              top: 10,
              height: 30,
              child: TextField(
                controller: _pwdEditController,
                focusNode: _pwdFocusNode,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
                obscureText: true,

                /// 设置密码
              ),
            )
          ],
        ));
  }

  Widget buildLoginButton(UserStatus loginStatus) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 10, right: 10),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      child: RaisedButton(
        onPressed: () {
          print("尝试登陆...");
          if (checkInput()) {
            Fluttertoast.showToast(
                msg: "登录成功",
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 2,
                textColor: Colors.white,
                fontSize: 14.0);
            loginStatus.value = true;
//            print("loginStatus" + loginStatus.value);
//            Navigator.popAndPushNamed(context, OrderPage.routeName);
            print("登陆完成，即将进行路由跳转...");
            Navigator.popAndPushNamed(context, WelcomePage.routeName);
          } else {
            Fluttertoast.showToast(
                msg: "账号或密码错误",
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 2,
                textColor: Colors.white,
                fontSize: 14.0);
          }
        },
        child: Text("登录"),
        color: Colors.black87,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  bool checkInput() {
    if (_userNameEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入用户名",
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: 14.0);

      return false;
    } else if (_pwdEditController.text.length == 0) {
      Fluttertoast.showToast(
          msg: "请输入密码",
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return false;
    }

    return _userNameEditController.text == '123456' &&
        _pwdEditController.text == '123456';
  }
}

