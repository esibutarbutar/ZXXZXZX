import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

void main() {
  runApp(const MyApp());
}

class TodosDetailPage extends StatelessWidget {
  final String kegiatan;
  final String keterangan;
  final String tglMulai;
  final String tglSelesai;
  const TodosDetailPage(
      {super.key,
      required this.kegiatan,
      required this.keterangan,
      required this.tglMulai,
      required this.tglSelesai});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text("1"),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    children: [
                      Text(
                        kegiatan.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        keterangan.toString(),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                      color: Colors.blue,
                      child: Text('work')),
                  Text(tglMulai),
                  Text(tglSelesai)
                ],
              )
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
