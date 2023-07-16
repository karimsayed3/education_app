import 'package:education_app/core/colors.dart';
import 'package:education_app/core/models/category.dart';
import 'package:education_app/features/feature_screen/bussines_logic/feature_cubit.dart';
import 'package:education_app/features/feature_screen/bussines_logic/feature_state.dart';
import 'package:education_app/features/feature_screen/data/model/home_model.dart';
import 'package:education_app/features/feature_screen/presentation/widgets/category_card.dart';
import 'package:education_app/features/feature_screen/presentation/widgets/cirecle_button.dart';
import 'package:education_app/features/feature_screen/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FeatureCubit.get(context).getHomeData(
        token:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NGFmMzFhYjUzNjkwMzEwOTZhNjYxYjUiLCJpYXQiOjE2ODkzNzE3MDd9.E1XSFoAJvYWTQLlRFhR0A8b-EfbEATx3VZThDbSKBaE");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(),
          BlocBuilder<FeatureCubit, FeatureState>(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return Container();
                },
                loading: () {
                  return Container();
                },
                success: (data) {
                  print(data.message);
                  return Body(
                    homeData: data,
                  );
                },
                error: (networkExceptions) {
                  return Container();
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195.h,
      width: double.infinity,
      padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF886ff2),
            Color(0xFF6849ef),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,\nGood Morning',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          const SearchTextField(),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.homeData}) : super(key: key);

  final HomeDataModel homeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore Categories',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 350.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .77.h,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
            ),
            itemCount: homeData.data!.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryCard(
                category: homeData.data![index],
              );
            },
          ),
        ),
      ],
    );
  }
}
