import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body:Column(
        children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child : TextFormField(
        controller: controller.tanggalpinjamController,
        decoration: InputDecoration(hintText: "Masukkan Tanggal Pinjam",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value){
          if (value!.isEmpty){ // untuk minim username
            return "Tanggal Pinjam tidak boleh kosong";
          }
          return null;
        },
      ),
    ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child : TextFormField(
          controller: controller.tanggalkembaliController,
          decoration: InputDecoration(hintText: "Masukkan Tanggal Kembali",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: (value){
            if (value!.isEmpty){ // untuk minimamal password
              return "Tanggal Kembali tidak boleh kosong";
            }
            return null;
          }
      ),
    ),
          Obx(() => controller.loading.value?
          CircularProgressIndicator():
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child:  ElevatedButton(onPressed: (){
              controller.post();
            }, child: Text("Pinjam")),
          ),
          ),
    ],
     )
    );
  }
}
