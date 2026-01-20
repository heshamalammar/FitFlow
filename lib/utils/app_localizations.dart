/// Arabic and English localization strings for FitFlow app.

class AppLocalizations {
  final String locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(String locale) {
    return AppLocalizations(locale);
  }

  // ============ APP INFO ============
  String get appName => 'FitFlow';
  String get appTagline => 'Your Personal Wellness Journey';

  // ============ AUTH ============
  String get welcomeBack => 'Welcome Back!';
  String get signInToContinue => 'Sign in to continue your wellness journey';
  String get email => 'Email';
  String get password => 'Password';
  String get enterEmail => 'Enter your email';
  String get enterPassword => 'Enter your password';
  String get signIn => 'Sign In';
  String get signUp => 'Sign Up';
  String get forgotPassword => 'Forgot Password?';
  String get dontHaveAccount => "Don't have an account?";
  String get alreadyHaveAccount => 'Already have an account?';
  String get fullName => 'Full Name';
  String get age => 'Age';
  String get confirmPassword => 'Confirm Password';
  String get createAccount => 'Create Account';
  String get joinUs => 'Join Us!';
  String get startJourney => 'Start your wellness journey today';

  // ============ HOME ============
  String get goodMorning => 'Good Morning';
  String get goodAfternoon => 'Good Afternoon';
  String get goodEvening => 'Good Evening';
  String get tipOfTheDay => 'Tip of the Day';
  String get todaysProgress => "Today's Progress";
  String get steps => 'Steps';
  String get calories => 'Calories';
  String get activeMin => 'Active Min';
  String get water => 'Water';
  String get quickStart => 'Quick Start';
  String get workouts => 'Workouts';
  String get meals => 'Meals';

  // ============ WORKOUTS ============
  String get workoutLibrary => 'Workout Library';
  String get all => 'All';
  String get yoga => 'Yoga';
  String get hiit => 'HIIT';
  String get strength => 'Strength';
  String get core => 'Core';
  String get flexibility => 'Flexibility';
  String get minutes => 'min';
  String get startWorkout => 'Start Workout';
  String get pause => 'Pause';
  String get resume => 'Resume';
  String get reset => 'Reset';
  String get instructions => 'Instructions';

  // ============ MEALS ============
  String get mealPlanner => 'Meal Planner';
  String get breakfast => 'Breakfast';
  String get lunch => 'Lunch';
  String get dinner => 'Dinner';
  String get snack => 'Snack';
  String get protein => 'Protein';
  String get carbs => 'Carbs';
  String get fat => 'Fat';
  String get ingredients => 'Ingredients';

  // ============ SETTINGS ============
  String get settings => 'Settings';
  String get appearance => 'Appearance';
  String get darkMode => 'Dark Mode';
  String get switchTheme => 'Switch to dark theme';
  String get notifications => 'Notifications';
  String get pushNotifications => 'Push Notifications';
  String get emailUpdates => 'Email Updates';
  String get about => 'About';
  String get privacyPolicy => 'Privacy Policy';
  String get termsOfService => 'Terms of Service';
  String get developer => 'Developer';
  String get developedBy => 'Developed by Hesham';
  String get language => 'Language';
  String get arabic => 'Arabic';
  String get english => 'English';

  // ============ DRAWER ============
  String get dashboard => 'Dashboard';
  String get logout => 'Logout';

  // ============ VALIDATION ============
  String get invalidEmail => 'Invalid email';
  String get passwordTooShort => 'Password too short';
  String get passwordsDontMatch => "Passwords don't match";
  String get fieldRequired => 'This field is required';
}

