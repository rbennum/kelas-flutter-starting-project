part of '../to_do_page.dart';

class _ToDoInputView extends StatelessWidget {
  const _ToDoInputView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldCustom(
                title: "To Do",
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                style: context.textTheme.bodyMedium,
                maxLines: 3,
                hintText: "Please enter your task",
                controller: context.read<ToDoCubit>().inputController,
                validator: (_) => state.getErrorMessage,
              ),
              UIHelper.verticalSpace(10),
            ],
          ),
        );
      },
    );
  }
}
