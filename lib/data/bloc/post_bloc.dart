import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/Post.dart';
import '../repositories/api_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiRepository apiRepository;

  //----------------- 3. Membuat PostBloc -----------------
  // PostBloc digunakan untuk mengecek kondisi event pada screen dimana PostBloc ini membutuhkan ApiRepository
  // ini adalah case ketika melakukan pulltorefresh, dia akan nge-get data terbaru dari api
  // >>>>>>>>>>>>> lanjut ke home screen >>>>>>>>>>>>>
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
