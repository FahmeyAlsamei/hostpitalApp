import 'package:flutter/material.dart';

class AnimationForImageInDisplayList extends StatefulWidget {
   final String  path;
   bool isfromhosital;
   bool isfrompharmacy;
   bool isfromLab;

 AnimationForImageInDisplayList({required this.path,this.isfromhosital=false,this.isfromLab=false,this.isfrompharmacy=false}) ;

  @override
  State<AnimationForImageInDisplayList> createState() => _AnimationForImageInDisplayListState();
}

class _AnimationForImageInDisplayListState extends State<AnimationForImageInDisplayList> with TickerProviderStateMixin {
  // animation controller
  late AnimationController _controller;
  // initialize _controller
  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds:7 ), vsync: this)
          ..repeat(reverse: true);
    super.initState();
  }

  // dispose _controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// decoration tween
  final DecorationTween _decorationTween = DecorationTween(
      // beginning values (color, shape, boxShadow, border)

      begin: BoxDecoration(
        color:const Color.fromRGBO(78,162,152,1),
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x66666666),
            blurRadius: 10.0,
            spreadRadius: 2,
            offset: Offset(0, 6.0),
          )
        ],
      ),
      end: BoxDecoration(
        color: const Color(0xFFFFFFFF),

        border: Border.all(
          style: BorderStyle.none,
        ),

        borderRadius: BorderRadius.zero,

// No shadow.
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(1),
        child: DecoratedBoxTransition(
            decoration: _decorationTween.animate(_controller),
            child: Container(
                padding: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height / 3.8,


                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white, width: 3),

                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: widget.path!.contains("http")?
                              NetworkImage(widget.path!) as ImageProvider:

                          AssetImage(widget.path!=null?
                          widget.path!:'images/HOS.JPG'
                          ))),
                )

            )

        ));
  }
}

