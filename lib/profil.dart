import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.edit, 'title': 'Edit Profil'},
    {'icon': Icons.lock, 'title': 'Ganti Password'},
    {'icon': Icons.school, 'title': 'Riwayat Akademik'},
    {'icon': Icons.receipt, 'title': 'Riwayat Pembayaran'},
    {'icon': Icons.notifications, 'title': 'Notifikasi'},
    {'icon': Icons.settings, 'title': 'Pengaturan'},
    {'icon': Icons.info, 'title': 'About'},
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
              Color.fromARGB(255,212,187,255),
              Color.fromARGB(255,187,212,255),
              Color.fromARGB(255,229,219,255),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height:20),

              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal:15),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                           BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height:35),

              // CONTAINER BESAR UNGU
              Transform.translate(
                offset: Offset(0,-20),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:20,
                  ),

                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Colors.black26,
                          offset: Offset(0,6),
                        )
                      ],
                    ),

                    child: Column(
                      children: [

                        // Card user
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                               BorderRadius.circular(20),
                          ),

                          child: Column(
                            children: [

                              CircleAvatar(
                                radius:50,
                                backgroundImage:
                                   AssetImage(
                                  'assets/user_avatar.jpg',
                                ),
                              ),

                              SizedBox(height:15),

                              Container(
                                padding:
                                  EdgeInsets.symmetric(
                                    horizontal:12,
                                    vertical:6,
                                  ),
                                decoration:
                                  BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                      BorderRadius.circular(20),
                                  ),
                                child: Text(
                                  "CARD INFO USER",
                                ),
                              ),

                              SizedBox(height:15),

                              Text(
                                "Bryan Lauda",
                                style: TextStyle(
                                  fontSize:22,
                                  fontWeight:
                                    FontWeight.bold,
                                ),
                              ),

                              SizedBox(height:5),

                              Text("24113088"),

                              SizedBox(height:5),

                              Text(
                                "Jurusan Teknik Informasi",
                              ),

                              SizedBox(height: 5,)
                            ],
                          ),
                        ),

                        SizedBox(height:20),

                        // Menu
                        ...menuItems.map((item){
                          return Padding(
                            padding:
                              EdgeInsets.only(bottom:12),
                            child: Container(
                              padding:
                                EdgeInsets.all(15),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                  BorderRadius.circular(15),
                              ),

                              child: Row(
                                children: [

                                  Container(
                                    width:40,
                                    height:40,
                                    decoration:
                                      BoxDecoration(
                                        color: Colors.purple[100],
                                        borderRadius:
                                          BorderRadius.circular(10),
                                      ),
                                    child: Icon(
                                      item['icon'],
                                      color: Colors.deepPurple,
                                    ),
                                  ),

                                  SizedBox(width:15),

                                  Expanded(
                                    child: Text(
                                      item['title'],
                                      style: TextStyle(
                                        fontWeight:
                                          FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size:16,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),

                        SizedBox(height:20),

                        // Logout
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},

                            style:
                              ElevatedButton.styleFrom(
                                backgroundColor:
                                   Colors.white,
                                padding:
                                  EdgeInsets.symmetric(
                                    vertical:15,
                                  ),
                                shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                      BorderRadius.circular(15),
                                  ),
                              ),

                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight:
                                   FontWeight.bold,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height:30),

            ],
          ),
        ),
      ),
    );
  }
}