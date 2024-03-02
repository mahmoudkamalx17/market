import 'package:flutter/material.dart';
import 'package:market/core/helper/extentions.dart';
import 'package:market/core/helper/spacing.dart';
import 'package:market/features/signup/ui/widgets/data_of_form_field_sign_up.dart';
import 'package:market/features/signup/ui/widgets/sign_up_bloc_listener.dart';

class SignUpScrren extends StatelessWidget {
  const SignUpScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      child: Container(
                        width: 48,
                        height: 48,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xB2B2CCFF)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.navigatePop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240.59,
                      height: 200,
                      child: Image.asset(
                        'assets/images/png/Logo_Splash_Screen.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                verticalSpace(18),
                const DataOfSignUpFormField(),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
