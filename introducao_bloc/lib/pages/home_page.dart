import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introducao_bloc/pages/bloc/home_bloc.dart';
import 'package:introducao_bloc/pages/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Bloc"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HomeStateLoaded) {
              return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.list[index]),
                    );
                  });
            }

            if (state is HomeErroState) {
              return Center(child: Text(state.message));
            }

            if (state is HomeStateEmptyList) {
              return Text("Não há dados disponíveis");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
