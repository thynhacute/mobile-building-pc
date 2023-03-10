import 'package:flutter/material.dart';
import 'package:flutter_footer/Ultility/Ultility.dart';
import 'package:flutter_footer/models/component.dart';
import 'package:flutter_footer/services/remote_services.dart';
import 'package:flutter_footer/views/category_type_page.dart';


class ComponentDetail extends StatelessWidget{
  final Component component;
  final String brandName;

  ComponentDetail(this.component, this.brandName);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('product') ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(component.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                component.componentName,
                style: TextStyle(fontSize: 30),
              )
            ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        child: Text(
                          addDotToPrice(component.price) + "vnd",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.red,
                          ),
                        ),
                      ) ,
                      Container(
                          child: Text(
                            'Số lượng: ' + component.amount.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey
                            ),
                          )
                      ),
                    ],
                  ),
              ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hãng: ${decodeUtf8(brandName)}',
                  style: TextStyle(fontSize: 20),
                )
            ),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  component.description == null ? "" : decodeUtf8(component.description!),
                  style: TextStyle(fontSize: 20),
                )
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  decodeUtf8(searchCategoryByID(component.categoryId)! .categoryName),
                  style: TextStyle(fontSize: 20),
                )
            ),
          ],
        )
      ),
    );
  }
}