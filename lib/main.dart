import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_manager/app_manager_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'motor_mania_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  initGetIt();

  runApp(
    BlocProvider<AppManagerCubit>(
      create: (context) => AppManagerCubit(),
      child: const MotorManiaApp(),
    ),
  );
}
