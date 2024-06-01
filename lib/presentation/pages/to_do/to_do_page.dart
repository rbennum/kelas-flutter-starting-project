import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/to_do/to_do_cubit.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/domain/to_do/to_do_history_entity.dart';
import 'package:student_lecture_app/domain/to_do/to_do_history_type.dart';
import 'package:student_lecture_app/presentation/widgets/atoms/text_theme_extension.dart';
import 'package:student_lecture_app/presentation/widgets/molecules/chip.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/text_form_field.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

part 'widgets/to_do_history_list_view.dart';
part 'widgets/to_do_history_view.dart';
part 'widgets/to_do_input_view.dart';

@RoutePage()
class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ToDoCubit>(
      create: (context) => ToDoCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To Do"),
        ),
        body: Padding(
          padding: UIHelper.padding(horizontal: 20),
          child: CustomScrollView(
            controller: ScrollController(),
            slivers: const <Widget>[
              _ToDoInputView(),
              _ToDoHistoryView(),
              _ToDoHistoryListView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          margin: UIHelper.padding(horizontal: 10, vertical: 20),
          child: BlocBuilder<ToDoCubit, ToDoState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  context.read<ToDoCubit>().submit();
                },
                child: Text(state.isNewTask ? "Save" : "Update"),
              );
            },
          ),
        ),
      ),
    );
  }
}
