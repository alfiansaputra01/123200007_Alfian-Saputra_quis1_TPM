import 'package:flutter/material.dart';
import 'data_buku.dart';

class HalamanDetail extends StatelessWidget {
  final  DataBuku buku;
  const HalamanDetail({Key? key, required this.buku}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(buku.title),
      ),

      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.network(buku.imageLink),
              ],
            ),
          ),
          Text( "Judul Buku :" + buku.title),
          Text( "Penulis Buku :" + buku.author),
          Text( "Bahasa Buku :" + buku.language),
          Text( "Negara Buku :" + buku.country),
          Text( "Jumlah Halaman :" + buku.pages.toString()),
          Text( "Apakah tersedia :" + buku.isAvailable.toString()),


          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: (buku.isAvailable) ? Colors.green : Colors.red,
            ),
            onPressed: () {
              String text = "";

              if(buku.isAvailable == true){
                setState(() {
                  text = "Berhasil di pinjam";
                  buku.isAvailable = true;
                });
              } else {
                setState(() {
                  text = "Buku habis";
                  buku.isAvailable = false;
                });
              }

              SnackBar snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('PINJAM BUKU'),
          )
        ],
      ),
    );
  }
}

void setState(Null Function() param0) {
}