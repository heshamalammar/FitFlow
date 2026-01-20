import 'package:flutter/material.dart';
import '../views/splash_screen.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';
import '../views/home_screen.dart';
import '../views/workout_library_screen.dart';
import '../views/workout_details_screen.dart';
import '../views/meal_planner_screen.dart';
import '../views/settings_screen.dart';
import '../views/onboarding_screen.dart';
import '../models/workout_model.dart';

/// Named route constants for navigation.
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String home = '/home';
  static const String workoutLibrary = '/workouts';
  static const String workoutDetails = '/workout-details';
  static const String mealPlanner = '/meals';
  static const String settings = '/settings';
  static const String onboarding = '/onboarding';
}

/// Route generator for the application.
/// Handles all navigation with proper transitions.
class AppRouter {
  AppRouter._();

  /// Generates routes based on route settings.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _buildRoute(const SplashScreen(), settings);

      case AppRoutes.onboarding:
        return _buildRoute(const OnboardingScreen(), settings);

      case AppRoutes.login:
        return _buildRoute(const LoginScreen(), settings);

      case AppRoutes.signUp:
        return _buildRoute(const SignUpScreen(), settings);

      case AppRoutes.home:
        return _buildRoute(const HomeScreen(), settings);

      case AppRoutes.workoutLibrary:
        return _buildRoute(const WorkoutLibraryScreen(), settings);

      case AppRoutes.workoutDetails:
        final workout = settings.arguments as WorkoutModel;
        return _buildRoute(WorkoutDetailsScreen(workout: workout), settings);

      case AppRoutes.mealPlanner:
        return _buildRoute(const MealPlannerScreen(), settings);

      case AppRoutes.settings:
        return _buildRoute(const SettingsScreen(), settings);

      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings,
        );
    }
  }

  /// Builds a page route with slide transition.
  static PageRouteBuilder<dynamic> _buildRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
