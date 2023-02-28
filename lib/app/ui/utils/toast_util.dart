import 'package:fluttertoast/fluttertoast.dart';
import 'package:nrk_fitness/app/ui/theme/colors.dart';

class FlutterToastUtil {
  static flutterToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorConst.primarySplashRedColor,
      fontSize: 16,
      toastLength: Toast.LENGTH_SHORT,
      textColor: ColorConst.primaryContainerBgColor,
    );
  }
}
