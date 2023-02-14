import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BankHomePage extends StatefulWidget {
  const BankHomePage({Key? key}) : super(key: key);

  @override
  State<BankHomePage> createState() => _BankHomePageState();
}

class _BankHomePageState extends State<BankHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: ListTile(
                        title: Text(
                          "Your Cards",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "You have 3 Active Cards",
                          style: TextStyle(color: Colors.white70),
                        ),
                    ),
                  ),
                  creditCard(),
                  Container(
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 40,),
                    child: Row(
                      children: const [
                        Text(
                          "Recent Transactions",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      customTransaction(icon: "assets/icons/handle-bag.png", title: "Salary", subtitle: "Belong Interactive", amount: "+\$2,010"),
                      customTransaction(icon: "assets/icons/paypal.png", title: "Paypal", subtitle: "Webtech", amount: "+\$12,010"),
                      customTransaction(icon: "assets/icons/admin.png", title: "Car Repair", subtitle: "Car Engine repair", amount: "+\$232,010"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTransaction( {icon, title, subtitle, amount} ) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            color: Colors.grey.shade800,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(15),
                  child: Image.asset(
                    icon,
                    color: Colors.white,
                    scale: 15,
                    height: 55,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white54,fontSize: 11),),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(amount, style: const TextStyle(color: Colors.white, fontSize: 13),),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget creditCard () {
    return Expanded(
      flex: 4,
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.deepOrangeAccent,
          margin:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/icons/chip.png",
                            color: Colors.white,
                            scale: 13,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "assets/icons/visa_logo.png",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: const Text(
                            "4562 1122  4595  7852",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                          EdgeInsets.fromLTRB(20, 13, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "CARD HOLDER",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Uttam Nagvadiya",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                          EdgeInsets.fromLTRB(0, 13, 20, 0),
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: const [
                              Text(
                                "Expiry Date",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "01/2024",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
