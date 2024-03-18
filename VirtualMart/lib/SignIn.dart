import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hoja/model/loginModel.dart';
import 'package:hoja/tabScreen.dart';
import 'package:http/http.dart' as http;
import 'common/common.dart';

class signInScreen extends StatefulWidget {
  @override
  _signInScreenState createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {

  bool _passwordVisible = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void fetchData() async {
    String uri = Common.baseUrl + 'loginUser.php';
    var res = await http.post(
      uri,
      body: {
        'phone': phonenumber,
        'password':password,
      },
    );

    print(res.body);
    Common.currentUser = loginModel.fromJson(jsonDecode(res.body));
    checkuser(Common.currentUser);
    setState(() { });
  }

  void checkuser(model){
    if(model.success==true){
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text("login successfull!")));
      Timer(Duration(seconds: 1), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>tbScreen()));
      });
    }
    else{
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text(model.message)));
    }
  }


  String phonenumber,password;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height*0.4,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              image:DecorationImage(
                image:AssetImage("assets/images/orange.jpg"),
                fit: BoxFit.fill,
              )
            ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val){
                        phonenumber=val;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Phone Number",
                        hintText: "Phone Number",
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),

                    SizedBox(height: 14,),

                    TextField(
                      onChanged: (val){
                        password=val;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                            onTap: (){
                              _passwordVisible=!_passwordVisible;
                              setState(() {});
                            },
                            child: Icon(Icons.remove_red_eye_rounded)),
                      ),
                      obscureText: _passwordVisible,
                    ),

                    SizedBox(height: 18,),

                    GestureDetector(

                      onTap: (){
                        fetchData();
                      },

                      child: Container(
                        height: 50,
                        //color: Colors.deepOrange,
                        child: Center(
                          child: Text(
                              "    Sign In    ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 130,),
            Text("Powered by© Virtual Mart",style: TextStyle(fontSize: 14,color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
