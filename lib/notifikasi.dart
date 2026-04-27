import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notif = [
      {
        "judul": "Mobile Development",
        "sub": "Deadline hari ini 23:59",
        "waktu": "2 jam lalu",
      },
      {
        "judul": "Basis Data",
        "sub": "Deadline hari ini 20:00",
        "waktu": "1 hari lalu",
      },
      {
        "judul": "Sistem Operasi",
        "sub": "Deadline hari ini 17:00",
        "waktu": "2 hari lalu",
      },
      {
        "judul": "Probabilitas",
        "sub": "Deadline hari ini 23:59",
        "waktu": "3 hari lalu",
      },
      {
        "judul": "Pengembangan Aplikasi Mobile",
        "sub": "Deadline hari ini 19.00",
        "waktu": "5 hari lalu",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 212, 187, 255),
              Color.fromARGB(255, 187, 212, 255),
              Color.fromARGB(255, 229, 219, 255),
            ],
          ),
        ),

        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: notif.length,
          itemBuilder: (context, index) {
            final item = notif[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["judul"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          item["sub"],
                          style: TextStyle(color: Colors.grey[700]),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          item["waktu"],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
