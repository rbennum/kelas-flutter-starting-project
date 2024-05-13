import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Validation"),),
      body: SingleChildScrollView(
        padding: UIHelper.padding(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi there!"),
                Text("Please enter your name and email :)")
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
            ),
            // const Spacer(),

          ],
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {},
          )
        )
      ],
    );
  }
}
