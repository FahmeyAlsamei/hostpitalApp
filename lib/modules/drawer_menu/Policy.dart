import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';



class Policy extends StatefulWidget {

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  var _selectedValue;

  List<String> listOfValue = ['1', '2', '3', '4', '5'];

  String? country_id;
  List<String> country = [
    "America",
    "Brazil",
    "Canada",
    "India",
    "Mongalia",
    "USA",
    "China",
    "Russia",
    "Germany"
  ];

  String ?err;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policy'),
      ),
      body:Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: DropdownButtonFormField(
              value: _selectedValue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hint: Text(

                'choose one',
                style:TextStyle(
                 color:  err!=null&&err!.isNotEmpty?Colors.red:Colors.black,
                ) ,

              ),


              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },

              icon: Icon(Icons.arrow_drop_down_circle),
              iconDisabledColor: Colors.red,
              iconEnabledColor: Color.fromRGBO(119, 205, 188, 1),
              isExpanded: true,
              decoration:InputDecoration(
                 
                filled: true,
                fillColor: Colors.white,
                errorText: err,
                  focusedBorder:OutlineInputBorder(

                          borderSide: BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color: Color.fromRGBO(119, 205, 188, 0.6),),

                  ) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                 color: Colors.grey.withOpacity(0.3),
                      width: 2
                    )
                  )
              ) ,

              borderRadius: BorderRadius.circular(20),

              validator: ( value) {
                if (value ==null  ) {
                  return "can't empty";
                } else {
                  return null;
                }
              },
              items: listOfValue
                  .map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val
                  )
                );
              }).toList(),
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  DropDownField(
                    onValueChanged: (dynamic value) {
                     setState((){
                       country_id = value;
                       if(_selectedValue==null){
                         err= "can't empty";
                       }else{
                         err='';
                       }
                     });

                    },
                    value: country_id,
                    required: false,
                    hintText: 'Choose a country',
                    labelText: 'Country',
                    items: country,
                  ),
                  DropDownField(
                      value:country_id,
                      required: false,
                      strict: true,


                      labelText: 'Account Name *',
                      icon: Icon(Icons.account_balance),
                      items:country,
                      setter: (dynamic newValue) {
                        country_id = newValue;
                      }
                  ),
                ]),
          ),
        ],
      )
    );
  }
}