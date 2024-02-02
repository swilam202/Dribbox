import 'package:dribbox/core/services/storage.dart';
import 'package:dribbox/features/auth%20feature/presentation/pages/on%20boarding%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../features/home feature/presentation/pages/home page.dart';
import '../../features/storage details/presentation/pages/storage details page.dart';
import '../utils/constants.dart';
import '../utils/custom navigation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset(
                  kLogo,
                ),
              ),
              ListTile(
                onTap: () {
                  CustomNavigation.pushReplacement(HomePage());
                },
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                onTap: () {
                  CustomNavigation.pushReplacement(StorageDetailsPage());
                },
                leading: Icon(Icons.storage),
                title: Text('Storage'),
              ),
              ListTile(
                onTap: () async {
                  await deleteData('phone');
                  CustomNavigation.pushReplacement(OnBoardingPage());
                },
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
