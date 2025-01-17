import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:solana_pnl/component/loading_button.dart';
import 'package:solana_pnl/contants.dart';
import 'package:solana_pnl/network/holding_data.dart';
import 'package:solana_pnl/network/wallet_data.dart';
import 'package:solana_pnl/network/wallet_service.dart';
import 'package:solana_pnl/pages/story.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _inputCode = "";

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  void _updateInputCode(String newCode) {
    setState(() {
      _inputCode = newCode;
    });
  }

  void _buttonPressed() async {
    if (_inputCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a wallet address.")),
      );
      _btnController.error();
      Timer(Duration(seconds: 1), () {
        _btnController.reset();
      });
      return;
    }
    _btnController.start();
    var service = WalletService();
    WalletResponse? response = await service.fetchProfits(_inputCode);

    HoldingResponse? holdingResponse = await service.fetchHoldings(_inputCode);
    if (response != null && holdingResponse != null) {
      _btnController.success();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StoryPage(walletData: response.data!, holdings: holdingResponse.data.holdings)),
      );
    } else {
      _btnController.error();
      Timer(Duration(seconds: 1), () {
        _btnController.reset();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to fetch wallet profits")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Metaballs(
      color: const Color.fromARGB(255, 66, 133, 244),
      effect: MetaballsEffect.follow(
        growthFactor: 1,
        smoothing: 1,
        radius: 0.5,
      ),
      gradient: const LinearGradient(colors: [
        Color.fromARGB(255, 60, 255, 210),
        Color.fromARGB(255, 8, 245, 156),
      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
      metaballs: 40,
      animationDuration: const Duration(milliseconds: 200),
      speedMultiplier: 1,
      bounceStiffness: 3,
      minBallRadius: 15,
      maxBallRadius: 40,
      glowRadius: 0.7,
      glowIntensity: 0.6,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "2024 through the PF trenches",
                style: TextStyle(fontSize: 40, shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.black),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.black),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.black),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.black)
                ]),
              ),
              const SizedBox(height: 20),
              InputField(onChanged: _updateInputCode),
              const SizedBox(height: 20),
              ActionButton(controller: _btnController, onButtonPressed: _buttonPressed),
            ],
          ),
        ),
      ),
    ));
  }
}

class InputField extends StatelessWidget {
  final Function(String) onChanged;

  const InputField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          filled: true,
          hintText: 'Paste your wallet address here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
      );
}

class ActionButton extends StatelessWidget {
  final RoundedLoadingButtonController controller;
  final Function() onButtonPressed;

  const ActionButton({super.key, required this.onButtonPressed, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      onPressed: () => onButtonPressed(),
      controller: controller,
      height: 60,
      width: 200,
      color: Colors.black,
      child: const Text(
        'REVIEW',
        style: TextStyle(fontFamily: pixelifyFont),
      ),
    );
  }
}

class GifDisplay extends StatelessWidget {
  const GifDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ''
      'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExem5nZ3hxd3dsNzA3cHZ6c3FseWZ1azd3ZGpnYXhkNHR4Y3F1M2psOCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/67ThRZlYBvibtdF9JH/giphy.webp',
      // Replace with your actual GIF URL
      height: 250, // You can adjust the size as needed
      fit: BoxFit.cover, // This ensures the entire GIF is visible within the bounds
    );
  }
}
