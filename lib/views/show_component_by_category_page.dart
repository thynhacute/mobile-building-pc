import 'package:flutter/material.dart';
import 'package:flutter_footer/Ultility/MyUltility.dart';
import 'package:flutter_footer/models/brand.dart';
import 'package:flutter_footer/models/component.dart';
import 'package:flutter_footer/services/remote_services.dart';
import 'package:flutter_footer/views/component_page.dart';

import '../models/category.dart';
import 'component_detail_page.dart';


class ShowComponentByCategory extends StatelessWidget{
  final List<Component> components;
  final List<Category> allCategories;
  final List<Brand> allBrands;

  ShowComponentByCategory(this.components, this.allBrands, this.allCategories);

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
        appBar: AppBar(
          title: Text('Products', style: TextStyle(
            color: Colors.black,
          ),),
          centerTitle: true,
          backgroundColor: Color(0xFFFDC5FD),
        ),
        backgroundColor: Color(0xFFFCF6FC),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Visibility(
            visible: true,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: components?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(components![index]
                              .image, height: 50, width: 50,),
                          title: Text(decodeUtf8(
                              components![index].componentName)),
                          subtitle: Text((components![index].amount > 0)
                              ? 'Số lượng: ${components![index].amount}'
                              : 'Hết hàng!'),
                          trailing: Text('${addDotToPrice(
                              components![index].price)}vnd'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    ComponentDetail(components![index],
                                        searchBrand(
                                            components![index].brandId)!
                                            .brandName, allCategories)));
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
          ),

        )
    );
  }

  Brand? searchBrand(int id){
    for (int i = 0; i < allBrands!.length; i++){
      if(id == allBrands![i].brandId){
        return allBrands![i];
      }
    }

    return null;
  }
}