import 'package:flutter/material.dart';
import 'package:flutter_web3wallet/pages/generate_mnemonic.dart';
import 'package:flutter_web3wallet/pages/import_wallet.dart';
import 'package:flutter_web3wallet/styles/palette.dart';

class CreateOrImportPage extends StatelessWidget {
  const CreateOrImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'BitSafe Wallet',
                style: TextStyle(
                    color: Palette.heading,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/images/logo.png',
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenerateMnemonicPage(),
                  ),
                );
              },
                child: const Text(
                  'Create Wallet',
                  style: TextStyle(
                      color: Palette.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: 
                () {
                  // Add your register logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImportWallet(),
                    ),
                  );
                },
                child:const Text('Import from private key',
                    style: TextStyle(
                        color: Palette.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 24.0),

            // Footer
            Container(
              alignment: Alignment.center,
              child: const Text(
                '© 2023 Moralis. All rights reserved.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
