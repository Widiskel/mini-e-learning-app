import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Home/views/home_view.dart';
import 'package:mini_e_learning/app/modules/dashboard/page/Profile/views/profile_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndex.value;
      return SafeArea(
        child: Scaffold(
          body: IndexedStack(
              index: controller.selectedNavIndex.value, children: _bodyList()),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              controller.navigateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_outlined),
                label: 'Diskusi Soal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
        const HomeView(),
        const Placeholder(child: Center(child: Text('test'))),
        const ProfileView(),
      ];
}
