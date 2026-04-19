import 'package:flutter/material.dart';

void main() {
  runApp(FitnessApp());
}

// StatelessWidget sebagai root aplikasi
class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      home: ExerciseListPage(),
    );
  }
}

class ExerciseListPage extends StatefulWidget {
  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  List<Map<String, String>> exercises = [
    {'name': 'Running', 'reps': '60 menit'},
    {'name': 'Squats', 'reps': '12 reps'},
    {'name': 'Deadlift', 'reps': '9 reps'},
    {'name': 'Bulgarian Squat', 'reps': '12 reps'},
    {'name': 'Wall Sit', 'reps': '60 detik'},
  ];

  // Fungsi untuk menambahkan latihan baru dummy
  void _addExercise() {
    setState(() {
      exercises.add({'name': 'New Exercise', 'reps': '10 reps'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leg Day'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text(exercises[index]['name']!),
            subtitle: Text(exercises[index]['reps']!),
            textColor: Colors.pinkAccent,
            tileColor: Colors.black,
            trailing: Icon(Icons.arrow_forward_ios),
            iconColor: Colors.pinkAccent,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Selected: ${exercises[index]['name']}'),
                ),
              );
            },
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 57, 65, 58),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExercise,
        child: Icon(Icons.add),
      ),
    );
  }
}