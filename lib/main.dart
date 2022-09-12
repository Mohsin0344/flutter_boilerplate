import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tazah_tech_sale/utils/app_routes.dart';
import 'package:tazah_tech_sale/cubits/auth_example_cubit/auth_cubit.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit.dart';
import 'package:tazah_tech_sale/data/repositories/auth_repository/auth_repository.dart';
import 'package:tazah_tech_sale/utils/bloc_providers.dart';
import 'utils/app_screen_names.dart';
import 'data/repositories/example_repository/example_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (child) {
          return MaterialApp(
            title: 'Flutter Boilerplate',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: AppRoutes().generateRoute,
            initialRoute: ScreenNames.loginScreen,
          );
        },
      ),
    );
  }
}
