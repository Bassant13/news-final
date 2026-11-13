import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/api_services/models/Article_model.dart';
import 'package:news_app_final/api_services/models/Source_model.dart';
import 'package:news_app_final/l10n/app_translation.dart';
import 'package:news_app_final/ui/core/assets/app_colors.dart';
import 'package:news_app_final/ui/core/assets/app_fonts.dart';
import 'package:news_app_final/ui/core/widgets/custom_app_bar.dart';
import 'package:news_app_final/ui/core/widgets/custom_drawer.dart';
import 'package:news_app_final/ui/core/widgets/news_card.dart';
import 'package:news_app_final/ui/cubit/news_cubit.dart';
import 'package:news_app_final/ui/cubit/news_state.dart';

class NewsScreen extends StatefulWidget{
  static const String routeName = 'News Screen';
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments =
      ModalRoute.of(context)!.settings.arguments
      as Map<String, String>;
      final apiCategoryName = arguments['apiCategoryName']!;
      context.read<NewsCubit>().getSource(
        apiCategoryName,
        context,
      );
    });
  }
  TextEditingController searchController = TextEditingController();
  String? selectedSourceId;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final apiCategoryName = arguments['apiCategoryName']!;
    final categoryTranslations = {
      'general': getTranslations(context).general,
      'business': getTranslations(context).business,
      'entertainment': getTranslations(context).entertainment,
      'health': getTranslations(context).health,
      'science': getTranslations(context).science,
      'technology': getTranslations(context).technology,
      'sports': getTranslations(context).sports,
    };
    final categoryName = categoryTranslations[apiCategoryName]!;

    return SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: CustomAppBar(
                title: categoryName,
                searchController: searchController,
                onChanged: (value) {
                  if (value.trim().isEmpty) {
                    context.read<NewsCubit>().getArticleBySourceId(context.read<NewsCubit>().selectedSourceId ?? '',context);
                  } else {
                    context.read<NewsCubit>().searchArticleByNameWithSourceId(
                      value,
                      context.read<NewsCubit>().selectedSourceId ?? '',context);
                  }
                },
          ),
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if(state is SourceLoading){
              return Center(
                child: CircularProgressIndicator(color: Theme.of(context).appBarTheme.foregroundColor,),
              );
            }
            if(state is SourceError){
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppFonts.blackBold24.copyWith(color: AppColors.red),
                ),
              );
            }
            if(state is SourceSuccess
            || state is ArticleLoading
            || state is ArticleError
            || state is ArticleSuccess
            ){
              SourceModel? source = context.read<NewsCubit>().source;
              ArticleModel? article = context.read<NewsCubit>().article;
              return Column(
              children: [
                SizedBox(
                  height: 70.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: source?.sources?.length ?? 0,
                        itemBuilder: (context,index){
                          final currentSource = source?.sources?[index];
                          final selectedSourceId = context.watch<NewsCubit>().selectedSourceId;
                          final isSelected = selectedSourceId == currentSource?.id;
                          return Padding(
                            padding:  EdgeInsets.only(right: 10.w),
                            child: InkWell(
                              onTap: (){
                                context.read<NewsCubit>().selectSourceById(currentSource?.id ?? '',context);
                              },
                              child: Text(
                                context.read<NewsCubit>().source?.sources?[index].name ??'',
                                style:  isSelected? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }
                    )
                ),
                Expanded(
                  child: state is ArticleLoading?
                Center(
                    child: CircularProgressIndicator(color: Theme.of(context).appBarTheme.foregroundColor),)
                : state is ArticleError?
            Center(
            child: Text(
            state.errorMessage,
            style: AppFonts.blackBold24.copyWith(color: AppColors.red),
            ),
            ) : state is ArticleSuccess?
            ListView.builder(
                      itemCount: article?.articles?.length ??0,
                        itemBuilder: (context,index){
                          final currentArticle = article?.articles?[index];
                          return NewsCard(
                              currentArticle: currentArticle,
                              newsImageUrl: currentArticle?.urlToImage ?? '',
                              newsTitle: currentArticle?.title ?? '',
                              newsContent: currentArticle?.content ?? '',
                              newsAuthor: currentArticle?.author ?? getTranslations(context).unknown,
                              publishTime: currentArticle?.publishedAt?.substring(0,10) ?? ''
                          );
                        }
                    ): SizedBox(),
                )
              ],
            );
            }
            return SizedBox();
  },
),
          ),
        )
    );
  }
}