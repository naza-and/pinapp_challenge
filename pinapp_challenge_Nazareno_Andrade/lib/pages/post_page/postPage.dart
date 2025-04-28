import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/bloc/main_bloc.dart';
import 'package:pinapp_challenge/class/post.dart';
import 'package:pinapp_challenge/components/myAppBar.dart';

class PostPage extends StatefulWidget {
  final Post post;

  const PostPage({super.key, required this.post});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(GetComments(idPost: widget.post.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const MyAppBar(),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      children: [
                        Text(
                          widget.post.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          widget.post.body,
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            IconButton(onPressed: (){
                                context.read<MainBloc>().add(AddLike(postId: widget.post.id));
                              }, icon: widget.post.like? const Icon(Icons.thumb_up_alt) : const Icon(Icons.thumb_up_off_alt)),
                            Text("${widget.post.likeNumber}"),
                          ],
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text("Comentarios:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        ),
                        Column(
                        children: state.comments!.map((comment) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xff001568),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: const Icon(Icons.person, color: Colors.white),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      comment.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),

                              Text(comment.email),
                              Text(comment.body),
                              const Divider()
                            ],
                          );
                        }).toList(),
                        )
                      ],
                    )),
        );
      },
    );
  }
}
