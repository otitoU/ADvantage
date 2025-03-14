import 'package:advantage_client/screens/campaign_screen.dart';
import 'package:flutter/material.dart';
import '../screens/onboarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/business_setup.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => OnboardingScreen(),
    '/home': (context) => HomeScreen(),
    '/dashboard': (context) => DashboardScreen(),
    '/settings': (context) => SettingsScreen(),
    '/business_setup': (context) => BusinessSetupScreen(),
    '/campaign': (context) => CampaignScreen(),
  };
}
