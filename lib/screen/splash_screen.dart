import 'package:flutter/material.dart';
import 'package:news_app/screen/news_list.dart';
import 'package:news_app/utils/appstate.dart';
import 'package:news_app/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    super.initState();
    initialFunction();
  }

  Future<void> initialFunction() async {
    final appState = context.read<AppState>();

    try {
      await dotenv.load();

      String baseUrl = '${dotenv.env['base_url']}';
      String apiKey = '${dotenv.env['api_key']}';

      appState.setAPIkey(apiKey);
      appState.setBaseUrl(baseUrl);
    } catch (e) {
      printLog(e);
    }

    if (mounted) {
      printLog(appState.baseUrl);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const NewsList()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
