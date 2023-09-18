import 'package:flutter/material.dart';
import 'package:flutter_web3wallet/pages/wallet.dart';
import 'package:flutter_web3wallet/provider/wallet_provider.dart';
import 'package:provider/provider.dart';


class ImportWallet extends StatefulWidget {
  const ImportWallet({Key? key}) : super(key: key);

  @override
  _ImportWalletState createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  bool isVerified = false;
  String verificationText = '';
    TextEditingController privateKeyController = TextEditingController();

  void navigateToWalletPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const WalletPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // void verifyMnemonic() async {
    //   final walletProvider =
    //       Provider.of<WalletProvider>(context, listen: false);

    //   // Call the getPrivateKey function from the WalletProvider
    //   final privateKey = await walletProvider.getPrivateKey(verificationText);

    //   navigateToWalletPage();
    // }

    void verifyPrivateKey() async {

      final walletProvider =
          Provider.of<WalletProvider>(context, listen: false);
      // Get the private key from the text field
      String privateKey = privateKeyController.text;

      // Validate the private key (you may need to add more validation logic)
      bool isValidPrivateKey = privateKey.isNotEmpty; // Example validation

      if (isValidPrivateKey) {
        // Call the setPrivateKey function from the WalletProvider
        walletProvider.setPrivateKey(privateKey);

        navigateToWalletPage();
      } else {
        // Handle invalid private key input
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Private Key'),
              content: Text('Please enter a valid private key.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Import from private key'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please Enter your private key:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: privateKeyController,
              decoration: const InputDecoration(
                labelText: 'Enter private key',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: verifyPrivateKey,
              child: const Text('Import'),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
