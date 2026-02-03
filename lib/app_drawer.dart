import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/main_screen.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class AppDrawer extends StatelessWidget {
  final DrawerMenu currentMenu;
  final ValueChanged<DrawerMenu> onMenuSelected;

  const AppDrawer({
    super.key,
    required this.currentMenu,
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _DrawerItem(
                  menu: DrawerMenu.home,
                  currentMenu: currentMenu,
                  title: 'Menu Items',
                  iconOutline: Icons.dataset_outlined,
                  iconFill: Icons.dataset_rounded,
                  onTap: () => onMenuSelected(DrawerMenu.home),
                ),
                _DrawerItem(
                  menu: DrawerMenu.products,
                  currentMenu: currentMenu,
                  title: 'Products',
                  iconOutline: Icons.inventory_2_outlined,
                  iconFill: Icons.inventory_2,
                  onTap: () => onMenuSelected(DrawerMenu.products),
                ),
                _DrawerItem(
                  menu: DrawerMenu.transaction,
                  currentMenu: currentMenu,
                  title: 'Transactions',
                  iconOutline: Icons.compare_arrows_outlined,
                  iconFill: Icons.compare_arrows,
                  onTap: () => onMenuSelected(DrawerMenu.transaction),
                ),
                _DrawerItem(
                  menu: DrawerMenu.aiReport,
                  currentMenu: currentMenu,
                  title: 'AI Reports',
                  iconOutline: Icons.rocket_outlined,
                  iconFill: Icons.rocket,
                  onTap: () => onMenuSelected(DrawerMenu.aiReport),
                ),
                _DrawerItem(
                  menu: DrawerMenu.profile,
                  currentMenu: currentMenu,
                  title: 'Profile',
                  iconOutline: Icons.person_3_outlined,
                  iconFill: Icons.person,
                  onTap: () => onMenuSelected(DrawerMenu.profile),
                ),
                _DrawerItem(
                  menu: DrawerMenu.logout,
                  currentMenu: currentMenu,
                  title: 'Logout',
                  iconOutline: Icons.logout_outlined,
                  iconFill: Icons.logout,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    debugPrint('berhasil logout');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(color: ColorConstant.primary),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.blueAccent,
              ),
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              "POS - AI Powered",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "admin@pos-ai.com",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final DrawerMenu menu;
  final DrawerMenu currentMenu;
  final String title;
  final IconData iconOutline;
  final IconData iconFill;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.menu,
    required this.currentMenu,
    required this.title,
    required this.iconOutline,
    required this.iconFill,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = menu == currentMenu;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isActive
            ? ColorConstant.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        leading: Icon(
          isActive ? iconFill : iconOutline,
          color: isActive ? Colors.blue.shade800 : Colors.grey.shade600,
        ),
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? Colors.blue.shade800 : Colors.black87,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
