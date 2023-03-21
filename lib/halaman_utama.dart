import 'package:flutter/material.dart';

import 'data_buku.dart';
import 'halaman_detail.dart';


class HalamanUtama extends StatelessWidget {
 const HalamanUtama({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('Halaman Utama'),
      ),


      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HalamanDetail(buku: buku)
              )
              );
            },
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,             //media query itu buat menyesuaikan dengan layar
                    height: MediaQuery.of(context).size.height / 3,           //media query itu buat menyesuaikan dengan layar
                    child: Image.network(buku.imageLink),
                  ),
                  Text(buku.title),
                  Text(buku.author)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}