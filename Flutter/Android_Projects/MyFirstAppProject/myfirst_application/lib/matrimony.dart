import 'package:flutter/material.dart';
import 'package:myfirst_application/login_page.dart';

class Matrimony extends StatefulWidget {
  @override
  State<Matrimony> createState() => _MatrimonyState();
}

class _MatrimonyState extends State<Matrimony> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Center(
                  child: Text("Bharat Matrimony",
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                      ),
                  )
              )
            ),
            
            body: Column(
              children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image(image: AssetImage("images/matrimony_images/login_page_bg_img.jpg"))
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.black,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                              ),
                            );
                          },
                          child: const Center(
                            child: Text('Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ),

                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.green,
                          child: TextButton(
                            child: const Text('Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: (){},
                          ),
                        )
                    ),
                  ],
                )
              ],
            )
          )
      );
  }
}