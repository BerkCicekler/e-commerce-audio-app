import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom action dialog widget and manager
class AppActionDialog extends StatelessWidget {
  /// its a custom action dialog for getting user's choice
  /// the return type will be bool or null
  /// [contextText] text that will show on the context
  /// [okText] accept/ok action text label for localization support
  /// [cancelText] cancel action text label for localization support
  const AppActionDialog({
    required this.title,
    required this.contextText,
    required this.okText,
    required this.cancelText,
    super.key,
  });

  /// this function will show the custom action dialog automatic
  /// use for get choice of the user
  /// [context] BuildContext
  /// [title] title of the alert box
  /// [contextText] title of the alert box
  /// [okText] accept/ok action text label for localization support
  /// [cancelText] cancel action text label for localization support
  /// return type will be bool or null
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String contextText,
    required String okText,
    required String cancelText,
  }) async {
    return await showDialog<bool?>(
          context: context,
          builder: (_) {
            return AppActionDialog(
              title: title,
              contextText: contextText,
              okText: okText,
              cancelText: cancelText,
            );
          },
        ) ??
        false;
  }

  /// title string will show up in the title text
  final String title;

  /// context string will show up in the context text
  final String contextText;

  /// accept text for localization support
  final String okText;

  /// cancel text for localization support
  final String cancelText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(contextText),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(
            cancelText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(
            okText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
