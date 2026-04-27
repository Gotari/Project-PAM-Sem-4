import 'package:flutter/material.dart';

class RiwayatPembayaran extends StatelessWidget {
  const RiwayatPembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> riwayat = [
      {
        'judul': 'Pembayaran UKT Semester 4',
        'tanggal': '12 April 2026',
        'nominal': 'Rp 10.000.000',
        'status': 'Selesai',
      },
      {
        'judul': 'Pembayaran UKT Semester 3',
        'tanggal': '10 Oktober 2025',
        'nominal': 'Rp 10.000.000',
        'status': 'Selesai',
      },
      {
        'judul': 'Pembayaran UKT Semester 2',
        'tanggal': '08 Mei 2025',
        'nominal': 'Rp 10.000.000',
        'status': 'Selesai',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pembayaran"),
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
              Color.fromARGB(255, 212, 187, 255),
              Color.fromARGB(255, 187, 212, 255),
              Color.fromARGB(255, 229, 219, 255),
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: riwayat.length,
          itemBuilder: (context, index) {
            final item = riwayat[index];

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
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.receipt_long,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['judul'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item['tanggal'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item['nominal'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item['status'],
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
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