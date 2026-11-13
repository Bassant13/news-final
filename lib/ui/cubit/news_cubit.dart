import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app_final/api_services/models/Article_model.dart';
import 'package:news_app_final/api_services/models/Source_model.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import '../../api_services/api_services.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  SourceModel? source;
  ArticleModel? article;
  String? selectedSourceId;
  NewsCubit() : super(NewsInitial());

  Future<void> getSource(String categoryName,BuildContext context) async{
    emit(SourceLoading());
    try{
      source = await ApiServices().getSourceByCategoryName(categoryName);
       if (source?.sources?.isNotEmpty == true) {
         selectedSourceId = source!.sources!.first.id;
         await getArticleBySourceId(selectedSourceId!,context);
       } else {
         emit(SourceSuccess());
       }
    }on DioException catch(e){
      if(e.type == DioExceptionType.connectionError){
        emit(SourceError(getTranslations(context).no_internet_connection_error));
      }else{
        emit(SourceError(getTranslations(context).something_went_wrong_error));
      }
    }
  }

  Future<void> getArticleBySourceId(String sourceId,BuildContext context) async{
    emit(ArticleLoading());
    try{
      article = await ApiServices().getArticlesBySourceId(sourceId);
      emit(ArticleSuccess());
    }on DioException catch(e){
      if(e.type == DioExceptionType.connectionError){
        emit(ArticleError(getTranslations(context).no_internet_connection_error));
      }else{
        emit(ArticleError(getTranslations(context).something_went_wrong_error));
      }
    }
  }
  void selectSourceById(String sourceId,BuildContext context){
    selectedSourceId = sourceId;
    getArticleBySourceId(selectedSourceId ??'',context);
  }
  Future<void> searchArticleByNameWithSourceId(String articleName,String sourceId,BuildContext context) async{
    emit(ArticleLoading());
    try{
      article = await ApiServices().searchArticleByNameWithSourceId(articleName,sourceId);
      emit(ArticleSuccess());
    }on DioException catch(e){
      if(e.type == DioExceptionType.connectionError){
        emit(ArticleError(getTranslations(context).no_internet_connection_error));
      }else{
        emit(ArticleError(getTranslations(context).something_went_wrong_error));
      }
    }
  }
}
