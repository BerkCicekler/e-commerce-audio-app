part of '../profile_page.dart';

final class _ProfileActions extends StatelessWidget {
  const _ProfileActions();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    AppPaddingConstants.pageConst.copyWith(top: 0, bottom: 0),
                child: Text(
                  _ProfileActionListModel.allActionLists[i].title,
                  style: const TextStyle(
                    color: AppColorConstants.greyDark,
                    fontSize: 16,
                  ),
                ),
              ),
              _ProfileActionListBuilder(
                _ProfileActionListModel.allActionLists[i],
              ),
            ],
          );
        },
        itemCount: _ProfileActionListModel.allActionLists.length,
      ),
    );
  }
}

final class _ProfileActionListBuilder extends StatelessWidget {
  const _ProfileActionListBuilder(this.model);

  final _ProfileActionListModel model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        return InkWell(
          onTap: model.actions[i].onTap,
          child: Container(
            padding: AppPaddingConstants.pageConst.copyWith(
              top: 17,
              bottom: 17,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColorConstants.dividerColor),
              ),
            ),
            child: Text(
              model.actions[i].text,
              style: const TextStyle(fontSize: 15.5),
            ),
          ),
        );
      },
      itemCount: model.actions.length,
    );
  }
}
