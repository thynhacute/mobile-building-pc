import 'package:flutter/material.dart';
import 'package:flutter_footer/Ultility/MyUltility.dart';
import 'package:flutter_footer/models/component.dart';
import 'package:flutter_footer/services/remote_services.dart';
import 'package:flutter_footer/views/category_type_page.dart';

import '../models/category.dart';


class ComponentDetail extends StatelessWidget{
  final Component component;
  final String brandName;
  final List<Category> allCategories;

  ComponentDetail(this.component, this.brandName, this.allCategories);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Product', style: TextStyle(
          color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: Color(0xFFFDC5FD),
      ),
      backgroundColor: Color(0xFFFCF6FC),
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
                padding: EdgeInsets.only(left: 30, right: 1, bottom: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Text(
                            'Số lượng: ' + component.amount.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                            ),
                          )
                      ),
                      Container(
                        width: 130,
                        child: Text(
                          addDotToPrice(component.price) + " VND",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        ),
                      ) ,
                    ],
                  ),
              ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                child: Text(
                  'Hãng: ${decodeUtf8(brandName)}',
                  style: TextStyle(fontSize: 20),
                )
    )
            ),
             Padding(
                padding: const EdgeInsets.all(8.0),
               child: Container(
                   padding: EdgeInsets.only(left: 20),
                   alignment: Alignment.centerLeft,
                child: Text(
                  component.description == null ? "" : decodeUtf8(component.description!),
                  style: TextStyle(fontSize: 20),
                )
               )
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                child: Text(
                  decodeUtf8(searchCategoryByID(component.categoryId)! .categoryName),
                  style: TextStyle(fontSize: 20),
                )
              )
            ),
          ],
        )
      ),
    );
  }

  Category? searchCategoryByID(String id){
    for(int i = 0; i < allCategories!.length; i++){
      if(allCategories![i].categoryId.toLowerCase().compareTo(id.toLowerCase()) == 0){
        return allCategories![i];
      }
    }
    return null;
  }
}