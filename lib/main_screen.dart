import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/app_drawer.dart';
import 'package:pos_ai_powered/features/cart/use_cases/cart_use_case.dart';
import 'package:pos_ai_powered/features/home/body.dart';
import 'package:pos_ai_powered/features/product/presentation/pages/product_page.dart';

enum DrawerMenu { home, products, transaction, aiReport, profile, logout }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final CartUseCase cart;

  DrawerMenu _currentMenu = DrawerMenu.home;

  // Mapping Judul AppBar
  String get _appBarTitle {
    switch (_currentMenu) {
      case DrawerMenu.home:
        return "POS - AI Powered";
      case DrawerMenu.products:
        return "Products";
      case DrawerMenu.transaction:
        return "Transactions";
      case DrawerMenu.aiReport:
        return "AI Report";
      case DrawerMenu.profile:
        return "Profile";
      case DrawerMenu.logout:
        return "Logout";
    }
  }

  Widget _buildBody() {
    switch (_currentMenu) {
      case DrawerMenu.home:
        return const Body();
      case DrawerMenu.products:
        return const ProductPage();
      case DrawerMenu.transaction:
        return const Center(child: Text("Halaman Transaksi"));
      case DrawerMenu.aiReport:
        return const Center(child: Text("Halaman AI Report"));
      case DrawerMenu.profile:
        return const Center(child: Text("Halaman Profil"));
      case DrawerMenu.logout:
        return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          _appBarTitle,
          style: GoogleFonts.plusJakartaSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      drawer: AppDrawer(
        currentMenu: _currentMenu,
        onMenuSelected: (menu) {
          setState(() => _currentMenu = menu);
          Navigator.pop(context);
        },
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildBody(),
      ),
    );
  }
}
