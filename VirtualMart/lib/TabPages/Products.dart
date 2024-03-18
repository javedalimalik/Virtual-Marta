import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int colorChange = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.deepOrange,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                colorChange=1;
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textColor: Colors.white,
              color: colorChange==1?Colors.deepOrange:Colors.grey,
              child: Text("  Existing   "),
            ),
            MaterialButton(
              onPressed: () {
                colorChange=2;
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textColor: Colors.white,
              color: colorChange==2?Colors.deepOrange:Colors.grey,
              child: Text("  Add New  "),
            ),
          ],
        ),
      ),
    );
  }
}
