import 'package:education_app/core/app_router.dart';
import 'package:education_app/core/bloc_observer.dart';
import 'package:education_app/core/injector.dart';
import 'package:education_app/features/home_screen/bussines_logic/home_screen_cubit.dart';
import 'package:education_app/features/home_screen/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  initGetIt();
  runApp( MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.appRouter});
  final AppRouter appRouter;  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // onGenerateRoute: appRouter.generateRoute,
          home: BlocProvider(
            create: (context) => HomeScreenCubit(),
            child: const HomeScreen(),
          ),
        );
      },
    );
  }
}
