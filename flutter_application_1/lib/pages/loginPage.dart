import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/Routes.dart';

class LOGINPAGE extends StatefulWidget {
  @override
  _LOGINPAGEState createState() => _LOGINPAGEState();
}

bool changeButton = false;

class _LOGINPAGEState extends State<LOGINPAGE> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.extension),
                  onPressed: () {},
                ),
              ],
            ),
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Your Username", labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can not be Empty";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password", labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can not be empty";
                      } else if (value.length > 6) {
                        return "Password shoud be at lest 6 words";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),

                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoutes);
                    },
                    child: AnimatedContainer(
                      duration: Duration(
                        seconds: 1,
                      ),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),

                      //  color: Colors.white,
                      decoration: BoxDecoration(
                        shape:
                            changeButton ? BoxShape.circle : BoxShape.rectangle,
                        color: Colors.deepPurple,
                        // borderRadius:
                        //  BorderRadius.circular(changeButton ? 20 : 10),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  //   },
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
