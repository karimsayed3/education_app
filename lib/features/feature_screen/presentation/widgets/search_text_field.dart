import 'package:education_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
          size: 26.sp,
        ),
        suffixIcon: Icon(
          Icons.mic,
          color: kPrimaryColor,
          size: 26.sp,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: "Search Your Topic",
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
    );
  }
}
