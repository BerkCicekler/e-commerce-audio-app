part of 'profile_page.dart';

/// this model help us to create a intractable list in the profile page
final class _ProfileActionListModel {
  _ProfileActionListModel(this.title, this.actions);

  final String title;
  final List<_ProfileActionListAction> actions;

  static final allActionLists = [
    generalActionList,
    legalActionList,
    personalActionList,
  ];

  static final generalActionList = _ProfileActionListModel(
    _ProfilePageLocalization.general,
    [
      _ProfileActionListAction(_ProfilePageLocalization.editProfile, () {}),
      _ProfileActionListAction(_ProfilePageLocalization.notifications, () {}),
      _ProfileActionListAction(_ProfilePageLocalization.wishlist, () {}),
    ],
  );

  static final legalActionList = _ProfileActionListModel(
    _ProfilePageLocalization.legal,
    [
      _ProfileActionListAction(_ProfilePageLocalization.termsOfUse, () {}),
      _ProfileActionListAction(_ProfilePageLocalization.privacyPolicy, () {}),
    ],
  );

  static final personalActionList = _ProfileActionListModel(
    _ProfilePageLocalization.personal,
    [
      _ProfileActionListAction(_ProfilePageLocalization.reportABug, () {}),
      _ProfileActionListAction(_ProfilePageLocalization.logout, () {
        RefreshTokenCache.instance.removeRefreshToken();
        GetIt.I<AuthManagerBloc>().add(AuthSignOutEvent());
      }),
    ],
  );
}

final class _ProfileActionListAction {
  _ProfileActionListAction(this.text, this.onTap);

  final String text;
  final void Function() onTap;
}
