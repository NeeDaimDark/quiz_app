# Flutter Quiz App

An interactive, mobile-first quiz application built with Flutter and Dart. The app guides users through a set of multiple‑choice questions, tracks their selections, and presents a color‑coded results summary with per‑question feedback and an option to restart the quiz.

## Technologies
- Flutter 3 (Dart 3)
- Material Design widgets
- Google Fonts (Lato)

## Key Features
- Gradient‑themed UI and asset‑based branding (quiz logo)
- Start, Questions, and Results screens implemented with clear widget composition
- Shuffled answer options per question for variability
- Answer buttons with responsive text and consistent spacing
- Results summary with:
  - Circular index badges (blue for correct, red for incorrect)
  - Separate, color‑coded lines for the chosen vs. correct answer
  - Scrollable list for long content
- One‑tap Restart Quiz flow

## Architecture Overview
- Data model: `QuizQuestion` (immutable) with a helper `getShuffledOptions()`
- Questions source: `lib/data/questions.dart`
- UI layers:
  - `StartScreen` – entry screen with image and CTA
  - `QuestionsScreen` – renders the current question and answer buttons
  - `ResultsScreen` – computes score and shows `QuestionsSummary`
  - `QuestionsSummary` – builds the detailed, scrollable per‑question view
- State management: local state via `StatefulWidget` and `setState`, answers lifted to the root `Quiz` widget and passed via callbacks

## Project Structure
- `lib/`
  - `quiz.dart` – root widget, navigation between screens, state holder
  - `start_screen.dart`, `questions_screen.dart`, `results_screen.dart`
  - `questions_summary.dart`, `answer_button.dart`
  - `data/questions.dart`, `models/quiz_question.dart`
- `assets/images/quiz-logo.png` (declared in `pubspec.yaml`)

## Getting Started
1. Prerequisites: Flutter SDK, a connected device or emulator (Android or iOS).
2. Fetch dependencies: `flutter pub get`
3. Run the app: `flutter run`
   - To test on a physical Android device, enable USB debugging; optional: mirror with `scrcpy`.

## Notes
- The app avoids native code; no NDK required.
- Styling uses Google Fonts and simple color constants for clarity.

## License
This project is provided for learning purposes. Update with your preferred license if needed.
