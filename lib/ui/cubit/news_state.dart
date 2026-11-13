
abstract class NewsState {}

final class NewsInitial extends NewsState {}
 class SourceLoading extends NewsState{}
class SourceSuccess extends NewsState{}
class SourceError extends NewsState{
  String errorMessage;
  SourceError(this.errorMessage);
}
class ArticleLoading extends NewsState{}
class ArticleSuccess extends NewsState{}
class ArticleError extends NewsState{
  String errorMessage;
  ArticleError(this.errorMessage);
}

