import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255,212,187,255),
              Color.fromARGB(255,187,212,255),
              Color.fromARGB(255,229,219,255),
            ],
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.school,
                      size: 70,
                      color: Colors.white,
                    ),

                    SizedBox(height:15),

                    Text(
                      "Aplikasi Akademik Mahasiswa",
                      style: TextStyle(
                        fontSize:22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height:12),

                    Text(
                      "Aplikasi ini dirancang untuk membantu mahasiswa mengakses informasi akademik seperti jadwal kuliah, nilai, pengumuman, deadline tugas, serta riwayat pembayaran dalam satu sistem terintegrasi.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height:25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [

                    Text(
                      "Tentang Kelompok Nyengir",
                      style: TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    SizedBox(height:15),

                    Text(
                      "Kelompok Nyengir merupakan tim pengembang aplikasi ini yang berfokus pada pembuatan solusi digital sederhana namun bermanfaat untuk kebutuhan akademik mahasiswa.",
                      style: TextStyle(height:1.6),
                    ),

                    SizedBox(height:20),

                    Text(
                      "Anggota Kelompok:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:16,
                      ),
                    ),

                    SizedBox(height:10),

                    Text("• Bryan Lauda"),
                    Text("• Rich Hugo Hutagalung"),
                    Text("• Sherly"),
                    Text("• Nicholas Angelo Limus"),

                  ],
                ),
              ),

              const SizedBox(height:25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: const [

                    Text(
                      "Versi Aplikasi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:18,
                      ),
                    ),

                    SizedBox(height:10),

                    Text("Version 1.0.0"),
                    SizedBox(height:8),
                    Text("Project PAM Semester 4"),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}