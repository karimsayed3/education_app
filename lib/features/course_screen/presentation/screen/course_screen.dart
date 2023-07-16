import 'package:education_app/core/models/course.dart';
import 'package:education_app/features/course_screen/bussines_logic/courses_cubit.dart';
import 'package:education_app/features/course_screen/bussines_logic/courses_state.dart';
import 'package:education_app/features/course_screen/data/model/course_data_model.dart';
import 'package:education_app/features/course_screen/presentation/widgets/course_container.dart';
import 'package:education_app/features/course_screen/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CoursesCubit.get(context).getHomeDataCoursesByCategoryId(
        categoryId: '64aed5ea8ea1c845e729b06e',
        token:
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NGFmMzFhYjUzNjkwMzEwOTZhNjYxYjUiLCJpYXQiOjE2ODkzNzE3MDd9.E1XSFoAJvYWTQLlRFhR0A8b-EfbEATx3VZThDbSKBaE");
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: Icon(
                            Icons.arrow_back,
                          ),
                          height: 35.h,
                          width: 35.w,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<CoursesCubit, CoursesState<CourseDataModel>>(
                  builder: (context, state) {
                    return state.when(
                      idle: () {
                        return Container();
                      },
                      loading: () {
                        return Container();

                      },
                      success: (courses) {
                        return Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CourseContainer(
                                      course: courses.data![index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                itemCount: courses.data!.length));
                      },
                      error: (networkExceptions) {
                        return Container();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
