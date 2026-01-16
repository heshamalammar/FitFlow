/// Meal model representing a healthy recipe or meal plan item.
/// Used in the Meal Planner screen.
class MealModel {
  final String id;
  final String name;
  final String description;
  final String mealType; // Breakfast, Lunch, Dinner, Snack
  final int calories;
  final int protein; // in grams
  final int carbs; // in grams
  final int fat; // in grams
  final List<String> ingredients;
  final String imageUrl;

  const MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.mealType,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.ingredients,
    required this.imageUrl,
  });

  /// Sample meal data for the app.
  static List<MealModel> getSampleMeals() {
    return [
      const MealModel(
        id: '1',
        name: 'Avocado Toast with Eggs',
        description: 'Whole grain toast topped with mashed avocado and poached eggs.',
        mealType: 'Breakfast',
        calories: 380,
        protein: 18,
        carbs: 32,
        fat: 22,
        ingredients: [
          '2 slices whole grain bread',
          '1 ripe avocado',
          '2 eggs',
          'Salt and pepper to taste',
          'Red pepper flakes (optional)',
        ],
        imageUrl: 'breakfast',
      ),
      const MealModel(
        id: '2',
        name: 'Grilled Chicken Salad',
        description: 'Fresh mixed greens with grilled chicken breast and light vinaigrette.',
        mealType: 'Lunch',
        calories: 420,
        protein: 35,
        carbs: 18,
        fat: 24,
        ingredients: [
          '200g grilled chicken breast',
          'Mixed salad greens',
          'Cherry tomatoes',
          'Cucumber',
          'Olive oil and lemon dressing',
        ],
        imageUrl: 'lunch',
      ),
      const MealModel(
        id: '3',
        name: 'Salmon with Quinoa',
        description: 'Baked salmon fillet served with fluffy quinoa and steamed vegetables.',
        mealType: 'Dinner',
        calories: 520,
        protein: 42,
        carbs: 38,
        fat: 22,
        ingredients: [
          '180g salmon fillet',
          '1 cup cooked quinoa',
          'Steamed broccoli',
          'Lemon and herbs',
          'Olive oil',
        ],
        imageUrl: 'dinner',
      ),
      const MealModel(
        id: '4',
        name: 'Greek Yogurt Parfait',
        description: 'Creamy Greek yogurt layered with berries and granola.',
        mealType: 'Snack',
        calories: 280,
        protein: 15,
        carbs: 35,
        fat: 10,
        ingredients: [
          '200g Greek yogurt',
          'Mixed berries',
          '1/4 cup granola',
          'Honey drizzle',
        ],
        imageUrl: 'snack',
      ),
      const MealModel(
        id: '5',
        name: 'Protein Smoothie Bowl',
        description: 'Thick smoothie bowl packed with protein and topped with fresh fruits.',
        mealType: 'Breakfast',
        calories: 350,
        protein: 28,
        carbs: 42,
        fat: 8,
        ingredients: [
          '1 scoop protein powder',
          '1 frozen banana',
          '1/2 cup frozen berries',
          'Almond milk',
          'Toppings: chia seeds, sliced banana, berries',
        ],
        imageUrl: 'smoothie',
      ),
    ];
  }
}
