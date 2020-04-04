import 'package:flutter/material.dart';
import 'dart:math';


class BMIResult extends StatelessWidget {
  BMIResult(
      {@required this.tinggi_badan,
        @required this.berat_badan,
        this.nama,
        this.kelamin,
        this.tanggal,
        this.bulan,
        this.tahun});
  final int tinggi_badan;
  final int berat_badan;
  final String nama;
  final String kelamin;
  final String tanggal;
  final String bulan;
  final String tahun;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    String cBMI;
    DateTime tahunnow = DateTime.now();
    int umur = tahunnow.year - int.parse(tahun);
    if (tahunnow.month > int.parse(bulan)) {
      --umur;
    } else if (tahunnow.month == int.parse(bulan)) {
      if (tahunnow.day > int.parse(tanggal)) {
        --umur;
      }
    }
    String usia = "$umur";
    if (bmi >= 28)
      cBMI = "Obese";
    else if (bmi >= 23)
      cBMI = "Overweight";
    else if (bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";

    String saran;
    if (bmi >= 28)
      saran = "Anda harus segera menurunkan berat badan pergilah ke gym dan kurangikonsumsi karbohidrat";
    if (bmi >=23)
      saran = "SEMPURNA! Anda mencapai berat badan ideal anda Pertahankan";
    if (bmi >= 17.5)
      saran = "BAIK namun anda harus berolahraga dan akan lebih baik apabila mencapai berat badan ideal anda";
    else
      saran = "Perbanyak Olahraga atau datang ke gym dan Perbanyak asupan makanan yang mengandung karbohidrat dan protein";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              nama,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w800,
                color: Colors.white54,
              ),
            ),
            Text(
              "umur: " + usia,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white54,
              ),
            ),
            Text(
              kelamin,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white54,
              ),
            ),
            Text(
              cBMI,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              '17,5 -  22.9 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              saran,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            )
          ],
        ),


      ),

    );

  }
}