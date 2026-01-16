/// Arabic and English localization strings for FitFlow app.

class AppLocalizations {
  final String locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(String locale) {
    return AppLocalizations(locale);
  }

  bool get isArabic => locale == 'ar';

  // ============ APP INFO ============
  String get appName => isArabic ? 'فيت فلو' : 'FitFlow';
  String get appTagline => isArabic 
      ? 'رحلتك الشخصية نحو الصحة' 
      : 'Your Personal Wellness Journey';

  // ============ AUTH ============
  String get welcomeBack => isArabic ? '!مرحباً بعودتك' : 'Welcome Back!';
  String get signInToContinue => isArabic 
      ? 'سجّل الدخول لمتابعة رحلتك الصحية' 
      : 'Sign in to continue your wellness journey';
  String get email => isArabic ? 'البريد الإلكتروني' : 'Email';
  String get password => isArabic ? 'كلمة المرور' : 'Password';
  String get enterEmail => isArabic ? 'أدخل بريدك الإلكتروني' : 'Enter your email';
  String get enterPassword => isArabic ? 'أدخل كلمة المرور' : 'Enter your password';
  String get signIn => isArabic ? 'تسجيل الدخول' : 'Sign In';
  String get signUp => isArabic ? 'إنشاء حساب' : 'Sign Up';
  String get forgotPassword => isArabic ? 'نسيت كلمة المرور؟' : 'Forgot Password?';
  String get dontHaveAccount => isArabic ? 'ليس لديك حساب؟' : "Don't have an account?";
  String get alreadyHaveAccount => isArabic ? 'لديك حساب بالفعل؟' : 'Already have an account?';
  String get fullName => isArabic ? 'الاسم الكامل' : 'Full Name';
  String get age => isArabic ? 'العمر' : 'Age';
  String get confirmPassword => isArabic ? 'تأكيد كلمة المرور' : 'Confirm Password';
  String get createAccount => isArabic ? 'إنشاء الحساب' : 'Create Account';
  String get joinUs => isArabic ? 'انضم إلينا!' : 'Join Us!';
  String get startJourney => isArabic 
      ? 'ابدأ رحلتك الصحية اليوم' 
      : 'Start your wellness journey today';

  // ============ HOME ============
  String get goodMorning => isArabic ? 'صباح الخير' : 'Good Morning';
  String get goodAfternoon => isArabic ? 'مساء الخير' : 'Good Afternoon';
  String get goodEvening => isArabic ? 'مساء الخير' : 'Good Evening';
  String get tipOfTheDay => isArabic ? 'نصيحة اليوم' : 'Tip of the Day';
  String get todaysProgress => isArabic ? 'تقدمك اليوم' : "Today's Progress";
  String get steps => isArabic ? 'الخطوات' : 'Steps';
  String get calories => isArabic ? 'السعرات' : 'Calories';
  String get activeMin => isArabic ? 'دقائق النشاط' : 'Active Min';
  String get water => isArabic ? 'الماء' : 'Water';
  String get quickStart => isArabic ? 'بداية سريعة' : 'Quick Start';
  String get workouts => isArabic ? 'التمارين' : 'Workouts';
  String get meals => isArabic ? 'الوجبات' : 'Meals';

  // ============ WORKOUTS ============
  String get workoutLibrary => isArabic ? 'مكتبة التمارين' : 'Workout Library';
  String get all => isArabic ? 'الكل' : 'All';
  String get yoga => isArabic ? 'يوغا' : 'Yoga';
  String get hiit => isArabic ? 'HIIT' : 'HIIT';
  String get strength => isArabic ? 'قوة' : 'Strength';
  String get core => isArabic ? 'جذع' : 'Core';
  String get flexibility => isArabic ? 'مرونة' : 'Flexibility';
  String get minutes => isArabic ? 'دقيقة' : 'min';
  String get startWorkout => isArabic ? 'ابدأ التمرين' : 'Start Workout';
  String get pause => isArabic ? 'إيقاف' : 'Pause';
  String get resume => isArabic ? 'استئناف' : 'Resume';
  String get reset => isArabic ? 'إعادة' : 'Reset';
  String get instructions => isArabic ? 'التعليمات' : 'Instructions';

  // ============ MEALS ============
  String get mealPlanner => isArabic ? 'مخطط الوجبات' : 'Meal Planner';
  String get breakfast => isArabic ? 'فطور' : 'Breakfast';
  String get lunch => isArabic ? 'غداء' : 'Lunch';
  String get dinner => isArabic ? 'عشاء' : 'Dinner';
  String get snack => isArabic ? 'وجبة خفيفة' : 'Snack';
  String get protein => isArabic ? 'بروتين' : 'Protein';
  String get carbs => isArabic ? 'كربوهيدرات' : 'Carbs';
  String get fat => isArabic ? 'دهون' : 'Fat';
  String get ingredients => isArabic ? 'المكونات' : 'Ingredients';

  // ============ SETTINGS ============
  String get settings => isArabic ? 'الإعدادات' : 'Settings';
  String get appearance => isArabic ? 'المظهر' : 'Appearance';
  String get darkMode => isArabic ? 'الوضع الداكن' : 'Dark Mode';
  String get switchTheme => isArabic ? 'تبديل المظهر الداكن' : 'Switch to dark theme';
  String get notifications => isArabic ? 'الإشعارات' : 'Notifications';
  String get pushNotifications => isArabic ? 'إشعارات الدفع' : 'Push Notifications';
  String get emailUpdates => isArabic ? 'تحديثات البريد' : 'Email Updates';
  String get about => isArabic ? 'حول' : 'About';
  String get privacyPolicy => isArabic ? 'سياسة الخصوصية' : 'Privacy Policy';
  String get termsOfService => isArabic ? 'شروط الخدمة' : 'Terms of Service';
  String get developer => isArabic ? 'المطور' : 'Developer';
  String get developedBy => isArabic ? 'تم التطوير بواسطة حسام' : 'Developed by Hesham';
  String get language => isArabic ? 'اللغة' : 'Language';
  String get arabic => isArabic ? 'العربية' : 'Arabic';
  String get english => isArabic ? 'الإنجليزية' : 'English';

  // ============ DRAWER ============
  String get dashboard => isArabic ? 'لوحة التحكم' : 'Dashboard';
  String get logout => isArabic ? 'تسجيل الخروج' : 'Logout';

  // ============ VALIDATION ============
  String get invalidEmail => isArabic ? 'بريد إلكتروني غير صالح' : 'Invalid email';
  String get passwordTooShort => isArabic 
      ? 'كلمة المرور قصيرة جداً' 
      : 'Password too short';
  String get passwordsDontMatch => isArabic 
      ? 'كلمات المرور غير متطابقة' 
      : "Passwords don't match";
  String get fieldRequired => isArabic ? 'هذا الحقل مطلوب' : 'This field is required';
}
