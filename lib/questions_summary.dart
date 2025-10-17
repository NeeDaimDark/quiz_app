import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color _badgeColor(bool isCorrect) => isCorrect ? const Color(0xFF4FC3F7) : const Color(0xFFE57373); // blue vs red
  Color get _userAnswerColor => const Color(0xFFB39DDB); // light purple
  Color get _correctAnswerColor => const Color(0xFF80CBC4); // teal

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            final questionIndex = (data['question_index'] as int) + 1;
            final question = data['question'] as String;
            final userAnswer = data['user_answer'] as String;
            final correctAnswer = data['correct_answer'] as String;
            final isCorrect = userAnswer == correctAnswer;

            return Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // index badge
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _badgeColor(isCorrect),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      questionIndex.toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          userAnswer,
                          style: GoogleFonts.lato(
                            color: _userAnswerColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          correctAnswer,
                          style: GoogleFonts.lato(
                            color: _correctAnswerColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
