import 'package:flutter/material.dart';
import 'package:form_flutter/add_product.dart';
import 'package:form_flutter/form_page.dart';
import 'package:form_flutter/list_product.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProductModel(),
        child: MaterialApp(
          theme:
              ThemeData(primaryColor: Colors.grey, brightness: Brightness.dark),
          initialRoute: '/',
          routes: {
            '/': (context) => FormPage(),
            '/listProducts': (context) => ListProduct()
          },
        ));
  }
}
