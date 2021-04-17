import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class AppSnackBar {
  Future<void> showSnackBar(context, message) async {
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }
}