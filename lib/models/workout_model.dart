/// Workout model representing an exercise or workout routine.
/// Used in the Workout Library and Details screens.
class WorkoutModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final int durationMinutes;
  final int caloriesBurned;
  final String difficulty; // Easy, Medium, Hard
  final String imageUrl;
  final List<String> instructions;

  const WorkoutModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.durationMinutes,
    required this.caloriesBurned,
    required this.difficulty,
    required this.imageUrl,
    required this.instructions,
  });

  /// Sample workout data for the app.
  static List<WorkoutModel> getSampleWorkouts() {
    return [
      const WorkoutModel(
        id: '1',
        title: 'Morning Yoga Flow',
        description: 'Start your day with gentle stretching and mindfulness.',
        category: 'Yoga',
        durationMinutes: 20,
        caloriesBurned: 150,
        difficulty: 'Easy',
        imageUrl: 'yoga',
        instructions: [
          'Begin in Mountain Pose (Tadasana)',
          'Flow into Sun Salutation A',
          'Hold Warrior I for 30 seconds each side',
          'Transition to Warrior II',
          'End with Child\'s Pose and deep breathing',
        ],
      ),
      const WorkoutModel(
        id: '2',
        title: 'HIIT Cardio Blast',
        description: 'High-intensity interval training for maximum fat burn.',
        category: 'HIIT',
        durationMinutes: 30,
        caloriesBurned: 400,
        difficulty: 'Hard',
        imageUrl: 'hiit',
        instructions: [
          'Warm up with jumping jacks (2 min)',
          'Burpees - 45 sec on, 15 sec rest',
          'Mountain climbers - 45 sec on, 15 sec rest',
          'High knees - 45 sec on, 15 sec rest',
          'Repeat circuit 4 times',
          'Cool down with stretching',
        ],
      ),
      const WorkoutModel(
        id: '3',
        title: 'Strength Training',
        description: 'Build muscle with compound exercises.',
        category: 'Strength',
        durationMinutes: 45,
        caloriesBurned: 350,
        difficulty: 'Medium',
        imageUrl: 'strength',
        instructions: [
          'Squats - 4 sets of 12 reps',
          'Deadlifts - 4 sets of 10 reps',
          'Bench Press - 3 sets of 12 reps',
          'Bent Over Rows - 3 sets of 12 reps',
          'Shoulder Press - 3 sets of 10 reps',
        ],
      ),
      const WorkoutModel(
        id: '4',
        title: 'Core Crusher',
        description: 'Strengthen your core with targeted ab exercises.',
        category: 'Core',
        durationMinutes: 15,
        caloriesBurned: 120,
        difficulty: 'Medium',
        imageUrl: 'core',
        instructions: [
          'Plank hold - 60 seconds',
          'Russian twists - 20 reps each side',
          'Bicycle crunches - 30 reps',
          'Leg raises - 15 reps',
          'Dead bug - 10 reps each side',
        ],
      ),
      const WorkoutModel(
        id: '5',
        title: 'Relaxing Stretch',
        description: 'Wind down with a full body stretching routine.',
        category: 'Flexibility',
        durationMinutes: 25,
        caloriesBurned: 80,
        difficulty: 'Easy',
        imageUrl: 'stretch',
        instructions: [
          'Neck rolls - 1 minute',
          'Shoulder stretches - 2 minutes',
          'Standing forward fold - 1 minute',
          'Seated hamstring stretch - 2 minutes each leg',
          'Hip flexor stretch - 2 minutes each side',
          'Butterfly stretch - 2 minutes',
        ],
      ),
    ];
  }
}
