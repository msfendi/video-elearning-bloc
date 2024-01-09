import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_elearning/data/bloc/post_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Flutter Bloc API'))),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read()<PostBloc>(context).add(PulltoRefreshEvent());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(post.id.toString()),
                      ),
                      title: Text(post.title),
                      // subtitle: Text(post.body),
                    ),
                  );
                },
              ),
            );
          } else if (state is FailureLoadState) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text('Failed to recall data'),);
        },
      ),
    );
  }
}
