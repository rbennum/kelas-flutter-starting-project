part of '../to_do_page.dart';

class _ToDoHistoryListView extends StatelessWidget {
  const _ToDoHistoryListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoCubit, ToDoState>(
      builder: (context, state) {
        if (state.model.historyList.isEmpty) {
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
            ToDoHistoryEntity item = state.model.historyList[index];
            return Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (val) {
                    return;
                  },
                ),
                Expanded(
                  child: Text(item.text),
                ),
                Text(
                  "(edited)",
                  style: context.textTheme.labelSmall?.copyWith(
                    color: ColorConstant.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: ColorConstant.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
