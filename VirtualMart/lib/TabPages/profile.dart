import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoja/common/common.dart';
import 'package:hoja/model/profileInfo_model.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileInfo model;

  void fetchData() async {
    String uri = Common.baseUrl + 'fetchProfileInfo.php';
    var res = await http.post(
      Uri.parse(uri),
      body: {
        'id': '1',
      },
    );
    model = ProfileInfo.fromJson(jsonDecode(res.body));
    // jsonDecode(res.body).forEach((element){
    //   profileModel.add(ProfileInfo.fromJson(element));
    // });
    print(res.body);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            model == null
                ? Center(child: Center(child: CircularProgressIndicator()))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(model.shop.image),
                            minRadius: 60,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Center(
                            child: Text(
                          model.shop.name,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Information",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 6,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Text(model.shop.id.toString()),
                                //Image.network(model.shop.image),
                                Text(
                                  "Phone: " + model.shop.phone,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Address: " + model.shop.address,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Orders",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 6,
                            color: Colors.white,
                            child: Container(
                              width: size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "New Orders: " + model.report.newOrders,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Cancelled Orders: " +
                                          model.report.caneclledOrders,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Completed Orders: " +
                                          model.report.completedOrders,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Orders InProcess: " +
                                          model.report.inProcessOrders,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Earnings",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 6,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Last Month Earning: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        model.report.lastMonthEarning == null
                                            ? " 0.0"
                                            : model.report.lastMonthEarning,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Last week Earning" +
                                        (model.report.lastWeekEarning == null
                                            ? " 0.0"
                                            : model.report.lastWeekEarning),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total Earning: " +
                                        (model.report.totalEarning == null
                                            ? " 0.0"
                                            : model.report.totalEarning),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
