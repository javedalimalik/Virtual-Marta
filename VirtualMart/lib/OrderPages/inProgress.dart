import 'dart:convert';
import 'package:hoja/common/common.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hoja/model/order_model.dart';
import 'package:popup_menu/popup_menu.dart';

class InProgressScreen extends StatefulWidget {
  @override
  _InProgressScreenState createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {

  List<OrderModel> orderModel = [];
  final List<String> statusList=['Complete','Cancel'];

  int indexSelected;

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
    fetchData(1);
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    return Scaffold(
      body: orderModel.isEmpty ? Container() :
      ListView.builder(
        itemCount: orderModel.length,
        itemBuilder: (_, index){
          OrderModel model = orderModel[index];
          return GestureDetector(
            onTapUp: (TapUpDetails details) {
              indexSelected = index;
              showPopup(details.globalPosition);
            },
            child: Padding(
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
            ),
          );
        },
      ),
    );
  }


  void showPopup(Offset offset) {
    PopupMenu menu = PopupMenu(
      // backgroundColor: Colors.teal,
      // lineColor: Colors.tealAccent,
        maxColumn: 2,
        items: [
          MenuItem(title: 'Complete', image: Icon(Icons.check_box, color: Colors.white)),
          MenuItem(title: 'Cancel',image: Icon(Icons.cancel, color: Colors.white,)),
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(rect: Rect.fromPoints(offset, offset));
  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onClickMenu(MenuItemProvider item) {
    if(item.menuTitle == 'Complete') {
      updateOrder(2);
    }
    else {
      updateOrder(-1);
    }
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }


  void updateOrder(int state) async {
    var res = await http.post(Common.baseUrl + 'updateOrder.php', body: {
      'id': orderModel[indexSelected].id.toString(),
      'status': state.toString(),
    });

    if(jsonDecode(res.body)['success']){
      setState(() {
        orderModel.removeAt(indexSelected);
      });
    }
  }

}
