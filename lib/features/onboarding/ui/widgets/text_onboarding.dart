import 'package:flutter/material.dart';
import 'package:market/core/helper/spacing.dart';
import 'package:market/features/onboarding/ui/widgets/build_item_onboarding.dart';

import '../../../../core/theme/styles.dart';

class TextOnBoarding extends StatelessWidget {
  const TextOnBoarding({
    super.key,
    required this.widget,
  });

  final BuildItemOnBoarding widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model[widget.index!].title,
          textAlign: TextAlign.center,
          style: TextStyles.font20DarkBlueSemiBold,
        ),
        verticalSpace(44),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            model[widget.index!].body,
            style: TextStyles.font14DarkBlueMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
