import 'package:flutter/material.dart';
import 'package:form_flutter/add_product.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductModel model =
        Provider.of<ProductModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: ListView.builder(
        itemCount: model.count,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                "ID..: " + model.all[index].id + " " + model.all[index].name),
            subtitle: Text(model.all[index].description +
                "\nPreço..: " +
                model.all[index].price),
          );
        },
      ),
    );
  }
}
