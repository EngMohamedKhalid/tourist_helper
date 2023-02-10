import 'package:flutter/material.dart';
import 'package:tourist_helper/localization/appLocal.dart';
class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  const Rating(this.onRatingSelected,[this.maximumRating=5]);

  @override
  // ignore: library_private_types_in_public_api
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _currentRating=0;

  Widget _buildRatingStar(int index){
    if (index<_currentRating){
      return Icon(Icons.star,color: Colors.orange,size: 26,);
    }
    else {
      return Icon(Icons.star_border_outlined,size: 25,
       color: Color.fromARGB(255, 0, 57, 104),
      );
    }
  }

  Widget _buildBody(){
    final stars =List<Widget>.generate(widget.maximumRating, (index){
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: (){
          setState(() {
            _currentRating=index+1;
          });
          widget.onRatingSelected(_currentRating);
        },
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: stars,
      ),
      MaterialButton(
        child: Text('${getLang(context, "clear")}',style: TextStyle(color:Color.fromARGB(255, 0, 57, 104),),),
        onPressed: (){
          setState(() {
            _currentRating=0;
          });
          widget.onRatingSelected(_currentRating);
        },
      )
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
