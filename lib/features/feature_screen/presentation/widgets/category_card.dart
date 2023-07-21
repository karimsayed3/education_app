import 'package:education_app/core/constants.dart';
import 'package:education_app/core/injector.dart';
import 'package:education_app/core/models/category.dart';
import 'package:education_app/features/course_screen/bussines_logic/courses_cubit.dart';
import 'package:education_app/features/course_screen/presentation/screen/course_screen.dart';
import 'package:education_app/features/feature_screen/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);
  final Data category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => CoursesCubit(getIt()),
                  child: CourseScreen(title: category.name!),
                ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                category.image!,
                height: kCategoryCardImageSize,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name!),
            Text('${category.noOfCourses.toString()} courses')
          ],
        ),
      ),
    );
  }
}
