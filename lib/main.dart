import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_task_1/views/404_not_found.dart';
import 'package:internship_task_1/views/Onboarding.dart';
import 'package:internship_task_1/views/Search%20Screen/no_search_results.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/Ratings_&_Reviews.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/edit_profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/settings.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/add_video.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/comments.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/search_videos.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/questions.dart';
import 'package:internship_task_1/views/Search%20Screen/search_questions.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/training%20videos.dart';
import 'package:internship_task_1/views/connection_lost.dart';
import 'package:internship_task_1/views/navigation_bottom_bar.dart';
import 'package:internship_task_1/views/forgot_password.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/home/home.dart';
import 'package:internship_task_1/views/login.dart';
import 'package:internship_task_1/views/no_data_found.dart';
import 'package:internship_task_1/views/no_internet.dart';
import 'package:internship_task_1/views/onboarding/onboarding_1.dart';
import 'package:internship_task_1/views/onboarding/onboarding_2.dart';
import 'package:internship_task_1/views/onboarding/onboarding_3.dart';
import 'package:internship_task_1/views/registration1.dart';
import 'package:internship_task_1/views/registration2.dart';
import 'package:internship_task_1/views/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Providers/user_registration.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserRegistrationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Splash_Screen(),
    );
  }
}
