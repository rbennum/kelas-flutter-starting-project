part of '../to_do_page.dart';

class _ToDoHistoryListView extends StatelessWidget {
  const _ToDoHistoryListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        if (state.historyListByStatus.isEmpty) {
          return SliverToBoxAdapter(
            child: Text(
              "No histories found",
              style: context.textTheme.bodySmall?.copyWith(
                color: ColorConstant.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        }
        return SliverList.separated(
          itemBuilder: (context, index) {
            ToDoHistoryEntity item = state.historyListByStatus[index];
            return Row(
              children: [
                Checkbox(
                  value: item.isDone,
                  onChanged: (val) {
                    context.read<ToDoCubit>().setTaskDone(item, val ?? false);
                  },
                ),
                Expanded(
                  child: Text(item.text),
                ),
                if (state.isEdited(item.id))
                  Text(
                    "(edited)",
                    style: context.textTheme.labelSmall?.copyWith(
                      color: ColorConstant.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                IconButton(
                  onPressed: () => context.read<ToDoCubit>().editTask(item),
                  icon: const Icon(
                    Icons.edit,
                    color: ColorConstant.primary,
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<ToDoCubit>().deleteTask(item),
                  icon: const Icon(
                    Icons.delete,
                    color: ColorConstant.primary,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (_, i) {
            return UIHelper.divider();
          },
          itemCount: state.model.historyList.length,
        );
      },
    );
  }
}
