import 'package:uygulama1/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';
import 'package:uygulama1/data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList=[];
  List<ProductModel> get recommendedProductList =>_recommendedProductList;

  bool _isloaded=false;
  bool get isLoaded=>_isloaded;

  Future<void> getRecommendedProductList()async{
    Response response= await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){

      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isloaded=true;
      update();
    }else{

    }
  }

}