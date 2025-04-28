import 'package:flutter/material.dart';
import 'package:pinapp_challenge/bloc/main_bloc.dart';
import 'package:pinapp_challenge/pages/post_page/postPage.dart';

Widget contentHome(MainState state,  void Function(int index) addLikeButtonFunction) {
  if (state.isLoading) {
    return const Center(child: CircularProgressIndicator());
  } else if (state.posts.isNotEmpty) {
    return ListView.builder(
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        final post = state.posts[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context,  MaterialPageRoute(builder: (context) => PostPage(post: post)),);
          },
          child: Container(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Color(0xffb9b9b9),
                  width: 1.0,
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title, maxLines: 3, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        post.body,  maxLines: 2, overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 15, color: Color(0xff4c4c4c))),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: ()=> addLikeButtonFunction(post.id),
                            child: post.like? const Icon(Icons.thumb_up_alt, size: 15,) : const Icon(Icons.thumb_up_alt_outlined, size: 15,)
                        ),
                        Text("${post.likeNumber}",  style: TextStyle(fontSize: 13, color: Color(0xff4c4c4c))),
                        const Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Icon(Icons.comment, size: 15,),
                        ),
                        const Text("12",  style: TextStyle(fontSize: 13, color: Color(0xff4c4c4c))),
                      ],
                    )
                  ],
                ),
              )
          ),
        );
      },
    );
  }
  return Container();
}