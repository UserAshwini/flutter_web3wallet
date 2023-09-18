import 'package:flutter/material.dart';
import 'package:flutter_web3wallet/pages/login_page.dart';
import 'package:flutter_web3wallet/provider/wallet_provider.dart';
import 'package:flutter_web3wallet/utils/routes.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the private key
  WalletProvider walletProvider = WalletProvider();
  await walletProvider.loadPrivateKey();

  runApp(
    ChangeNotifierProvider<WalletProvider>.value(
      value: walletProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}

