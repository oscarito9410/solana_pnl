import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solana_pnl/network/holding_data.dart';
import 'package:solana_pnl/network/wallet_data.dart';

class WalletService {
  static const String _baseUrl = 'https://api-wallet-z0f9.onrender.com/Wallet/';
  static const String _profitEndPoint = 'GetProfits';
  static const String _holdingEndPoint = 'Holdings';

  Future<WalletResponse?> fetchProfits(String walletAddress) async {
    try {
      // Build the URL with the wallet address as a query parameter
      var url = Uri.parse(_baseUrl+_profitEndPoint).replace(queryParameters: {'address': walletAddress});

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

  Future<HoldingResponse?> fetchHoldings(String walletAddress) async {
    try {
      // Build the URL with the wallet address as a query parameter
      var url = Uri.parse(_baseUrl+_holdingEndPoint).replace(queryParameters: {'address': walletAddress});

      // Perform a GET request
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return HoldingResponse.fromJson(jsonResponse);
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
