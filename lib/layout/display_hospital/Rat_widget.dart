import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class AddRateWidget extends StatelessWidget {

  const AddRateWidget({Key? key, required this.dataNoRiting,required this.isRiting,required this.onRatingUpdate}) : super(key: key);

  final bool ? isRiting;
  final double dataNoRiting;
  final ValueChanged<double> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    double noRiting=dataNoRiting;

    return Container(

      width: MediaQuery.of(context).size.width,
      child:   Center(
        child: RatingBar.builder(
          wrapAlignment: WrapAlignment.spaceBetween,
          initialRating:noRiting.toDouble(),
          minRating: 0,

          itemSize:  40,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,


          itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),

          unratedColor: Colors.grey,
          onRatingUpdate: (rating) async {
          onRatingUpdate(rating);


          },
        ),
      ),
    );
  }
}
