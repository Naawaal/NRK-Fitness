import 'package:get/get.dart';
import 'package:nrk_fitness/app/routes/routes_name.dart';
import 'package:nrk_fitness/app/ui/pages/01splash_screen/splash_screen.dart';
import 'package:nrk_fitness/app/ui/pages/02login_signup_screen/login_signup_screen.dart';
import 'package:nrk_fitness/app/ui/pages/03otp_screen/otp_screen.dart';
import 'package:nrk_fitness/app/ui/pages/04sign_up_user_detail_screen/signup_user_detail_screen.dart';
import 'package:nrk_fitness/app/ui/pages/05splash_screen/second_splash_screen.dart';
import 'package:nrk_fitness/app/ui/pages/06home_screen/home_screen.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesName.loginOrSignupScreen,
          page: () => const LoginSignupScreen(),
        ),
        GetPage(
          name: RoutesName.otpScreen,
          page: () => const OtpScreen(),
        ),
        GetPage(
          name: RoutesName.signupUserDetailScreen,
          page: () => const SignupUserDetailScreen(),
        ),
        GetPage(
          name: RoutesName.secondSplashScreen,
          page: () => const SecondSplashScreen(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
      ];
}
