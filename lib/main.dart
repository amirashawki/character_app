import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/business_logic/cubit/characters_cubit.dart';
import 'package:project/presentation/screens/character_details.dart';
import 'package:project/presentation/screens/character_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>CharactersCubit(),
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        routes: {
          'CharacterScreen': (context) => 
                 CharacterScreen(),
                   'CharacterDetails': (context) => 
                 CharacterDetails(),
              
        },
        initialRoute: 'CharacterScreen',
      ),
    );
  }
}
