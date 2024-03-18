import 'dart:convert';
import 'package:hoja/common/common.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hoja/model/order_model.dart';

class CompletedOrderScreen extends StatefulWidget {
  @override
  _InProgressScreenState createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<CompletedOrderScreen> {

  List<OrderModel> orderModel = [];

  void fetchData(int type) async {
    String uri = Common.baseUrl + 'fetchOrders.php';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderModel.isEmpty ? Container() :
      ListView.builder(
        itemCount: orderModel.length,
        itemBuilder: (_, index){
          OrderModel model = orderModel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text("Order ID: "+model.id.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
                        Text("RS. "+model.price.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Text(model.name),
                    Text("No. of Items: "+model.items.toString()),
                    Text(model.phone),
                    Text(model.address),
                    Row(
                      children: [
                        Expanded(child: Text(model.date)),
                        Text("delievery charges: "+model.deliveryFee.toString()),
                      ],
                    ),
                  ],
                ),
              ),),
          );
        },
      ),
    );
  }
}
