import 'package:alive_project_master/control/dropdown_provider.dart';
import 'package:alive_project_master/view/intro_page/splash_screen.dart';
import 'package:alive_project_master/view/search_result/searchpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'control/dropdown_provider_one.dart';
import 'control/text_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ModelProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => PeopleListProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => DropdownProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TextMain(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer(builder: (context, value, child) => SearchPage()),
      ),
    );
  }
}

// SlpashScreen