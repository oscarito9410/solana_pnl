import 'package:http/http.dart' as http;

class WalletService {
  static const String _baseUrl = 'https://api-wallet-z0f9.onrender.com/Wallet/GetProfits';

  Future<bool> fetchProfits(String walletAddress) async {
    try {
      // Build the URL with the wallet address as a query parameter
      var url = Uri.parse(_baseUrl).replace(queryParameters: {'address': walletAddress});

      // Perform a GET request
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // You can also process the response data here if needed
        return true;
      } else {
        print('Failed to fetch data: ${response.body}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
