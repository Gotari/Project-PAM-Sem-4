import 'package:flutter/material.dart';
import 'package:m05/profil.dart';

class JadwalKuliah extends StatefulWidget {
  const JadwalKuliah({Key? key}) : super(key: key);

  @override
  State<JadwalKuliah> createState() => _JadwalKuliahState();
}

class _JadwalKuliahState extends State<JadwalKuliah> {
  String selectedDay = 'Sen';
  String selectedTime = 'Semua';

  final List<String> days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jun', 'Sab', 'Min'];

  final List<Map<String, dynamic>> schedules = [
    {
      'title': 'Pemrograman Mobile',
      'time': '08:00 - 10:00',
      'location': 'Room D303',
      'icon': Icons.code,
      'color': Colors.blue,
    },
    {
      'title': 'Basis Data',
      'time': '11:00 - 13:00',
      'location': 'Laboratorium #2',
      'icon': Icons.storage,
      'color': Colors.orange,
    },
    {
      'title': 'Jaringan Komputer',
      'time': '14:00 - 16:00',
      'location': 'Zoom',
      'icon': Icons.router,
      'color': Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.purpleAccent,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
        child: Column(
          children: [
            // Header dengan gradient
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                children: [
                  // Title dan avatar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const Text(
                          'Jadwal Kuliah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Profil()),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              'assets/user_avatar.jpg',
                            ),
                            backgroundColor: Colors.white30,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            // Day filter buttons
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 100),
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Column(
                  children: [
                    // DAY BUTTON
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: days.map((day) {
                          bool isSelected = selectedDay == day;

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDay = day;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.purple[400]
                                      : Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  day,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: 15),

                    SizedBox(height: 20),

                    // LIST JADWAL
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: schedules.length,
                        itemBuilder: (context, index) {
                          final schedule = schedules[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  // Icon box
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: schedule['color'].withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      schedule['icon'],
                                      color: schedule['color'],
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  // Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          schedule['title'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 14,
                                              color: Colors.grey[600],
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              schedule['time'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 14,
                                              color: Colors.grey[600],
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              schedule['location'],
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Action buttons
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [const SizedBox(height: 6)],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
