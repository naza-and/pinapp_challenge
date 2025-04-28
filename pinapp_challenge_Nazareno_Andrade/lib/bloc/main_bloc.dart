
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/class/comment.dart';
import 'package:pinapp_challenge/class/post.dart';
import 'package:pinapp_challenge/class/requestManager.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<GetPosts>(_onGetPosts);
    on<Search>(_onSearch);
    on<GetComments>(_getPostComments);
    on<AddLike>(_addLike);
  }

  Future<void> _onGetPosts(GetPosts event, Emitter<MainState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));

    try {
      final response = await RequestManager().getPost();
      final posts = response.map<Post>((item) => Post.fromJson(item)).toList();
      emit(state.copyWith(posts: posts, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onSearch(Search event, Emitter<MainState> emit) {
    final query = event.query.toLowerCase();
    List<Post> filtered = [];
    if(query!=""){
      filtered =state.posts.where((post) =>
      post.title.toLowerCase().contains(query) ||
      post.body.toLowerCase().contains(query)
      ).take(4).toList();
    }

    emit(state.copyWith(filteredPosts: filtered));
  }

  void _getPostComments(GetComments event, Emitter<MainState> emit) async {
    try {
      final response = await RequestManager().getPostComments("${event.idPost}");
      final comments = response.map<Comment>((item) => Comment.fromJson(item)).toList();
      emit(state.copyWith(comments: comments, isLoading: false));

    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _addLike(AddLike event, Emitter<MainState> emit) {
    for(Post post in state.posts){
      if(event.postId == post.id){
        if(post.like){
          post.like = false;
          post.likeNumber--;
        } else {
          post.like = true;
          post.likeNumber++;
        }
      }
    }

    emit(state.copyWith(posts: state.posts));
  }

}