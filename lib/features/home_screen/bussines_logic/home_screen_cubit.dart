import 'package:bloc/bloc.dart';
import 'package:education_app/core/injector.dart';
import 'package:education_app/features/feature_screen/bussines_logic/feature_cubit.dart';
import 'package:education_app/features/feature_screen/presentation/screen/feature_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => FeatureCubit(getIt()),
      child: const FeatureScreen(),
    ),
    Container(
      child: Center(
        child: Text('karim2'),
      ),
    ),
    Container(),
    Container(),
  ];

  void changePage(value) {
    index = value;
    emit(HomeScreenChangePageState());
  }
}
