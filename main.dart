import 'package:app4/todos_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const Center(child: MyHomePage(title: 'Todos')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController kegiatan = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  bool? isKegiatanEmpty;
  bool? isKeteranganEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Todos')),
      ),
      body: Center(
        child: SizedBox(
          width: 440,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  children: [
                    const Icon(Icons.list_alt),
                    const Padding(padding: EdgeInsets.only(right: 7)),
                    const Text(
                      'Kegiatan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 80)),
                    SizedBox(
                      width: 230,
                      child: TextFormField(
                        controller: kegiatan,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Judul Kegiatan',
                            errorText: isKegiatanEmpty == true
                                ? 'Judul Kegiatan Harus Diisi'
                                : null),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: const [
                    Icon(Icons.sort),
                    Padding(padding: EdgeInsets.only(right: 7)),
                    Text(
                      'Keterangan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 50.0, top: 10),
                width: 415,
                child: TextFormField(
                  controller: keterangan,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 40, bottom: 40, left: 15, right: 40),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Tambah Keterangan',
                      errorText: isKeteranganEmpty == true
                          ? 'Keterangan Harus Diisi'
                          : null),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: const [
                    Icon(Icons.calendar_month),
                    Padding(padding: EdgeInsets.only(right: 7)),
                    Text(
                      'Tanggal Mulai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(left: 85)),
                    Icon(Icons.calendar_month_outlined),
                    Padding(padding: EdgeInsets.only(right: 7)),
                    Text(
                      'Tanggal Selesai',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 50, top: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: '20-03-2022',
                            labelStyle: TextStyle(fontSize: 14)),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 90)),
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: '20-03-2022',
                            labelStyle: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  children: [
                    const Icon(Icons.category),
                    const Padding(padding: EdgeInsets.only(right: 7)),
                    const Text(
                      'Kategori',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 150)),
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        controller: kegiatan,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Routine',
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            errorText: isKegiatanEmpty == true
                                ? 'Routine harus Diisi'
                                : null),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Row(
                  children: [
                    SizedBox(
                        width: 190,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18)),
                          onPressed: () {},
                          child: const Text('Batal',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )),
                    const Padding(padding: EdgeInsets.all(5)),
                    SizedBox(
                        width: 190,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18)),
                          onPressed: () {
                            if (kegiatan.text.isEmpty) {
                              setState(() {
                                isKegiatanEmpty = true;
                              });
                            }

                            if (keterangan.text.isEmpty) {
                              setState(() {
                                isKeteranganEmpty = true;
                              });
                            } else {
                              setState(() {
                                isKegiatanEmpty = false;
                                isKeteranganEmpty = false;
                              });

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TodosDetailPage(
                                  kegiatan: kegiatan.text,
                                  keterangan: keterangan.text,
                                  tglMulai: DateTime.now().toString(),
                                  tglSelesai: DateTime.now().toString(),
                                );
                              }));
                            }
                          },
                          child: const Text(
                            'Simpan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
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
