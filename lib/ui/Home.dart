import 'package:flutter/material.dart';
import 'package:selector_demo/ui/Selector.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bank")),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Your bank"),
            SizedBox(height: 10),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                title: Text(
                  selectedBank ?? "Select a bank",
                  style: TextStyle(fontSize: 14),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Selector(
                        selectedBank: selectedBank,
                      ),
                    ),
                  );
                  if (result != null) setState(() => selectedBank = result);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
