import 'dart:convert';
import 'dart:io';
import 'package:hoja/model/categoryModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hoja/common/common.dart';
import 'package:image_picker/image_picker.dart';

class addNewProduct extends StatefulWidget {
  @override
  _addNewProductState createState() => _addNewProductState();
}

class _addNewProductState extends State<addNewProduct> {
  String name, description, price, discount;
  List<categoryModel> categorymodel = [];
  String _dropDownValue;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void fetchData() async {
    String uri = Common.baseUrl + 'fetchCategories.php';
    var res = await http.post(
      Uri.parse(uri),
    );

    jsonDecode(res.body).forEach((element) {
      categorymodel.add(categoryModel.fromJson(element));
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
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name of product",
                  labelText: "Name",
                ),
                onChanged: (val) {
                  name = val;
                },
              ),
              SizedBox(
                height: 5,
              ),
              dd(),
              TextField(
                minLines: 3,
                maxLines: 10,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description of product",
                  labelText: "Description",
                ),
                onChanged: (val) {
                  description = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Price of product",
                  labelText: "Price",
                ),
                onChanged: (val) {
                  price = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Discount for product",
                  labelText: "Discount",
                ),
                onChanged: (val) {
                  discount = val;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: _image == null
                    ? GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: FileImage(_image), fit: BoxFit.fill)),
                        height: 150,
                        width: 150,
                        // child: Image.file(_image),
                      ),
              ),
              SizedBox(height: 10,),

              Center(
                child: GestureDetector(
                  onTap: (){
                    addProduct();
                  },
                  child: Container(
                    height: 60,
                    width:size.width*8 ,

                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text("Add Product",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
              SizedBox(height: 120,),

            ],
          ),
        ),
      ),
    );
  }

  Widget dd() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
      child: DropdownButton(
        hint: _dropDownValue == null
            ? Text(
                'Select Category',
                style: TextStyle(color: Colors.deepOrange),
              )
            : Text(
                _dropDownValue.split("/")[0],
                style: TextStyle(color: Colors.deepOrange),
              ),
        isExpanded: true,
        iconSize: 30.0,
        style: TextStyle(color: Colors.deepOrange),
        items: categorymodel.map(
          (val) {
            return DropdownMenuItem<String>(
              value: val.name + '/' + val.id,
              child: Text(val.name),
            );
          },
        ).toList(),
        onChanged: (val) {
          setState(
            () {
              _dropDownValue = val;
            },
          );
        },
      ),
    );
  }

  addProduct() async {
    var postUri = Uri.parse(Common.baseUrl + 'addProduct.php');
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['userId'] = Common.currentUser.shop.id;
    request.fields['name'] = name;
    request.fields['catId'] = _dropDownValue.split("/")[1];
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['discount'] = discount;
    request.files.add(await http.MultipartFile.fromPath(
        'file',
        _image.path
    ));

    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });
  }
}
