import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpn_learn/data/colors.dart';
import 'package:jpn_learn/data/routes.dart';
import 'package:jpn_learn/screens/screens.dart';
import 'package:jpn_learn/view/matrix_view.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MatrixView()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryBackground,
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: AppColors.primaryText,
            displayColor: AppColors.primaryText,
          )),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.unknown: (context) => const UnknownPage(),
      },
    );
  }
}
