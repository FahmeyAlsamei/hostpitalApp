// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/api/api_user.dart';
import 'package:project/layout/home/home_screen.dart';
import 'package:project/modules/users/user_model.dart';

import '../../models/language.dart';
import '../../shared/component/components.dart';
import '../add_product_information/hospital_information.dart';
import '../drawer_menu/Policy.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);


  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //start form controller

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
   TextEditingController phoneNumber1 = TextEditingController();
   TextEditingController password1 = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController zone = TextEditingController();

  GlobalKey<FormState> formstateLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> formstateSignup = GlobalKey<FormState>();

  bool isScorePasswordIcon1 = true;
  bool isScorePasswordIcon2 = true;
  TapGestureRecognizer _SignUp = TapGestureRecognizer();


  bool isClocked = true;

  TapGestureRecognizer _policy=TapGestureRecognizer();

  bool isEnglish=Language.getData(key:"isDark")!=null &&Language.getData(key:"isDark")!?true:false ;

  @override
  void initState() {
    _SignUp = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          isClocked = !isClocked;
          print(isClocked);
        });
      };
        _policy=TapGestureRecognizer()
          ..onTap = () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return Policy();
              })
            );

                    };
    super.initState();
  }

  changePasswordIcon(bool isScore ) {
    setState(() {
      isScore = !isScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mdh = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: isEnglish?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            width: double.infinity,

            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(170,234,201,0.7),
                      Color.fromRGBO(138,215,228,0.6),

                    ])),
            child: SingleChildScrollView(
              child: Column(
        //alignment: AlignmentDirectional.topEnd,
        //color:  Color.fromRGBO(170,234,201,0.9),
        children: [
          

              //bulidPoistionaltop(mdw, color, isClocked),
              const Padding(padding: const EdgeInsets.only(top: 30)),

              //  bulidContainerAvatar(mdw, isClocked),
              Padding(padding: EdgeInsets.only(top: isClocked ? mdh/3.5 :mdh/5.51 ,left:isClocked ? 20:0)),
              if (isClocked)
              Form(
              key: formstateLogin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                defualtTextField(
                  hinText:  isEnglish?"Enter phoneNumber":"ادخل رقم التلفون",
                  icon: Icons.phone,
                  inputType: TextInputType.number,
                  myController:  phoneNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return isEnglish?"Phone Number can't be empty":"رقـم الـتـلـفـون الايمكن ان يـظـل فـارغاَ";
                      }
                      else if( phoneNumber.text.length<9){
                        return isEnglish?"Phone Number can't be less than 9 number":"يـجـب أن يــكون الرقـم من 9 أرقام";
                      }
                      else if( !phoneNumber.text.startsWith('7')){
                        return isEnglish?"Phone Number must start by 7 ":"يـجـب أن يـبـداء الـرقـم ب 7";
                      }
                      return null;
                    }),


                  const SizedBox(
                    height: 30,
                  ),

                  defualtTextField(
                    hinText:   isEnglish?"Enter password":"ادخل كلمة المرور",
                    isScore:isScorePasswordIcon1 ,
                    icon: Icons.lock_outline,
                    suffix: isScorePasswordIcon1?Icons.visibility: Icons.visibility_off,
                    onPressed:(){
                      setState((){
                        isScorePasswordIcon1 =! isScorePasswordIcon1;
                      });
                    },
                    myController:  password,
                    inputType: TextInputType.number,
                      validator: (value){
                        if(value!.isEmpty){
                          return isEnglish?"Password can't be empty":"كلمة المرر لايمكن ان تظل فارغ";
                        }
                        return null;
                      }

                  ),

                ],
              ),
              )

              // LogInpag(mdw, color,isScore1,changeButton)

              else
                Form(
                  key: formstateSignup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                       Text(
                        isEnglish? "Username":"اسم المستخدم",
                        style:  TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      defualtTextField(
                          hinText:  isEnglish?"Enter name":"ادخل الاسم ",
                          icon:Icons.person,
                          myController:  username,//username1,
                          validator: (value){
                            if(value!.isEmpty){
                              return isEnglish?"Name can't be empty":"الاسم لايمكن ان يظل فارغا";
                            }
                            return null;
                          }
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                       Text(
                        isEnglish?"Password":"كلمة المرور",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      defualtTextField(
                          hinText:isEnglish?"Enter password":"ادخل كلمة المرور",
                          isScore: isScorePasswordIcon2,
                          icon:Icons.lock_outline,

                          suffix:isScorePasswordIcon2? Icons.visibility:Icons.visibility_off,
                          onPressed:(){
                            setState((){
                              isScorePasswordIcon2 =! isScorePasswordIcon2;
                            });
                          },
                          myController:password1, // password1,
                          inputType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return isEnglish?"Password can't be empty":"كلمة المرر لايمكن ان تظل فارغ";
                            }
                            return null;
                          }
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                       Text(
                         isEnglish? "Phone Number":"رقم التلفون",
                        style:  TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 7,
                      ),

                      defualtTextField(

                          hinText: isEnglish?"Enter Number":"ادخل رقم التلفون",
                          inputType: TextInputType.number,
                          icon: Icons.phone_outlined,
                          myController: phoneNumber1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return isEnglish?"Phone Number can't be empty":"رقـم الـتـلـفـون الايمكن ان يـظـل فـارغاَ";
                            }
                            else if( phoneNumber1.text.length<9){
                              return isEnglish?"Phone Number can't be less than 9 number":"يـجـب أن يــكون الرقـم من 9 أرقام";
                            }
                            else if( !phoneNumber1.text.startsWith('7')){
                              return isEnglish?"Phone Number must start by 7 ":"يـجـب أن يـبـداء الـرقـم ب 7";
                            }
                            return null;
                          }),


                      const SizedBox(
                        height: 15,
                      ),
                       Text(
                         isEnglish?  "Zone":"الموقع",
                        style:  TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      defualtTextField(
                          hinText:  isEnglish?"Enter location":"ادخل موقعك ",
                          icon:   Icons.location_on_outlined,
                          myController:zone,

                                      validator: (value) {
                                      if (value!.isEmpty) {
                                      return isEnglish?"location can't be empty":"الـعـنوان لايمكن ان يـظل فـارغ";
                                      }
                                      return null;
                                      }
                                                      )

                    ],
                  ),
                ),
              SizedBox(height: isClocked?15:0,),
              isClocked
                  ? InkWell(
                      onTap: () {},
                      child: Text(
                        isEnglish?"Forget Password ?":"نسيت كلمة المرور؟",
                        style: TextStyle(
                            color: Colors.blue.withOpacity(1),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              SizedBox(
                height: isClocked ? 25 : 40,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical:12,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isClocked ?  isEnglish?"LOGIN ":"   تسجيل دخول  " :  isEnglish?"Create account ":"    إنشاء حساب  ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                         Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onPressed: () async {
                      if(!isClocked){

                        if(formstateSignup.currentState!.validate()){
                          UserApiProvider _user_Api=UserApiProvider();

                          Users _user=Users(
                            password: password1.text,
                            Full_Name: username.text,//username1.text,
                            PhoneNo: phoneNumber1.text,

                            location: zone.text,

                          );
                          _user=  await _user_Api.addUsers(_user);
                          if(_user!=null){

                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) =>MyHomePage(


                                )));
                            //     :widget.isPrssedCilnicButton?DisplayOnePharmacy(is_clinic: true,)
                            //     :widget.isPrssedPharmacyButton?DisplayOnePharmacy()
                            //     :widget.isPrssedLaboratryButton?DisplayOnePharmacy(is_laboratory: true,)
                            //     :widget.isPrssedRadiationButton?DisplayOnePharmacy(is_radiation: true,)
                            //     :widget.isPrssedBloodVolunteertButton?DisplayOnePharmacy(is_volunteer: true,)
                            //     :DisplayOneHospital()));
                            // },

                          }
                        }


                      }else {
                        if(formstateLogin.currentState!.validate()){
                          print("okey");
                          UserApiProvider _user_Api = UserApiProvider();
                          // TextEditingController username = new TextEditingController();
                          // TextEditingController password = new TextEditingController();
                          //
                          // TextEditingController username1 = new TextEditingController();
                          // TextEditingController password1 = new TextEditingController();
                          // TextEditingController phoneNumber = new TextEditingController();
                          // TextEditingController zone = new TextEditingController();

                          Users ?_user = await _user_Api
                              .logInUserByPhoneNo(
                              PhoneNo: phoneNumber.text,
                              password: password.text);


                          if (_user != null) {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(
                                    )));
                        }

                        }


                      }

                    }),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(top: isClocked ? 20 : 10),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 16),
                      children: [
                        TextSpan(
                            text: isClocked
                                ? isEnglish? " Don\'t have account ?":"ليس لديك حساب ؟"
                                : isEnglish? "Have account ? ":"لديك حساب ؟"),
                        TextSpan(
                            recognizer: _SignUp,
                            text: isClocked ?  isEnglish?" Sign Up":" انشاء حساب\n" :  isEnglish?"Login":"تسجيل دخول\n ",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline)),
                         TextSpan(
                            text: isEnglish?'\n \n By clicking Login or Register,you agree to our':"بالضغط علي تسجيل دخول او التسجيل فإنك توافق علي"
                        ),
                         TextSpan(
                            text:  isEnglish?" Terms \n":" شروط الإستخدام ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                               decoration: TextDecoration.underline),


                        ),


                         TextSpan(
                          text: isEnglish?'\t \t  and that you have read our ':"و أنك قد قرءة ",


                        ),

                        TextSpan(
                            recognizer: _policy,
                            text:   isEnglish?"Privacy Policy":"سياسة الخصوصية",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),

                      ]),
                ),
              ),
        ],
      ),
            ),
          )),
    );
  }
}


