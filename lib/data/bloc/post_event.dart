part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class LoadEvent extends PostEvent {}

class PulltoRefreshEvent extends PostEvent {}
