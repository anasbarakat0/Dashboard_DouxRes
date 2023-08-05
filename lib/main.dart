import 'package:dashboard/restaurants/createNew.dart';
import 'package:flutter/material.dart';
import 'theme/colors.dart';

const url='https://73b5-5-155-31-167.ngrok-free.app';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DouxRes Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.red),
        useMaterial3: true,
      ),
      home: const CreateNewRest(),
    );
  }
}

