import 'package:dio/dio.dart';
import 'package:news_app_final/api_services/models/Article_model.dart';
import 'package:news_app_final/api_services/models/Source_model.dart';

class ApiServices{
  String apiKey = '';
 static Dio dio = Dio(
     BaseOptions(
   baseUrl: 'https://newsapi.org/v2/',
 ));
  Future<SourceModel> getSourceByCategoryName(String categoryName) async{
   final response = await dio.get(
     'top-headlines/sources',
     queryParameters: {
       "category": categoryName,
       'apiKey': apiKey,

     }
       );
   return SourceModel.fromJson(response.data);
       }

   Future<ArticleModel> getArticlesBySourceId(String sourceId) async{
     final response = await dio.get(
         'top-headlines',
         queryParameters: {
           "sources": sourceId,
           'apiKey': apiKey,

         }
     );
     return ArticleModel.fromJson(response.data);
   }
  Future<ArticleModel> searchArticleByNameWithSourceId(String articleName,String sourceId) async{
    final response = await dio.get(
        'everything',
        queryParameters: {
          "sources": sourceId,
          "q": articleName.toLowerCase(),
          'apiKey': apiKey,

        }
    );
    return ArticleModel.fromJson(response.data);
  }

}