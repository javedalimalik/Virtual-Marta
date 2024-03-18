import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoja/model/order_model.dart';
import 'package:http/http.dart' as http;

class orderScreen extends StatefulWidget {
  @override
  _orderScreenState createState() => _orderScreenState();
}

class _orderScreenState extends State<orderScreen> {
  int colorChange = 1;
  List<OrderModel> orderModel = [];

  void fetchData(int type) async {
    String uri = 'http://192.168.1.101/admin/fetchOrders.php';
    var res = await http.post(
      Uri.parse(uri),
      body: {
        'id': '1',
        'type': type.toString(),
      },
    );

    jsonDecode(res.body).forEach((element){
      orderModel.add(OrderModel.fromJson(element));
    });

    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      colorChange = 1;
                    });
                    fetchData(0);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: colorChange == 1 ? Colors.deepOrange : Colors.grey,
                  child: Text("New"),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      colorChange =2;
                    });
                    fetchData(1);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: colorChange == 2 ? Colors.deepOrange : Colors.grey,
                  child: Text("In Progress"),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      colorChange = 3;
                    });
                    fetchData(2);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textColor: Colors.white,
                  color: colorChange == 3 ? Colors.deepOrange : Colors.grey,
                  child: Text("Completed"),
                ),
              ],
            ),
            SizedBox(height: 15,),
            orderModel.isEmpty ? Container() :
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: orderModel.length,
                itemBuilder: (_, index){
                  OrderModel model = orderModel[index];
                  return Container(
                    color: Colors.grey,
                    child: Text(model.name),);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
