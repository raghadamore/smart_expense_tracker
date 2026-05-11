import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/pages/add_expense_page.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/nav_icon_widget.dart';

class BuildBottomNavBarWidget extends StatelessWidget {
  const BuildBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: screenWidth(50, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  isActive = true;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpenseUI(),
                      ));
                },
                child: NavIconWidget(
                  icon: Icons.dashboard,
                  label: "Dashboard",
                  isActive: isActive,
                )),
            const NavIconWidget(
              icon: Icons.bar_chart,
              label: "Stats",
              isActive: false,
            ),
            SizedBox(width: screenWidth(50, context)),
            const NavIconWidget(
              icon: Icons.add_box,
              label: "Add",
              isActive: false,
            ),
            const NavIconWidget(
              icon: Icons.category,
              label: "Categories",
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
