import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '/services/http_service.dart';
import '/services/movie_service.dart';
import '/model/app_config.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitComplete;

  const SplashScreen({
    Key key,
    @required this.onInitComplete,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 1,
      ),
    ).then(
      (_) => _setup(context).then(
        (_) => widget.onInitComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext _context) async {
    try {
      final getIt = GetIt.instance;
      final configFile = await rootBundle.loadString('assets/config/main.json');
      final configData = json.decode(configFile);

      getIt.registerSingleton<AppConfig>(
        AppConfig(
          apiKey: configData['API_KEY'],
          baseApiUrl: configData['BASE_API_URL'],
          baseImageApiUrl: configData['BASE_IMAGE_API_URL'],
        ),
      );

      getIt.registerSingleton<HttpService>(
        HttpService(),
      );

      getIt.registerSingleton<MovieService>(
        MovieService(),
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
