import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class LegendWidget extends StatelessWidget {
  final Map<String,double> categoryData;
  final List<Color> colors;
  final double total;
  const LegendWidget({super.key, required this.categoryData, required this.colors, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(7, context),
      width: screenWidth(1.5, context),
      padding: EdgeInsets.only(top: screenHeight(70, context)),
      decoration: BoxDecoration(
       
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: 
          List.generate(categoryData.entries.length,(index) {
            final entry=categoryData.entries.elementAt(index);
            final percentage=(entry.value/total)*100;
           
            return Padding(padding: EdgeInsets.only(bottom: screenHeight(110, context)),child: Row(children: [
              Container(
                width: screenWidth(60, context),
                height: screenWidth(60, context),
                decoration: BoxDecoration(
                  color: colors[index%colors.length],
                  shape: BoxShape.circle
                ),
              ),
              SizedBox(width: screenWidth(50, context),),
              Expanded(child: Text(
                entry.key,
                style: TextStyle(
                  fontSize: screenWidth(29, context),
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              )),
              Text("${percentage.toStringAsFixed(1)}%",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,  color: Colors.white),)
            ],),);
           
          }, ),
        
      ),
    );
  }
}