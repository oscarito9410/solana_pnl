import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solana_pnl/network/wallet_data.dart';

class WalletService {
  static const String _baseUrl = 'https://api-wallet-z0f9.onrender.com/Wallet/GetProfits';

  Future<WalletResponse?> fetchProfits(String walletAddress) async {
    try {
      // Build the URL with the wallet address as a query parameter
      var url = Uri.parse(_baseUrl).replace(queryParameters: {'address': walletAddress});

      // Perform a GET request
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return WalletResponse.fromJson(jsonResponse);
      } else {
        print('Failed to fetch data: ${response.body}');
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}
