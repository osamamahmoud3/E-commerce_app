import 'package:awesome_dialog/awesome_dialog.dart';

Future<dynamic> errorDialog(context, dynamic state) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: 'Error',
    desc: state.errorMsg,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  ).show();
}
