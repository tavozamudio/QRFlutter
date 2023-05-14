import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_rect/pages/home_page.dart';
import 'package:qr_rect/pages/mapa_page.dart';
import 'package:qr_rect/providers/scan_list_provider.dart';
import 'package:qr_rect/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'mapa': (context) => MapaPage(),
        },
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.deepPurple,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepPurple,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
