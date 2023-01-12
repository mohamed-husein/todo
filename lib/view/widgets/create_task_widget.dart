import 'package:flutter/material.dart';
import 'package:todo/core/global/theme/theme_color/theme_color_light.dart';
import 'package:todo/core/utils/app_sizes.dart';

import '../../core/utils/custom_text.dart';

class CreateTaskWidget extends StatefulWidget {
  const CreateTaskWidget({super.key, required this.onTap, required this.colors});
  final VoidCallback onTap;
  final List<String> colors;

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  final List<Color> colors = [
    ThemeColorLight.primaryClr,
    ThemeColorLight.pinkClr,
    ThemeColorLight.yellowClr
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.bodySmall(
              "Color",
              context: context,
            ),
            SizedBox(
              height: AppSizes.pH6,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                  colors.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(right: AppSizes.pW2),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: AppSizes.br15,
                            backgroundColor: colors[index],
                            child: selectedIndex == index
                                ? const Icon(
                                    Icons.check,
                                    color: ThemeColorLight.white,
                                  )
                                : null,
                          ),
                        ),
                      )),
            )
          ],
        ),
        ElevatedButton(
          onPressed: widget.onTap,
          child: CustomText.titleMedium("+ Add Task", context: context),
        ),
      ],
    );
  }
}
