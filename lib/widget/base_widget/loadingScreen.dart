// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildLoadingScreen() => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator( color: Colors.green,),
          SizedBox(height: 10.0),
          Text(
            'ກຳລັງໂຫລດ',
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
        ],
      ),
    );
