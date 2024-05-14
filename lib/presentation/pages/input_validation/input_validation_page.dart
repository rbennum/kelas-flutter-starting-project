import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Validation"),
      ),
      body: const InputValidationView(),
    );
  }
}

class InputValidationView extends StatelessWidget {
  const InputValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: UIHelper.padding(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi there!",
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: ColorConstant.primary),
                    ),
                    Text("Please enter your name and email :)",
                        style: context.textTheme.bodyMedium)
                  ],
                ),
                UIHelper.verticalSpace(20),
                const TextFormFieldCustom(
                  title: "Name",
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter your name",
                ),
                UIHelper.verticalSpace(20),
                const TextFormFieldCustom(
                  title: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ),
        SafeArea(
            child: Padding(
              padding: UIHelper.padding(horizontal: 20, vertical: 10),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Submit')
                  )
              ),
            )
        ),
      ],
    );
  }
}
