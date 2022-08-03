import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tap_take/Screens/Menu/restaurants.dart';
import 'package:tap_take/Screens/SplashScreen/splash_screen.dart';
import 'package:tap_take/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tap_take/Screens/Loading/loading.dart';
import 'package:tap_take/services/user_credentials.dart';
import 'package:tap_take/services/user_data.dart';

Future<void> main() async {
  await Hive.initFlutter();
  GetIt.I.registerSingleton(UserCredentialServices());
  GetIt.I.registerSingleton(UserDataServices());

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
    await GetIt.I.get<UserCredentialServices>().awaitReady();
    await GetIt.I.get<UserDataServices>().awaitReady();

    var check_token = GetIt.I.get<UserCredentialServices>().getToken();
    if (check_token != null) {
      setState(() {
        check_user = true;
        try {
          GetIt.I.get<UserDataServices>().getDataUser();
        } on Exception catch (_) {}
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
              ? LoadingScreen()
              : const SplashScreen(),
    );
  }
}
