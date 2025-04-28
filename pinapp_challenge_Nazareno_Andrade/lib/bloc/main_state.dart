part of 'main_bloc.dart';

class MainState {
  final List<Post> posts;
  final List<Post> filteredPosts;
  final List<Comment>? comments;
  final bool isLoading;
  final String errorMessage;


  MainState({
    this.posts = const [],
    this.filteredPosts = const [],
    this.comments = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  MainState copyWith({
    List<Post>? posts,
    List<Post> filteredPosts = const [],
    List<Comment>? comments,
    bool? isLoading,
    String? errorMessage,
  }) {
    return MainState(
      posts: posts ?? this.posts,
      filteredPosts: filteredPosts,
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}