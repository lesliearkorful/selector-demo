import 'package:flutter/material.dart';

class Selector extends StatelessWidget {
  final String selectedBank;
  const Selector({this.selectedBank});

  final bankList = const <String>[
    "Access Bank",
    "Access Mobile",
    "Access Y'ello & Beta",
    "AccessMobile",
    "Alat by Wema",
    "Aso Savings and Loans",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Bank"),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 20),
        itemCount: bankList.length,
        separatorBuilder: (_, __) => SizedBox(height: 25),
        itemBuilder: (context, index) {
          final bank = bankList[index];
          bool active = bank == selectedBank;
          return ListTile(
            title: Text(
              bank,
              style: TextStyle(
                fontSize: 13,
                fontWeight: active ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            trailing: active ? Icon(Icons.done, color: Colors.green) : null,
            leading: Container(
              width: 90,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade200,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            onTap: () {
              Navigator.pop(context, bank);
            },
          );
        },
      ),
    );
  }
}
