import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_footer/Ultility/Ultility.dart';
import 'package:flutter_footer/models/category_type.dart';
import 'package:flutter_footer/views/show_component_by_category_page.dart';

import '../models/category.dart';
import '../models/component.dart';
import '../services/remote_services.dart';

List<Category>? allCategories;
List<CategoryType>? allCategoryTypes;

class CategoryTypesPage extends StatefulWidget{
  _CategoryTypesPage createState() => _CategoryTypesPage();
}

class _CategoryTypesPage extends State<CategoryTypesPage>{
  var isLoaded = false;

  List<Component>? allComponents;

  @override
  void initState(){
    super.initState();
    GetData();
  }

  GetData() async {
    allComponents = await RemoteService().getComponents();
    allCategories = await RemoteService().getCategories();
    allCategoryTypes = await RemoteService().getCategoryTypes();
    if (allCategories != null && allCategoryTypes != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  List<Category> searchCategoryByCategoryType(String id){
    List<Category> result = [];

    for(int i = 0; i < allCategories!.length; i++){
      if(id.toLowerCase().compareTo(allCategories![i].categoryTypeId.toLowerCase()) == 0){
        result.add(allCategories![i]);
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {

    List<List<Category>> categoryTypeList = [];
    for(int i = 0; i < allCategoryTypes!.length; i++){
      categoryTypeList.add(searchCategoryByCategoryType(allCategoryTypes![i].categoryTypeId));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Visibility(
          visible: isLoaded,
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
          itemCount: allCategoryTypes!.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                  title: Text(decodeUtf8(allCategoryTypes![index].categoryTypeName)),
                  children: <Widget>[
              ListView.builder(
              shrinkWrap: true,
                  itemCount: categoryTypeList[index].length,
                  itemBuilder: (BuildContext context, int index2){
                    return ListTile(
                      title: Text(decodeUtf8(categoryTypeList[index][index2].categoryName)),
                      onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShowComponentByCategory(searchComponentByCategory(categoryTypeList[index][index2].categoryId))))
                      },
                    );
                  }
              )

                    ],
                  );
                },
              ),
              ),
            ],
          ) ,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        )  ,
      )

      );
  }

  List<Component> searchComponentByCategory(String categoryID){
    List<Component> result = [];
    result = allComponents!.where((component) =>
        component.categoryId.toLowerCase().contains(categoryID.toLowerCase())).toList();
    return result;
  }
}

Category? searchCategoryByID(String id){
  for(int i = 0; i < allCategories!.length; i++){
    if(allCategories![i].categoryId.toLowerCase().compareTo(id.toLowerCase()) == 0){
      return allCategories![i];
    }
  }
  return null;
}
