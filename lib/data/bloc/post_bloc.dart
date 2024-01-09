import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/Post.dart';
import '../repositories/api_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiRepository apiRepository;

  PostBloc({required this.apiRepository}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is LoadEvent || event is PulltoRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await apiRepository.getPostList();
          emit(LoadedState(posts: posts));
        } catch (e) {
          emit(FailureLoadState(message: e.toString()));
        }
      }
    });
  }
}
