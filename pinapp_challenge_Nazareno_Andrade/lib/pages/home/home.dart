import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp_challenge/bloc/main_bloc.dart';
import 'package:pinapp_challenge/components/myAppBar.dart';
import 'package:pinapp_challenge/pages/home/contentHome.dart';
import 'package:pinapp_challenge/pages/post_page/postPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(GetPosts());
  }

  void onPressedCallback (int postId){
    context.read<MainBloc>().add(AddLike(postId: postId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffEBEBEB),
          appBar: const MyAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffb9b9b9),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search, color: Colors.grey[600]),
                          hintText: 'Buscar...',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if(state.posts.isNotEmpty){
                            context.read<MainBloc>().add(Search(query: value));
                          }
                        },
                      ),
                      if(state.filteredPosts.isNotEmpty) ...[
                        const Divider(),
                        ListView(
                          shrinkWrap: true,
                          children: state.filteredPosts.map((post) {
                            return ListTile(
                              title: Text(post.title, maxLines: 1, overflow: TextOverflow.ellipsis,),
                              onTap: () {
                                Navigator.push(context,  MaterialPageRoute(builder: (context) => PostPage(post: post)),);
                              },
                            );
                          }).toList(),
                        )
                      ]
                    ],
                  ),
                ),
                Expanded(child: contentHome(state, onPressedCallback))
              ],
            ),
          )
        );

      },

    );
  }
}

