import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:education_app/core/app_router.dart';
import 'package:education_app/core/bloc_observer.dart';
import 'package:education_app/core/injector.dart';
import 'package:education_app/features/home_screen/bussines_logic/home_screen_cubit.dart';
import 'package:education_app/features/home_screen/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
if(Platform.isMacOS || Platform.isWindows || Platform.isLinux){
  await windowManager.ensureInitialized();

  WindowOptions windowOptions =  WindowOptions(
    size: await windowManager.getSize(),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: false,
    minimumSize: const Size(600,600),
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}


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
