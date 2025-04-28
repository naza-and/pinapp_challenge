part of 'main_bloc.dart';

abstract class MainEvent {}

class GetPosts extends MainEvent {}

class Search extends MainEvent {
  final String query;
  Search({required this.query});
}

class GetComments extends MainEvent{
  final int idPost;
  GetComments({required this.idPost});
}

class AddLike extends MainEvent{
  final int postId;
  AddLike({required this.postId});
}