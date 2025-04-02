import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realtime_innovation_employee_app/core/service_locator/service_locator.dart';
import 'package:realtime_innovation_employee_app/core/theme/app_theme.dart';
import 'package:realtime_innovation_employee_app/core/utils/screen_utils.dart';
import 'package:realtime_innovation_employee_app/data/models/employee_model.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_bloc.dart';
import 'package:realtime_innovation_employee_app/presentation/blocs/employee_events.dart';
import 'package:realtime_innovation_employee_app/presentation/screens/employees_list_screen.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///initialize all required components
  ///screen utils
  await ScreenUtil.ensureScreenSize();

  ///hive
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeModelAdapter());
  await Hive.openBox<EmployeeModel>('employeesBox');

  ///service locators
  await initServiceLocator();

  ///run the app now
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return BlocProvider(
      create: (context) => sl<EmployeeBloc>()..add(GetEmployees()),
      child: ScreenUtilInit(
        designSize: Size(
          ScreenUtilities.designSizeWidth,
          ScreenUtilities.designSizeHeight,
        ),
        builder:
            (_, child) => MaterialApp(
              scaffoldMessengerKey: scaffoldMessengerKey,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [Locale('en', '')],
              debugShowCheckedModeBanner: false,
              title: 'Realtime Innovations',
              theme: appTheme,
              home: EmployeeListScreen(),
            ),
      ),
    );
  }
}
