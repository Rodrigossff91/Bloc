import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeErroState extends HomeState {
  final String message;
  HomeErroState({required this.message});
}

class HomeStateLoaded extends HomeState {
  final List<String> list;
  HomeStateLoaded({
    required this.list,
  });
}

class HomeStateEmptyList extends HomeState {}
