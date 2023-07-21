import 'package:education_app/core/colors.dart';
import 'package:education_app/core/constants.dart';
import 'package:education_app/core/models/lesson.dart';
import 'package:education_app/features/details_screen/business_logic/lessons_cubit.dart';
import 'package:education_app/features/details_screen/business_logic/lessons_state.dart';
import 'package:education_app/features/details_screen/data/model/lessons_data_model.dart';
import 'package:education_app/features/details_screen/presentation/widgets/custom_video_player.dart';
import 'package:education_app/features/details_screen/presentation/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class DetailsScreen extends StatefulWidget {
  final String title;

  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LessonsCubit.get(context).getLessonsById(
      courseId: '64aed784901511743987522f',
      token:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NGFmMzdjNzYyYzQwYmNjNDMzY2VkNTkiLCJpYXQiOjE2ODkzNTg1Mjh9.ypKzTG_4dlE7nd_Yyex0oRn1wLaXVEzCnrvfVMzHffw",
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<LessonsCubit, LessonsState<LessonsDataModel>>(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return Container();
                },
                loading: () {
                  return Container();
                },
                success: (lessons) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Stack(
                            children: [
                              Align(
                                child: Text(
                                  "flutter",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                child: CustomIconButton(
                                  child: const Icon(Icons.arrow_back),
                                  height: 35.h,
                                  width: 35.w,
                                  onTap: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomVideoPlayer(
                          url: lessons.data![0].lessons![0].url!,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          lessons.data![0].lessons![0].name!,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTabView(
                          index: _selectedTag,
                          changeTab: changeTab,
                          length: lessons.data![0].lessons!.length - 1,
                        ),
                        _selectedTag == 0
                            ? PlayList(
                                lessons: lessons.data![0].lessons!,
                              )
                            : Description(
                                description:
                                    lessons.data![0].description.toString(),
                              ),
                      ],
                    ),
                  );
                },
                error: (networkExceptions) {
                  return Container();
                },
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,

          items: [
            BottomNavigationBarItem(
              label: "add to favourite",
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "add to my learnings",
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 30,
              ),
            ),
          ],
        ),
        // bottomSheet: BottomSheet(
        //   onClosing: () {},
        //   backgroundColor: Colors.white,
        //   enableDrag: false,
        //   builder: (context) {
        //     return const SizedBox(
        //       height: 60,
        //       child: EnrollBottomSheet(),
        //     );
        //   },
        // ),
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({Key? key, required this.lessons}) : super(key: key);

  final List<Lessons> lessons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return SizedBox(
            height: 20.h,
          );
        },
        padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: lessons.length - 1,
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessons[index + 1]);
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key, required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h),
      child: Text(
        description,
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  final int length;

  const CustomTabView(
      {Key? key,
      required this.changeTab,
      required this.index,
      required this.length})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState(length);
}

class _CustomTabViewState extends State<CustomTabView> {
  List<String> _tags = [];
  final int length;

  _CustomTabViewState(this.length);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tags = ["Playlist (${length.toString()})", "Description"];
  }

  Widget _buildTags(int index) {
    print(widget.length);
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {},
            height: 45,
            width: 45,
            child: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomIconButton(
              onTap: () {},
              color: kPrimaryColor,
              height: 45,
              width: 45,
              child: const Text(
                "Enroll Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Center(child: child),
        onTap: onTap,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
    );
  }
}
