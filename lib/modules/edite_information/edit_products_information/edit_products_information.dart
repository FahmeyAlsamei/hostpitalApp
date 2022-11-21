import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/modules/work_time/work_time.dart';

import '../../../shared/component/components.dart';


class EditProductInfo extends StatefulWidget {
  bool is_clinic;
  bool is_pharmacy;
  EditProductInfo({this.is_clinic=false,this.is_pharmacy=false});
  static const routeName ='/EditProductInfo';

  @override
  State<EditProductInfo> createState() => _EditProductInfoState();
}

class _EditProductInfoState extends State<EditProductInfo> {

  TextEditingController  product_Name = new TextEditingController();
  TextEditingController product_Phone1  = new TextEditingController();
  TextEditingController product_Phone2  = new TextEditingController();
  TextEditingController product_Address  = new TextEditingController();
  TextEditingController product_Addtional_Information  = new TextEditingController();


  TapGestureRecognizer _isWorkTime=new TapGestureRecognizer();

  @override
  initState(){
    _isWorkTime=new TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushNamed(WorkTime.routeName);
      };
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color.fromRGBO(244,245, 250, 1),

        body: Container(
            decoration: defualtBoxDecoration(),

            child:GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  color: Color.fromRGBO(119, 205, 188, 1),
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
                  SizedBox(height: 20,),


                  SizedBox(height: 7,),
                  defualtTextField(
                    hinText: widget.is_clinic?"clinic Name form database":widget.is_pharmacy?"Pharmacy Name from database":"Hspital Name from data base",
                    icon: Icons.apartment_outlined,
                    myController:product_Name,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defualtTextField(
                      hinText:"Phone Number 1",
                      icon: Icons.phone,
                      myController:product_Phone1,
                      inputType: TextInputType.number
                  ),
                  SizedBox(
                    height: 15,
                  ),





                  defualtTextField(
                      hinText:"Phone Number 2",
                      icon: Icons.phone_rounded,
                      myController:product_Phone2,
                      inputType: TextInputType.number
                  ),

                  SizedBox(height: 15,),
                  defualtTextField(
                    hinText:"Addresses",
                    icon: Icons.location_on_rounded,
                    myController:product_Address,

                  ),

                  SizedBox(height: 25,),
                  Card(
                    elevation:5,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.8)
                          )

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text('Work Time',style: TextStyle(fontSize:15 ,fontWeight:FontWeight.w500),),
                              RichText(
                                  text: TextSpan(
                                      text: 'Modify',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline),

                                      recognizer:_isWorkTime
                                  )

                              )

                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Strurday',style: TextStyle(color: Colors.grey))
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Sunday',style: TextStyle(color: Colors.grey),)
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Monday',style: TextStyle(color: Colors.grey))
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Tuesday',style: TextStyle(color: Colors.grey))
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Wendesday',style: TextStyle(color: Colors.grey))
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Thursday',style: TextStyle(color: Colors.grey))
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                    child:Text('Friday',style: TextStyle(color: Colors.grey))
                                ),
                                Expanded(
                                    child:Column(
                                      children: [
                                        Text("05:00 - 04:30"),
                                        //Text("05:00 - 04:30"),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  defualtTextField(
                      hinText:"More Information About Hospital ",
                      icon: Icons.add,
                      myController:product_Addtional_Information,
                      numberOfline: 6

                  ),

                  SizedBox(height: 30,),
                  defualtElevatedButton(title: 'SAVE',
                    function: (){
                      // Navigator.of(context).pushReplacementNamed( AddProducts.routeName);
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(height: 20,),

                ],
              ),
            )


        ));
  }
}


