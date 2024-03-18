import 'dart:convert';
import 'package:hoja/common/common.dart';
import 'package:hoja/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hoja/model/order_model.dart';
import 'package:popup_menu/popup_menu.dart';

class existingProductsScreen extends StatefulWidget {
  @override
  _InProgressScreenState createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<existingProductsScreen> {
  List<ProductModel> productModel = [];
  int selectedCategory = 0;
  final List<String> statusList=['Accept',];

  int indexSelected;

  void fetchData() async {
    String uri = Common.baseUrl + 'fetchProducts.php';
    var res = await http.post(
      Uri.parse(uri),
      body: {
        'id': Common.currentUser.id,
      },
    );

    jsonDecode(res.body).forEach((element) {
      productModel.add(ProductModel.fromJson(element));
    });
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
    PopupMenu.context = context;
    return Scaffold(
      body: productModel.isEmpty
          ? Container()
          : Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productModel.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(productModel[index].name, style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                      );
                    },
                  ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productModel[selectedCategory].product.length,
                    itemBuilder: (context, index) {
                      Product model = productModel[selectedCategory].product[index];
                      return GestureDetector(
                        onTapUp: (TapUpDetails details) {
                          indexSelected = index;
                          showPopup(details.globalPosition);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),

                            elevation: 6,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 14),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            model.name,
                                            style: TextStyle(fontSize: 20),
                                          )),
                                      Text(
                                        'Rs: ' + model.price,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Text(model.description),
                                  Text("Discount: " + model.discount),
                                  //Text(model.description),
                                  //Text(model.owner),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
    );
  }

  void showPopup(Offset offset) {
    PopupMenu menu = PopupMenu(
      // backgroundColor: Colors.teal,
      // lineColor: Colors.tealAccent,
        maxColumn: 1,
        items: [
          MenuItem(title: 'Delete', image: Icon(Icons.check_box, color: Colors.white)),
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
    if(item.menuTitle == 'Delete') {
      deleteOrder();
    }
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  void deleteOrder() async {
    var res = await http.post(
      Common.baseUrl + 'deleteProduct.php',
      body: {
        'id': productModel[selectedCategory].product[indexSelected].id
      }
    );

    if(jsonDecode(res.body)['success']){
      productModel[selectedCategory].product.removeAt(indexSelected);
      setState(() {});
    }
  }


}
