import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/resources/color manager.dart';
import 'core/services/service locator.dart';
import 'core/widgets/custom dialog.dart';
import 'features/home feature/presentation/controller/folder files controller/folder files cubit.dart';
import 'features/home feature/presentation/controller/home page controller/home page cubit.dart';
import 'features/home feature/presentation/controller/load all data controller/load all data cubit.dart';
import 'features/splash feature/presentation/pages/splash page.dart';
import 'features/storage details/presentation/controller/storage details cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ServiceLocator.setup();
  runApp(const Dribbox());
}

class Dribbox extends StatelessWidget {
  const Dribbox({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FolderFilesCubit>(create: (context) => FolderFilesCubit()),
        BlocProvider<HomePageCubit>(create: (context) => HomePageCubit()),
        BlocProvider<StorageDetailsCubit>(
            create: (context) => StorageDetailsCubit()),
        BlocProvider<LoadAllDataCubit>(
            create: (context) => LoadAllDataCubit()..loadAllData()),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.whiteColor,
          ),
          scaffoldBackgroundColor: ColorManager.whiteColor,
        ),
        home: PopScope(
          canPop: false,
          onPopInvoked: (val) async {
            await showCustomDialog();
          },
          child: const SplashPage(),
        ),
      ),
    );
  }
}
