import 'package:education_app/core/injector.dart';
import 'package:education_app/core/strings.dart';
import 'package:education_app/features/feature_screen/bussines_logic/feature_cubit.dart';
import 'package:education_app/features/feature_screen/presentation/screen/feature_screen.dart';
import 'package:education_app/features/home_screen/bussines_logic/home_screen_cubit.dart';
import 'package:education_app/features/home_screen/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeScreenCubit>(),
            child: const HomeScreen(),
          ),
        );
      case featureScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FeatureCubit>()..getHomeData(token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NGFmMzFhYjUzNjkwMzEwOTZhNjYxYjUiLCJpYXQiOjE2ODkzNzE3MDd9.E1XSFoAJvYWTQLlRFhR0A8b-EfbEATx3VZThDbSKBaE'),
            child: const FeatureScreen(),
          ),
        );
      // case studentHomeScreen:
      // // UserData user = settings.arguments as UserData;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => StudentHomeScreenCubit(getIt()),
      //       child: StudentHomeScreen(
      //         // user: user,
      //       ),
      //     ),
      //   );
    }
    return null;
  }
}
