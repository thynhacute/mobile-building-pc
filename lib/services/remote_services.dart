import 'dart:convert';

import 'package:flutter_footer/models/brand.dart';
import 'package:flutter_footer/models/category.dart';
import 'package:flutter_footer/models/category_type.dart';
import 'package:flutter_footer/models/component.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<List<Component>?> getComponents() async{
    var client = http.Client();
    var uri = Uri.parse('https://server-buildingpc.herokuapp.com/component/allComponent');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return componentFromJson(json);
    }
  }

  Future<List<Brand>?> getBrands() async{
    var client = http.Client();
    var uri = Uri.parse('https://server-buildingpc.herokuapp.com/brand/allBrand');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return brandFromJson(json);
    }
  }
  Future<List<Brand>?> findBrands(int id) async{
    var client = http.Client();
    var uri = Uri.parse('https://server-buildingpc.herokuapp.com/brand/$id');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return brandFromJson(json);
    }
  }

  Future<List<Category>?> getCategories() async{
    var client = http.Client();
    var uri = Uri.parse('https://server-buildingpc.herokuapp.com/category/allCategory');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return categoryFromJson(json);
    }
  }
  Future<List<CategoryType>?> getCategoryTypes() async{
    var client = http.Client();
    var uri = Uri.parse('https://server-buildingpc.herokuapp.com/categoryType/allCategoryType');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return categoryTypeFromJson(json);
    }
  }
  // Future<List<Component>?> getUser(String username, String password) async{
  //   var client = http.Client();
  //   var uri = Uri.parse('https://server-buildingpc.herokuapp.com/user/loginUser?password=$password&username=$username');
  //   var response = await client.post(uri);
  //   if(response.statusCode == 200){
  //     var json = response.body;
  //     return componentFromJson(json);
  //   }
  // }
}