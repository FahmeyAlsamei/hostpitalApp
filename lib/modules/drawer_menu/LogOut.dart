import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/models/language.dart';
import 'package:project/modules/display_jobs/display_job.dart';

import '../../layout/home/home_screen.dart';
import '../../shared/component/components.dart';



class LogOut extends StatefulWidget {


  @override
  State<LogOut>  createState() => LogOutState();
}

class LogOutState extends State<LogOut> {

   File ?imgFile;
  final imgPicker = ImagePicker();
  int count=0;
  Language _language=Language();
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context){

          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),

                side: BorderSide(

                )

            ),
            backgroundColor:    Color.fromRGBO(234, 235, 243,1),
            child: Container(

              height: MediaQuery.of(context).size.height/4,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  Container(
                      width: double.infinity,
                      child:
                        ElevatedButton.icon(
                        onPressed: (){
                          openCamera();
                          } ,

                        label: Text('Image From Camera',style: TextStyle(fontSize:14,fontWeight:FontWeight.w600,letterSpacing: 2,color: Colors.black )),
                        icon: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                            primary:Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal:10, vertical:20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),

                      )
                  ),


                  SizedBox(height: 20,),
                  Container(
                      width: double.infinity,
                      child:
                      ElevatedButton.icon(
                        onPressed: (){
                          openGallery();
                        } ,

                        label: Text( 'Image From Gallery',style: TextStyle(fontSize:14,fontWeight:FontWeight.w600,letterSpacing: 2,color: Colors.black )),
                        icon: Icon(Icons.image,color: Colors.black,),
                        style: ElevatedButton.styleFrom(
                            primary:Color.fromRGBO(119, 205, 188, 1),
                            padding: EdgeInsets.symmetric(
                                horizontal:10, vertical:20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),

                      )
                  ),


                ],
              ),
            ),
          );

        });
        }

            //AlertDialog(
        //     title: Text("Options"),
        //     content: SingleChildScrollView(
        //       child: ListBody(
        //         children: [
        //           GestureDetector(
        //             child: Text("Capture Image From Camera"),
        //             onTap: () {
        //               openCamera();
        //             },
        //           ),
        //           Padding(padding: EdgeInsets.all(10)),
        //           GestureDetector(
        //             child: Text("Take Image From Gallery"),
        //             onTap: () {
        //               openGallery();
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   );
        // });


  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      if(imgCamera!=null)
      imgFile = File(imgCamera.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      if(imgGallery!=null)
        imgFile = File(imgGallery.path);
    });
    Navigator.of(context).pop();
  }

  Widget displayImage(){
    if(imgFile != null){
      return Image.file(imgFile!, width: 350, height: 350,fit: BoxFit.cover,);
    } else{
      return Image(image:
      AssetImage('images/fahmey.jpg')
      );


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            displayImage()
      ,
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState((){
                  count++;
                });
                if(count==3){
                  _language.putData(key: "isLater", value: false);
                  count=0;
                 }


              },
              child: Text("Select Image"),
            )
          ],
        ),
      ),
    );
  }

}