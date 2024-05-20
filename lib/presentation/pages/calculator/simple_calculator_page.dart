import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/calculator/calculator_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/pages/calculator/domain/calculator_type.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class SimpleCalculatorPage extends StatelessWidget {
  const SimpleCalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorCubit>(
      create: (context) => CalculatorCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Calculator"),
        ),
        body: Builder(
          builder: (context) {
            return BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: UIHelper.padding(vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CHOOSE TYPE",
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: ColorConstant.green,
                              ),
                            ),
                            UIHelper.verticalSpace(10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                ChipCustom(
                                  onTap: () => context
                                      .read<CalculatorCubit>()
                                      .selectType(const CalculatorType.add()),
                                  title: "Add",
                                  isSelected: state.isSelectedType(
                                    const CalculatorType.add(),
                                  ),
                                ),
                                ChipCustom(
                                  onTap: () => context
                                      .read<CalculatorCubit>()
                                      .selectType(
                                        const CalculatorType.subtract(),
                                      ),
                                  title: "Subtract",
                                  isSelected: state.isSelectedType(
                                    const CalculatorType.subtract(),
                                  ),
                                ),
                                ChipCustom(
                                  onTap: () => context
                                      .read<CalculatorCubit>()
                                      .selectType(
                                        const CalculatorType.multiply(),
                                      ),
                                  title: "Multiply",
                                  isSelected: state.isSelectedType(
                                    const CalculatorType.multiply(),
                                  ),
                                ),
                                ChipCustom(
                                  onTap: () => context
                                      .read<CalculatorCubit>()
                                      .selectType(
                                        const CalculatorType.divide(),
                                      ),
                                  title: "Divider",
                                  isSelected: state.isSelectedType(
                                    const CalculatorType.divide(),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: TextFormFieldCustom(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.displayLarge,
                                    maxLength: 2,
                                  ),
                                ),
                                UIHelper.horizontalSpace(10),
                                const Text("-"),
                                UIHelper.horizontalSpace(10),
                                SizedBox(
                                  width: 60,
                                  child: TextFormFieldCustom(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.displayLarge,
                                    maxLength: 2,
                                  ),
                                ),
                                UIHelper.horizontalSpace(10),
                                const Text('='),
                                UIHelper.horizontalSpace(10),
                                const Expanded(
                                  child: Text(
                                    '24324234324234234324223423423',
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    UIHelper.borderRadiusCircular(all: 5),
                                color: ColorConstant.lightGreen,
                              ),
                              padding: UIHelper.padding(
                                  vertical: 10, horizontal: 15),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.info_outline_rounded,
                                    color: ColorConstant.green,
                                  ),
                                  UIHelper.horizontalSpace(10),
                                  Expanded(
                                    child: Text(
                                      'Press the calculate button to get the result',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        color: ColorConstant.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            UIHelper.verticalSpace(10),
                            Text(
                              "HISTORY",
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: ColorConstant.green,
                              ),
                            ),
                            UIHelper.verticalSpace(10),
                            // TODO: Apply widget based on history condition
                            Text(
                              'No history found',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: ColorConstant.grey,
                                fontStyle: FontStyle.italic,
                              ),
                            )
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
                            child: const Text('CALCULATE'),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
