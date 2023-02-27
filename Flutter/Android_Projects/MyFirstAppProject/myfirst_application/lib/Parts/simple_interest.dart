import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  @override
  State<SimpleInterest> createState() => _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  late TextEditingController amountController;
  late TextEditingController interestController;
  late TextEditingController timeController;

  double principalAmount = 0.0;
  double totalInterest = 0.0;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    interestController = TextEditingController();
    timeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            getCustomRow("Principal Amount (P)", null, false, amountController),
            getCustomRow(
                "Rate of Interest (R)", null, false, interestController),
            getCustomRow("Time Period (T)", null, false, timeController),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        print("Interest Calculated");
                        FocusManager.instance.primaryFocus?.unfocus();

                        var amount = double.parse(amountController.text);
                        var interest = double.parse(interestController.text);
                        var time = double.parse(timeController.text);

                        principalAmount = amount;
                        totalInterest = ((amount * interest * time) / 100);
                        totalAmount = principalAmount + totalInterest;

                        print("$principalAmount ,$totalInterest, $totalAmount");
                        setState(() {});
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                            fontSize: 17, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
              ],
            ),
            getCustomRow(
                "Principal Amount", principalAmount.toString(), true, null),
            getCustomRow(
                "Total Interest", totalInterest.toString(), true, null),
            getCustomRow("Total Amount", totalAmount.toString(), true, null),
          ],
        ),
      ),
    ));
  }

  // void calculateSimpleInterest () {
  //
  // }

  Widget getCustomRow(title, value, bool isAnswerWidget, controller) {
    return Row(
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                    child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )))),
        Expanded(
            flex: 0,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(
                    child: Text(
                  ":",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )))),
        isAnswerWidget
            ? Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        "₹ $value",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )))
            : Expanded(
                child: Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(fontSize: 17),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              )),
      ],
    );
  }
}
