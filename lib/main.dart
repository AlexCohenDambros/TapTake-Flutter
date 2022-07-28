import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tap_take/Screens/Menu/restaurants.dart';
import 'package:tap_take/Screens/SplashScreen/splash_screen.dart';
import 'package:tap_take/components_main/check_token.dart';
import 'package:tap_take/constants.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const TapTake()));
}

class TapTake extends StatefulWidget {
  const TapTake({Key? key}) : super(key: key);

  @override
  State<TapTake> createState() => _TapTakeState();
}

class _TapTakeState extends State<TapTake> {
  _TapTakeState() {}
  bool check_user = false;
  bool is_loading = true;

  @override
  void initState() {
    super.initState();
    Check_Login();
  }

  void Check_Login() async {
    var check_token = await CheckToken();
    // ignore: unnecessary_null_comparison
    if (check_token != null) {
      setState(() {
        check_user = true;
      });
    }
    setState(() {
      is_loading = false;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TapTake',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kPrimaryDarkColor),
      home: check_user
          ? const MenuScreen()
          : is_loading
              ? PlatformScaffold()
              : const SplashScreen(),
    );
  }
}
