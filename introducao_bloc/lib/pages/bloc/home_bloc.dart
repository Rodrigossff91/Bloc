import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introducao_bloc/pages/bloc/home_event.dart';
import 'package:introducao_bloc/pages/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    var state;
    switch (event.runtimeType) {
      case HomeFetchList:
        state = await _fetchList();
        break;
      case HomeFetchListWithError:
        state = await _fetchListWithError();
        break;
      case HomeFetchListEmptyList:
        state = await _fetchListWithEmpty();
        break;
    }

    yield* state;
  }

  Future<HomeState> _fetchList() async {
    var list = await Future.delayed(Duration(seconds: 3), () {
      <String>[
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo",
        "Rodrigo"
      ];
    });
    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(
        Duration(seconds: 3), () => HomeErroState(message: "Error"));
  }

  Future<HomeState> _fetchListWithEmpty() async {
    await Future.delayed(Duration(seconds: 3), () {});
    return HomeStateEmptyList();
  }
}
