/// lib/widgets/nav_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

class NavBar extends StatelessWidget {
  final Widget child;
  const NavBar({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(context, currentRoute),
          Container(
            width: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context, String currentRoute) {
    return Container(
      width: 260,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/Ad_Logo.png', width: 250)),
          SizedBox(height: 30),
          _buildSidebarItem(
              Icons.home, 'Home', currentRoute == '/home', context, '/home'),
          _buildSidebarItem(Icons.dashboard, 'Dashboard',
              currentRoute == '/dashboard', context, '/dashboard'),
          _buildSidebarItem(Icons.campaign, 'Campaign',
              currentRoute == '/campaign', context, '/campaign'),
          _buildSidebarItem(Icons.insights, 'Insights',
              currentRoute == '/insights', context, '/insights'),
          _buildSidebarItem(Icons.eco, 'Sustainability',
              currentRoute == '/sustainability', context, '/sustainability'),
          _buildSidebarItem(Icons.credit_card, 'Billings',
              currentRoute == '/billings', context, '/billings'),
          _buildSidebarItem(Icons.person, 'Profile', currentRoute == '/profile',
              context, '/profile'),
          _buildSidebarItem(Icons.settings, 'Settings',
              currentRoute == '/settings', context, '/settings'),
          Spacer(),
          Center(
              child:
                  Image.asset('assets/images/Amazon-Ads-logo.png', width: 150)),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, bool isSelected,
      BuildContext context, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon,
                  color: isSelected ? AppColors.primary : Colors.grey,
                  size: 22),
              SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? const Color.fromARGB(255, 97, 181, 128)
                      : Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
