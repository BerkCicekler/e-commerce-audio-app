part of '../filter_bottom_sheet.dart';

final class _CompleteButton extends StatelessWidget {
  const _CompleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<_FilterBottomSheetViewModel>(context);
    return ElevatedButton(
      onPressed: () => vm.onCompleteButton(context),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(_FilterBottomSheetLocalization.applyFilter),
    );
  }
}
