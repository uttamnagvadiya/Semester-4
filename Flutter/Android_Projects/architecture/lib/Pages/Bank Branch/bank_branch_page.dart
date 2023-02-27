import 'package:flutter/material.dart';

class BankBranchPage extends StatefulWidget {
  const BankBranchPage({Key? key}) : super(key: key);

  @override
  State<BankBranchPage> createState() => _BankBranchPageState();
}

class _BankBranchPageState extends State<BankBranchPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AlertDialog(
            content: const Text(
                "Due to Covid-19 there will be not be pin distribution from bank. You need to register online and pay the fees online only",
              textAlign: TextAlign.justify,
            ),

            actions: [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
