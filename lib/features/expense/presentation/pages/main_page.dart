import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/pages/add_expense_page.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/pages/home_page.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/pages/profile_page.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/pages/state_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  final List<Widget> pages = [
  const  HomeScreen(),
   const StatisticsScreen(),
   const AddExpenseUI(),
   const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor:const Color.fromARGB(255, 255, 252, 252),
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items:const  [

          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Dashbord",
            
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Stats",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Add",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}