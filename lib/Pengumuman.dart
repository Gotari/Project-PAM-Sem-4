import 'package:flutter/material.dart';
import 'package:m05/profil.dart';

class Pengumuman extends StatefulWidget {
  const Pengumuman({super.key});

  @override
  State<Pengumuman> createState() => _PengumumanState();
}

class _PengumumanState extends State<Pengumuman> {
  String selectedCategory = 'Semua';
  final TextEditingController searchController = TextEditingController();

  final List<String> categories = [
    'Semua',
    'Akademik',
    'Kegiatan',
    'Beasiswa',
    'Lainnya',
  ];

  final List<Map<String, dynamic>> announcements = [
    {
      'isNew': true,
      'icon': Icons.school,
      'title': 'Pengajuan KRS Semester Ganjil 2024/2025',
      'description':
          'Periode pengajuan KRS semester ganjil 2024/2025 telah dibuka. Pastikan kamu mengisi KRS sebelum batas waktu berakhir.',
      'category': 'Akademik',
      'categoryColor': Colors.blue,
      'date': '21 Mei 2024',
      'daysAgo': '3 days ago',
    },
    {
      'isNew': false,
      'icon': Icons.receipt,
      'title': 'Batas Akhir Pembayaran UKT',
      'description':
          'Pengingat bahwa batas akhir pembayaran UKT adalah pada 31 Mei 2024. Pastikan sudah melakukan pembayaran UKT sesuai.',
      'category': 'Akademik',
      'categoryColor': Colors.orange,
      'date': '20 Mei 2024',
      'daysAgo': '20 Mar 2024',
    },
    {
      'isNew': false,
      'icon': Icons.emoji_events,
      'title': 'Lomba Inovasi Mahasiswa 2024',
      'description':
          'Yuk ikuti Lomba Inovasi Mahasiswa 2024 dengan tema "Inovasi untuk Masa Depan Berkelanjutan".',
      'category': 'Kegiatan',
      'categoryColor': Colors.orange,
      'date': '18 Mai 2024',
      'daysAgo': '18 Mai 2024',
    },
    {
      'isNew': false,
      'icon': Icons.settings,
      'title': 'Maintenance Sistem Akademik',
      'description':
          'Sistem Akademik akan dilakukan maintenance pada 25 Mei 2024 pukul 00:00 - 06:00 WIB. Mohon maaf atas ketidaknyamanannya.',
      'category': 'Lainnya',
      'categoryColor': Colors.purple,
      'date': '17 Mei 2024',
      'daysAgo': '17 Mei 2024',
    },
    {
      'isNew': false,
      'icon': Icons.card_giftcard,
      'title': 'Beasiswa Prestasi 2024',
      'description':
          'Pendaftaran Beasiswa Prestasi 2024 telah dibuka. Daftar sekarang sebelum batas waktu pendaftaran ditutup pada 30 Juni 2024.',
      'category': 'Beasiswa',
      'categoryColor': Colors.green,
      'date': '15 Mei 2024',
      'daysAgo': '15 Mei 2024',
    },
  ];

  List<Map<String, dynamic>> getFilteredAnnouncements() {
    if (selectedCategory == 'Semua') {
      return announcements;
    }
    return announcements
        .where((item) => item['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAnnouncements = getFilteredAnnouncements();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[300]!, Colors.purple[100]!],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  ),
                ),
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    // Title row
                    Row(
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
                          'Pengumuman',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profil(),
                                  ),
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
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Search and Filter row
                    const SizedBox(height: 20),
                    // Category Filter
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      padding: const EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CATEGORY FILTER
                          SizedBox(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: categories.map((category) {
                                bool isSelected = selectedCategory == category;

                                return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = category;
                                      });
                                    },

                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.deepPurple
                                            : Colors.grey.shade100,

                                        borderRadius: BorderRadius.circular(20),
                                      ),

                                      child: Text(
                                        category,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          SizedBox(height: 15),

                          ...filteredAnnouncements.map((announcement) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(18),
                                ),

                                child: Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: announcement['categoryColor']
                                            .withOpacity(.2),

                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                      child: Icon(
                                        announcement['icon'],
                                        color: announcement['categoryColor'],
                                      ),
                                    ),

                                    SizedBox(width: 12),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            announcement['title'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 5),

                                          Text(
                                            announcement['description'],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
