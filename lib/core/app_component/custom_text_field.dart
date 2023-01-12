import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_sizes.dart';

import '../utils/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.isSelect,
      this.widget});
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.pH8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.bodySmall(
            title,
            context: context,
          ),
          SizedBox(
            height: AppSizes.pH6,
          ),
          SizedBox(
            height: AppSizes.textFormFieldHeight,
            child: TextFormField(
              readOnly: isSelect == null ? false : true,
              controller: controller,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: AppSizes.fs13),
              decoration: InputDecoration(hintText: hint, suffixIcon: widget),
            ),
          ),
        ],
      ),
    );
  }
}
