import 'package:poke/app_navigator.dart';
import 'package:poke/bloc/nav_cubit.dart';
import 'package:poke/bloc/pokemon_bloc.dart';
import 'package:poke/bloc/pokemon_details_cubit.dart';
import 'package:poke/bloc/pokemon_event.dart';
import 'package:poke/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
            PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
        BlocProvider(create: (context) => pokemonDetailsCubit)
      ], child: AppNavigator()),
    );
  }
}
  

