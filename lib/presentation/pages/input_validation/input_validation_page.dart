import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/input_validation/input_validation_cubit.dart';
import 'package:student_lecture_app/application/input_validation/input_validation_state.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class InputValidationPage extends StatelessWidget {
  const InputValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Input Validation"),
        ),
        body: const InputValidationView(),
      ),
    );
  }
}

class InputValidationView extends StatelessWidget {
  const InputValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputValidationCubit, InputValidationState>(
      builder: (context, state) {
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
                          state.title,
                          style: context.textTheme.headlineMedium
                              ?.copyWith(color: ColorConstant.primary),
                        ),
                        Text(state.description,
                            style: context.textTheme.bodySmall
                                ?.copyWith(color: ColorConstant.grey))
                      ],
                    ),
                    UIHelper.verticalSpace(20),
                    TextFormFieldCustom(
                      title: "Name",
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      hintText: "Enter your name",
                      validator: (_) => state.showNameError,
                      controller:
                          context.read<InputValidationCubit>().nameController,
                    ),
                    UIHelper.verticalSpace(20),
                    TextFormFieldCustom(
                      title: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (_) => state.showEmailError,
                      controller:
                          context.read<InputValidationCubit>().emailController,
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
                        onPressed: () =>
                            context.read<InputValidationCubit>().submit(),
                        child: const Text('Submit'))),
              ),
            ),
          ],
        );
      },
    );
  }
}
