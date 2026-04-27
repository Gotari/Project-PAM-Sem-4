import 'package:flutter/material.dart';

class EditProfilPage extends StatefulWidget {
  final String namaLama;

  const EditProfilPage({super.key, required this.namaLama});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  late TextEditingController namaController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.namaLama);
  }

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Baru",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, namaController.text);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}