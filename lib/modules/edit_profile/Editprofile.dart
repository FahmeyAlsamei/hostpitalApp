import 'package:flutter/material.dart';
import 'package:project/config/data.dart';
import 'package:project/modules/login/login.dart';

import '../../shared/component/components.dart';

class EditProfile extends StatelessWidget {
  void selectionPage(BuildContext ctx, int n) {
    Navigator.of(ctx).pop('/');
  }

  @override
  Widget build(BuildContext context) {
    return

      AppData.UserAccountData!=null?
      Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(158, 215, 228, 0.7),
        title: Text(" Edit Profile"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          decoration: defualtBoxDecoration(),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.3),
                                )
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/fahmey.jpg'))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 5, color: Colors.white),
                                color:  Color.fromRGBO(138, 215, 228, 1),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildTextField('Full Name',  AppData.UserAccountData!.Full_Name??'', false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField('Phone',AppData.UserAccountData!.PhoneNo??'', false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField('Password', AppData.UserAccountData!.password??'', true),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField('Location',AppData.UserAccountData!.location??'', false),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                              fontSize: 16, letterSpacing: 2, color: Colors.black),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                      },
                        child:const Text('SAVE',style: TextStyle(fontSize: 16,letterSpacing: 2,color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(138, 215, 228, 0.7),   //(30, 156, 160, 1),
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        ),
                      ),
                    ],
                  )

                ],
              ))),
    ):

      LogIn();
    ;
  }
}

Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: isPasswordTextField ? isPasswordTextField : false,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ))
            : null,
        contentPadding: EdgeInsets.only(bottom: 5,left: 10,top: 2),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,

        hintStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.6),

            )),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: Color.fromRGBO(158, 215, 228, 1))),
      ),
    ),
  );
}
