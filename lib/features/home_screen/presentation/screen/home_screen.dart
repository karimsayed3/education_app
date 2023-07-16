import 'package:education_app/core/colors.dart';
import 'package:education_app/core/constants.dart';
import 'package:education_app/features/home_screen/bussines_logic/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = HomeScreenCubit.get(context);
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icFeatured,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icFeaturedOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "Featured",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icLearning,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icLearningOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "My Learning",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icWishlist,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icWishlistOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "Wishlist",
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  icSetting,
                  height: kBottomNavigationBarItemSize,
                ),
                icon: Image.asset(
                  icSettingOutlined,
                  height: kBottomNavigationBarItemSize,
                ),
                label: "Settings",
              ),
            ],
            currentIndex: cubit.index,
            onTap: (value) {
              cubit.changePage(value);
            },
          ),
        );
      },
    );
  }
}
