part of '../to_do_page.dart';

class _ToDoHistoryView extends StatelessWidget {
  const _ToDoHistoryView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HISTORY",
                style: context.textTheme.headlineSmall?.copyWith(
                  color: ColorConstant.green,
                ),
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: [
                  ChipCustom(
                    onTap: () => context.read<ToDoCubit>().setHistoryType(
                          const ToDoHistoryType.All(),
                        ),
                    title: "All",
                    isSelected: state.model.type == const ToDoHistoryType.All(),
                  ),
                  UIHelper.horizontalSpace(10),
                  ChipCustom(
                    onTap: () => context.read<ToDoCubit>().setHistoryType(
                          const ToDoHistoryType.Done(),
                        ),
                    title: "Done",
                    isSelected:
                        state.model.type == const ToDoHistoryType.Done(),
                  ),
                  UIHelper.horizontalSpace(10),
                  ChipCustom(
                    onTap: () => context.read<ToDoCubit>().setHistoryType(
                          const ToDoHistoryType.NotDone(),
                        ),
                    title: "Not Done",
                    isSelected:
                        state.model.type == const ToDoHistoryType.NotDone(),
                  ),
                ],
              ),
              UIHelper.verticalSpace(10),
            ],
          ),
        );
      },
    );
  }
}
