import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    routes: {
      'route1': (BuildContext context) =>Dara(),
    },
  ));
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Data Diri'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.calculate),
              tooltip: 'Aritmatika dan IF',
              onPressed: () {
                Navigator.of(context).pushNamed("route1");
              }),
        ],
      ),
      body: 
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("NAMA MAHASISWA")),
            DataColumn(label: Text("NIRM")),
            DataColumn(label: Text("KELAS")),
          
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Dara Sri Tiara")),
                DataCell(Text("2018020098")),
                DataCell(Text("6 SIA 5")),
           
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Dara extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menentukan Diskon dengan Fungsi IF dan Aritmatika'),
      ),
      body: DaraApp(),
    );
  }
}

class DaraApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DaraApp> {
  final txtnama = TextEditingController();
  final txtjumlah = TextEditingController();
  final txtharga = TextEditingController();

  String nama = '';
  String total = '';
  String bayar = '';

  onHitung() {
    setState(() {
      nama = (txtnama.text);
      var jumlah = int.parse(txtjumlah.text);
      total = " $jumlah Pcs";
      var harga = jumlah * int.parse(txtharga.text);
      if (jumlah > 2) {
        nama = (txtnama.text);
        var diskon = harga - 10000;
        bayar = "Rp. $diskon";
      } else {
        bayar = "Rp. $harga";
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          TextField(
            controller: txtnama,
            decoration: new InputDecoration(
              labelText: "Merk Tas",
            ),
          ),
          TextField(
            controller: txtjumlah,
            decoration: new InputDecoration(
              labelText: "Jumlah",
            ),
          ),
          TextField(
            controller: txtharga,
            decoration: new InputDecoration(
              labelText: "Harga per Pcs",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                  color: Color(0XFFE91E63),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: FlatButton(
                onPressed: onHitung,
                child: Text('Hitung'),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text("MERK TAS")),
                DataColumn(label: Text("JUMLAH")),
                DataColumn(label: Text("TOTAL BAYAR")),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(nama)),
                    DataCell(Text(total)),
                    DataCell(Text(bayar)),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
