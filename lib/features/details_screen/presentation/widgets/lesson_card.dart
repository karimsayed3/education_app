import 'package:education_app/core/constants.dart';
import 'package:education_app/core/models/lesson.dart';
import 'package:education_app/features/details_screen/data/model/lessons_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonCard extends StatelessWidget {
  final Lessons lesson;
  const LessonCard({Key? key, required this.lesson}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          false
              ? Image.asset(
            icLearning,
            height: 45,
          )
              : Image.asset(
            icPlayNext,
            height: 45.h,
          ),
           SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  lesson.timer.toString(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // lesson.isCompleted
          //     ? Image.asset(
          //   icDone,
          //   height: 30,
          // )
          //     : Image.asset(
          //   icLock,
          //   height: 30,
          // ),
        ],
      ),
    );
  }
}