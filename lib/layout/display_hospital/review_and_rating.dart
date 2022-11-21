import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/users/all_info_rating_comercial_model.dart';
import 'gf_progress_bar.dart';
 double dp(double val, int places) {
num mod = pow(10.0, places);
return ((val * mod).round().toDouble() / mod);
}
class ReviewRatingDetialComercialCard extends StatelessWidget {
  RatingdataHospital dataRating;
   double  starSize=14;


  ReviewRatingDetialComercialCard({required this.dataRating,}
      );


  @override
  Widget build(BuildContext context) {
    double widthSlidpar =  MediaQuery.of(context).size.width/1.5;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Rate(context),
             SizedBox(width: 0,),
             Expanded(
               flex: 3,
                 child:  Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.max,
               children: [
                 Container(

                   child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       children: [
                       Expanded(

                         child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         //mainAxisAlignment: MainAxisAlignment.start,
                         children:  [
                           Icon(
                             Icons.star,
                             color: Colors.amber,
                             size:starSize ,
                           ),
                           Icon(
                             Icons.star,
                             color: Colors.amber,
                             size:starSize ,
                           ),
                           Icon(
                             Icons.star,
                             color: Colors.amber,
                             size:starSize ,
                           ),
                           Icon(
                             Icons.star,
                             color: Colors.amber,
                             size:starSize ,
                           ),
                           Icon(
                             Icons.star,
                             color: Colors.amber,
                             size:starSize ,
                           ),
                         ],
                       ),
                         flex: 1,
                       ),
                         Expanded(
                          flex: 2,
                           child: Container(
                               height: 18,
                               width: widthSlidpar,
                               margin: const EdgeInsets.only(right: 1,top: 2),
                               decoration: const BoxDecoration(
                                 boxShadow: [],
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(10.0)),
                                 //   color: Colors.grey
                               ),
                               alignment: Alignment.topRight,
                               child: GFProgressBar(
                                   percentage:
                                   dataRating.percentageRateFive! / 100,
                                   backgroundColor:Color.fromRGBO(234, 235, 243, 1) ,

                                   // width: widthFive,
                                   lineHeight: 14,
                                   child: Container(),

                                   // width: widthSlidpar-10,
                                   animation: true,
                                   animateFromLastPercentage: true,
                                   fromRightToLeft: true,
                                   progressBarColor: Colors.amber)
                             // Container(
                             //   decoration: BoxDecoration(
                             //       boxShadow: [],
                             //       borderRadius:
                             //           BorderRadius.all(Radius.circular(10.0)),
                             //       color: Colors.amber,),
                             //   height: 12,
                             //   width: widthFive,
                             //   //color: Colors.amber,
                             // ),
                           ),
                         ),
                       ]),
                 ),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Expanded(

                         child:
                         SizedBox(
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             //mainAxisAlignment: MainAxisAlignment.start,
                             children: [

                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                             ],
                           ),
                         ),
                         flex: 1,
                       ),
                       Expanded(
                         flex: 2,
                         child: Container(
                             height: 18,
                             width: widthSlidpar,
                             margin: const EdgeInsets.only(right: 1,top: 2),
                             decoration: const BoxDecoration(
                               boxShadow: [],
                               borderRadius:
                               BorderRadius.all(Radius.circular(10.0)),
                               //   color: Colors.grey
                             ),
                             alignment: Alignment.topRight,
                             child: GFProgressBar(
                                 percentage:
                                 dataRating.percentageRateFour! / 100,
                                 backgroundColor:Color.fromRGBO(234, 235, 243, 1) ,

                                 // width: widthFive,
                                 lineHeight: 12,
                                 child: Container(),

                                 // width: widthSlidpar-10,
                                 animation: true,
                                 animateFromLastPercentage: true,
                                 fromRightToLeft: true,
                                 progressBarColor: Colors.amber)
                           // Container(
                           //   decoration: BoxDecoration(
                           //       boxShadow: [],
                           //       borderRadius:
                           //           BorderRadius.all(Radius.circular(10.0)),
                           //       color: Colors.amber,),
                           //   height: 12,
                           //   width: widthFive,
                           //   //color: Colors.amber,
                           // ),
                         ),
                       ),
                     ]),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Expanded(

                         child:
                         SizedBox(
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             //mainAxisAlignment: MainAxisAlignment.start,
                             children:  [
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),

                             ],
                           ),
                         ),
                         flex: 1,
                       ),
                       Expanded(
                         flex: 2,
                         child: Container(
                             height: 18,
                             width: widthSlidpar,
                             margin: const EdgeInsets.only(right: 1,top: 2),
                             decoration: const BoxDecoration(
                               boxShadow: [],
                               borderRadius:
                               BorderRadius.all(Radius.circular(10.0)),
                               //   color: Colors.grey
                             ),
                             alignment: Alignment.topRight,
                             child: GFProgressBar(
                                 percentage:
                                 dataRating.percentageRateThree! / 100,
                                 backgroundColor:Color.fromRGBO(234, 235, 243, 1) ,

                                 // width: widthFive,
                                 lineHeight: 12,
                                 child: Container(),

                                 // width: widthSlidpar-10,
                                 animation: true,
                                 animateFromLastPercentage: true,
                                 fromRightToLeft: true,
                                 progressBarColor: Colors.amber)
                           // Container(
                           //   decoration: BoxDecoration(
                           //       boxShadow: [],
                           //       borderRadius:
                           //           BorderRadius.all(Radius.circular(10.0)),
                           //       color: Colors.amber,),
                           //   height: 12,
                           //   width: widthFive,
                           //   //color: Colors.amber,
                           // ),
                         ),
                       ),
                     ]),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Expanded(

                         child:
                         SizedBox(
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             //mainAxisAlignment: MainAxisAlignment.start,
                             children:  [

                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),

                             ],
                           ),
                         ),
                         flex: 1,
                       ),
                       Expanded(
                         flex: 2,
                         child: Container(
                             height: 18,
                             width: widthSlidpar,
                             margin: const EdgeInsets.only(right: 1,top: 2),
                             decoration: const BoxDecoration(
                               boxShadow: [],
                               borderRadius:
                               BorderRadius.all(Radius.circular(10.0)),
                               //   color: Colors.grey
                             ),
                             alignment: Alignment.topRight,
                             child: GFProgressBar(
                                 percentage:
                                 dataRating.percentageRateTow! / 100,
                                 backgroundColor:Color.fromRGBO(234, 235, 243, 1) ,

                                 // width: widthFive,
                                 lineHeight: 12,
                                 child: Container(),

                                 // width: widthSlidpar-10,
                                 animation: true,
                                 animateFromLastPercentage: true,
                                 fromRightToLeft: true,
                                 progressBarColor: Colors.amber)
                           // Container(
                           //   decoration: BoxDecoration(
                           //       boxShadow: [],
                           //       borderRadius:
                           //           BorderRadius.all(Radius.circular(10.0)),
                           //       color: Colors.amber,),
                           //   height: 12,
                           //   width: widthFive,
                           //   //color: Colors.amber,
                           // ),
                         ),
                       ),
                     ]),

                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Expanded(

                         child:
                         SizedBox(
                           width: double.infinity,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             //mainAxisAlignment: MainAxisAlignment.start,
                             children:  [

                               Icon(
                                 Icons.star,
                                 color: Colors.amber,
                                 size:starSize ,
                               ),
                             ],
                           ),
                         ),
                         flex: 1,
                       ),
                       Expanded(
                         flex: 2,
                         child: Container(
                             height: 18,
                             width: widthSlidpar,
                             margin: const EdgeInsets.only(right: 1,top: 2),
                             decoration: const BoxDecoration(
                               boxShadow: [],
                               borderRadius:
                               BorderRadius.all(Radius.circular(10.0)),
                               //   color: Colors.grey
                             ),
                             alignment: Alignment.topRight,
                             child: GFProgressBar(
                                 percentage:
                                 dataRating.percentageRateOne! / 100,
                                 backgroundColor:Color.fromRGBO(234, 235, 243, 1) ,

                                 // width: widthFive,
                                 lineHeight: 12,
                                 child: Container(),

                                 // width: widthSlidpar-10,
                                 animation: true,
                                 animateFromLastPercentage: true,
                                 fromRightToLeft: true,
                                 progressBarColor: Colors.amber)
                           // Container(
                           //   decoration: BoxDecoration(
                           //       boxShadow: [],
                           //       borderRadius:
                           //           BorderRadius.all(Radius.circular(10.0)),
                           //       color: Colors.amber,),
                           //   height: 12,
                           //   width: widthFive,
                           //   //color: Colors.amber,
                           // ),
                         ),
                       ),
                     ]),
                 SizedBox(height: 10,)
               ],

             )
             )
            ],
          ),


        ],
      ),
    );

    // return Card(
    //
    //   // child: Container(
    //   //   width: MediaQuery.of(context).size.width ,
    //   //   child: Row(
    //   //     mainAxisAlignment: MainAxisAlignment.start,
    //   //     crossAxisAlignment: CrossAxisAlignment.start,
    //   //     children: [
    //   //       Rate(context),
    //   //       Column(
    //   //         mainAxisAlignment: MainAxisAlignment.start,
    //   //         crossAxisAlignment: CrossAxisAlignment.start,
    //   //         mainAxisSize: MainAxisSize.max,
    //   //         children: [
    //   //           Row(
    //   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //               mainAxisSize: MainAxisSize.min,
    //   //               crossAxisAlignment: CrossAxisAlignment.start,
    //   //               children: [
    //   //                 Container(
    //   //                   width: 80,
    //   //                   child: Row(
    //   //                     mainAxisAlignment: MainAxisAlignment.start,
    //   //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   //                     //mainAxisAlignment: MainAxisAlignment.start,
    //   //                     children: [
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                     ],
    //   //                   ),
    //   //                 ),
    //   //                 Container(
    //   //                   height: 12,
    //   //                   width: widthSlidpar,
    //   //                   margin: EdgeInsets.only(right: 10),
    //   //                   decoration: BoxDecoration(
    //   //                       boxShadow: [],
    //   //                       borderRadius:
    //   //                           BorderRadius.all(Radius.circular(10.0)),
    //   //                       color: Colors.grey),
    //   //                   alignment: Alignment.topRight,
    //   //                   child: Container(
    //   //                     decoration: BoxDecoration(
    //   //                         boxShadow: [],
    //   //                         borderRadius:
    //   //                             BorderRadius.all(Radius.circular(10.0)),
    //   //                         color: Colors.amber,),
    //   //                     height: 12,
    //   //                     width: widthFive,
    //   //                     //color: Colors.amber,
    //   //                   ),
    //   //                 ),
    //   //               ]),
    //   //           Row(
    //   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //               mainAxisSize: MainAxisSize.min,
    //   //               crossAxisAlignment: CrossAxisAlignment.start,
    //   //               children: [
    //   //                 Container(
    //   //                   width: 80,
    //   //                   child: Row(
    //   //                     mainAxisAlignment: MainAxisAlignment.start,
    //   //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   //
    //   //                     //mainAxisAlignment: MainAxisAlignment.start,
    //   //                     children: [
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                     ],
    //   //                   ),
    //   //                 ),
    //   //                 Container(
    //   //                   height: 12,
    //   //                   width: widthSlidpar,
    //   //                   margin: EdgeInsets.only(right: 10),
    //   //                   decoration: BoxDecoration(
    //   //                       boxShadow: [],
    //   //                       borderRadius:
    //   //                           BorderRadius.all(Radius.circular(10.0)),
    //   //                       color: Colors.grey),
    //   //                   alignment: Alignment.topRight,
    //   //                   child: Container(
    //   //                     decoration: BoxDecoration(
    //   //                         boxShadow: [],
    //   //                         borderRadius:
    //   //                             BorderRadius.all(Radius.circular(10.0)),
    //   //                         color: Colors.amber,),
    //   //                     height: 12,
    //   //                     width: widthFour,
    //   //                     //color: Colors.amber,
    //   //                   ),
    //   //                 ),
    //   //               ]),
    //   //           Row(
    //   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //               mainAxisSize: MainAxisSize.min,
    //   //               crossAxisAlignment: CrossAxisAlignment.start,
    //   //               children: [
    //   //                 Container(
    //   //                   width: 80,
    //   //                   child: Row(
    //   //                     mainAxisAlignment: MainAxisAlignment.start,
    //   //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   //
    //   //                     //mainAxisAlignment: MainAxisAlignment.start,
    //   //                     children: [
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                     ],
    //   //                   ),
    //   //                 ),
    //   //                 Container(
    //   //                   height: 12,
    //   //                   width: widthSlidpar,
    //   //                   margin: EdgeInsets.only(right: 10),
    //   //                   decoration: BoxDecoration(
    //   //                       boxShadow: [],
    //   //                       borderRadius:
    //   //                           BorderRadius.all(Radius.circular(10.0)),
    //   //                       color: Colors.grey),
    //   //                   alignment: Alignment.topRight,
    //   //                   child: Container(
    //   //                     decoration: BoxDecoration(
    //   //                         boxShadow: [],
    //   //                         borderRadius:
    //   //                             BorderRadius.all(Radius.circular(10.0)),
    //   //                         color: Colors.amber,),
    //   //                     height: 12,
    //   //                     width: widthThree,
    //   //                     //color: Colors.amber,
    //   //                   ),
    //   //                 ),
    //   //               ]),
    //   //           Row(
    //   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //               mainAxisSize: MainAxisSize.min,
    //   //               crossAxisAlignment: CrossAxisAlignment.start,
    //   //               children: [
    //   //                 Container(
    //   //                   width: 80,
    //   //                   child: Row(
    //   //                     mainAxisAlignment: MainAxisAlignment.start,
    //   //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   //
    //   //                     //mainAxisAlignment: MainAxisAlignment.start,
    //   //                     children: [
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                     ],
    //   //                   ),
    //   //                 ),
    //   //                 Container(
    //   //                   height: 12,
    //   //                   width: widthSlidpar,
    //   //                   margin: EdgeInsets.only(right: 10),
    //   //                   decoration: BoxDecoration(
    //   //                       boxShadow: [],
    //   //                       borderRadius:
    //   //                           BorderRadius.all(Radius.circular(10.0)),
    //   //                       color: Colors.grey),
    //   //                   alignment: Alignment.topRight,
    //   //                   child: Container(
    //   //                     decoration: BoxDecoration(
    //   //                         boxShadow: [],
    //   //                         borderRadius:
    //   //                             BorderRadius.all(Radius.circular(10.0)),
    //   //                         color: Colors.amber,),
    //   //                     height: 12,
    //   //                     width: widthtTow,
    //   //                     //color: Colors.amber,
    //   //                   ),
    //   //                 ),
    //   //               ]),
    //   //           Row(
    //   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //               mainAxisSize: MainAxisSize.min,
    //   //               crossAxisAlignment: CrossAxisAlignment.start,
    //   //               children: [
    //   //                 Container(
    //   //                   width: 80,
    //   //                   child: Row(
    //   //                     mainAxisAlignment: MainAxisAlignment.start,
    //   //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   //
    //   //                     //mainAxisAlignment: MainAxisAlignment.start,
    //   //                     children: [
    //   //                       Icon(
    //   //                         Icons.star,
    //   //                         color: Colors.amber,
    //   //                         size: 14,
    //   //                       ),
    //   //                     ],
    //   //                   ),
    //   //                 ),
    //   //                 Container(
    //   //                   height: 12,
    //   //                   width: widthSlidpar,
    //   //                   margin: EdgeInsets.only(right: 10),
    //   //                   decoration: BoxDecoration(
    //   //                       boxShadow: [],
    //   //                       borderRadius:
    //   //                           BorderRadius.all(Radius.circular(10.0)),
    //   //                       color: Colors.grey),
    //   //                   alignment: Alignment.topRight,
    //   //                   child: Container(
    //   //                     decoration: BoxDecoration(
    //   //                         boxShadow: [],
    //   //                         borderRadius:
    //   //                             BorderRadius.all(Radius.circular(10.0)),
    //   //                         color: Colors.amber,),
    //   //                     height: 12,
    //   //                     width: widthtone,
    //   //                     //color: Colors.amber,
    //   //                   ),
    //   //                 ),
    //   //               ]),
    //   //         ],
    //   //       )
    //   //     ],
    //   //   ),
    //   // ),
    // )

    ;
  }

  Widget Rate(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:10,vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                    "  ${dp(dataRating.avrageRate!, 1).toString()}",
                    style: const
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size:  16,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size:  16,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size:  16,
                  ),
                ],
              ),



            ]))
    ;
  }

  Widget OldRate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text("${dataRating.totalStarRate}",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        ],
      ),
    );
  }
}