// bulidPoistionaltop(mdw, Color color, bool isClocked) {
//   return Positioned(
//     child: Transform.scale(
//       scale: isClocked ? 1.2 : 1.2,
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 1000),
//         child: Transform.translate(
//           offset: Offset(0, isClocked ? -mdw / 1.7 : -mdw / 1.66),
//           child: Container(
//             height: mdw,
//             width: mdw,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(mdw),
//               color: color,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// bulidContainerAvatar(mdw, bool isClocked) {
//   return Container(
//       padding: EdgeInsets.only(top: isClocked ? 10 : 15),
//       height: isClocked ? 100 : 90,
//       width: isClocked ? 100 : 90,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Color.fromRGBO(234, 219, 200, 1),
//           boxShadow: [
//             BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
//           ]),
//       child: Stack(
//         children: [
//           Positioned(
//             top: isClocked ? 15 : 3,
//             right: isClocked ? 25 : 15,
//             child: Icon(
//               isClocked ? Icons.person : Icons.person_add_alt_1_sharp,
//               color: Colors.white,
//               size: isClocked ? 50 : 50,
//             ),
//           ),
//           Positioned(
//               top: isClocked ? 25 : 30,
//               right: isClocked ? 15 : 15,
//               child: isClocked
//                   ? Icon(
//                       Icons.arrow_forward,
//                       color: Colors.white,
//                       size: isClocked ? 30 : 30,
//                     )
//                   : SizedBox())
//         ],
//       ));
// }
