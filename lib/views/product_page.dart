import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_footer/views/component_detail_page.dart';
import '../Ultility/Ultility.dart';
import '../main.dart';
import '../models/component.dart';
import '../models/brand.dart';
import '../services/remote_services.dart';

List<Component>? allComponents;
List<Brand>? allBrands;

class ProductPage extends StatefulWidget{
  @override
  _ProductPage createState() => _ProductPage();
}

class _ProductPage extends State<ProductPage>{

  List<Component>? displayComponents;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    GetData();
  }

  GetData() async {
    allComponents = await RemoteService().getComponents();
    allBrands = await RemoteService().getBrands();
    if (allComponents != null){
      setState(() {
        displayComponents = allComponents;
        isLoaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context){
    //getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
        child: Visibility(
          visible: isLoaded,
          child: Column(
            children: [
              TextField(
                onChanged: (value) => searchComponentByName(value),
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayComponents?.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        leading: Image.network(displayComponents![index].image, height: 50, width: 50,),
                        title: Text(decodeUtf8(displayComponents![index].componentName)),
                        subtitle: Text((displayComponents![index].amount>0) ? 'Số lượng: ${displayComponents![index].amount}' : 'Hết hàng!'),
                        trailing: Text('${addDotToPrice(displayComponents![index].price)}vnd'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ComponentDetail(displayComponents![index], searchBrand(displayComponents![index].brandId)!.brandName)));
                        },
                      ) ,
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

  void searchComponentByName(String value){
    List<Component> result = [];
    if(value.isEmpty){
      result = allComponents!;
    }else{
      result = allComponents!.where((component) =>
        component.componentName.toLowerCase().contains(value.toLowerCase())).toList();
    }
    setState(() {
      displayComponents = result;
    });
  }
}


Brand? searchBrand(int id){
  for (int i = 0; i < allBrands!.length; i++){
    if(id == allBrands![i].brandId){
      return allBrands![i];
    }
  }

  return null;
}