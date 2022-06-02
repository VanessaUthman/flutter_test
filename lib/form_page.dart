import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:form_flutter/add_product.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  String id = '';
  String name = '';
  String description = '';
  String price = '';

  Widget _body() {
    final TextEditingController _controllerId = TextEditingController();
    final TextEditingController _controllerName = TextEditingController();
    final TextEditingController _controllerDescription =
        TextEditingController();
    final TextEditingController _controllerPrice = TextEditingController();

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controllerId,
                        onChanged: (text) {
                          id = text;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'ID', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _controllerName,
                        onChanged: (text) {
                          name = text;
                        },
                        decoration: InputDecoration(
                            labelText: 'Nome', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _controllerDescription,
                        onChanged: (text) {
                          description = text;
                        },
                        decoration: InputDecoration(
                            labelText: 'Descrição',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _controllerPrice,
                        onChanged: (text) {
                          price = text;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Preço', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                          color: Colors.blueGrey,
                          onPressed: () {
                            Product _newProduct = Product();
                            _newProduct.id = id;
                            _newProduct.description = description;
                            _newProduct.name = name;
                            _newProduct.price = price;

                            final ProductModel model =
                                Provider.of<ProductModel>(context,
                                    listen: false);
                            model.put(_newProduct);

                            _controllerId.clear();
                            _controllerName.clear();
                            _controllerDescription.clear();
                            _controllerPrice.clear();

                            Navigator.of(context).pushNamed('/listProducts');
                          },
                          child: Text('Cadastrar'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width),
        _body(),
      ],
    ));
  }
}
