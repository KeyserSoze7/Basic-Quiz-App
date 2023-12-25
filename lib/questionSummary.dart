import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: summaryData.map((data) {
      return Row(
        children: [
          Text(((data['Question_Index'] as int)+1).toString(),),
          Expanded(
              // Expanded makes sure that it's child can't take more space that it's(childs) flex widget 
              // This is useful for restricting pixel overflow condition 
              child: Column(
            children: [
              Text(data['Question'] as String,style: GoogleFonts.lato(
                fontSize: 16,
                color: Color.fromARGB(255, 201, 153, 251)
              )
              ,),
              const SizedBox(
                height: 5,
              ),
              Text(data['User_Ans'] as String, style: GoogleFonts.lato(
                fontSize: 14,
                color: Color.fromARGB(255, 201, 153, 251)
              ),),

              Text(data['Correct_Ans'] as String, style: GoogleFonts.lato(
                fontSize: 15,
                color: Color.fromARGB(177, 50, 3, 101),
                fontWeight: FontWeight.bold,
              ),),
            ],
          ))
        ],
      );
    }).toList());
  }
}
