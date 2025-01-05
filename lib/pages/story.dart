import 'package:flutter/material.dart';
import 'package:solana_pnl/network/wallet_data.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  final WalletData walletData;

  const StoryPage({super.key, required this.walletData});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class WinRateSlide extends StatelessWidget {
  final double winRate;

  const WinRateSlide({super.key, required this.winRate});

  @override
  Widget build(BuildContext context) {
    return createWinRateSlide(winRate);
  }

  Widget createWinRateSlide(double winRate) {
    Color textColor = winRate >= 50 ? Colors.green[300]! : Colors.red[300]!;
    String message = winRate >= 50
        ? "WAGMI! Your diamond hands are paying off! 💎🤲"
        : "NGMI? Maybe it's time for some yield farming to moon again! 🌙";

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Win Rate: ${winRate.toStringAsFixed(2)}%",
            style: TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(color: textColor, fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class WinRateGifDisplay extends StatelessWidget {
  final double winRate;

  const WinRateGifDisplay({Key? key, required this.winRate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String positiveGifUrl =
        "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMHB5NW1yeTJoaHdoazU5dDg3Z3UxcHc0aHVyNThtdTF5cXhiNzhsdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/aRRGY0316l5GMK2uZE/giphy.webp";
    const String negativeGifUrl =
        "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExcDQ3bnR2Y2QyazM4NWJ1OWs4bjZwOWk4czBlcDk2NHlybnI3ZXM4ayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/IlgcQyV59WCWMgRI2D/giphy.webp";

    String gifUrl = winRate >= 50 ? positiveGifUrl : negativeGifUrl;
    String message =
        winRate >= 50 ? "Green big dildos 🍆" : "You're cooked, my friend. Time to put the fries in the bag! 🍟";

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            gifUrl,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            // Adjust as needed
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Text('Failed to load image');
            },
          ),
          SizedBox(height: 10), // Spacing between the GIF and text
          Text(
            message,
            style: TextStyle(
              color: winRate >= 50 ? Colors.green : Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PnLWrappedSlide extends StatelessWidget {
  final double pnlPercent;
  final double pnlAmount;

  const PnLWrappedSlide({
    super.key,
    required this.pnlPercent,
    required this.pnlAmount,
  });

  String _getJokeBasedOnPnL() {
    if (pnlPercent > 50) {
      return "You're aping in like a true SOL degen! Wen Lambo? 🚀🚗";
    } else if (pnlPercent > 0 && pnlPercent <= 50) {
      return "Holding with diamond hands, but maybe you need some more hopium to moon! 💎🤲🌙";
    } else if (pnlPercent == 0) {
      return "No gains, no losses - you've just survived another FUD cycle! 🛡️";
    } else {
      return "Looks like you've been hit by a rug pull or just caught the wrong meme coin. Time to farm some yield or wait for the next airdrop? 🧹🔄";
    }
  }

  @override
  Widget build(BuildContext context) {
    String pnlDisplay = '${pnlPercent.toStringAsFixed(2)}%';
    String pnlAmountDisplay = '\$${pnlAmount.toStringAsFixed(2)} USD';
    Color textColor = pnlPercent < 0 ? Colors.red[300]! : Colors.green[300]!;
    String jokeText = _getJokeBasedOnPnL();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your PnL over the last month',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Text(
          pnlDisplay,
          style: TextStyle(
            color: textColor,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          pnlAmountDisplay,
          style: TextStyle(
            color: textColor,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          jokeText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _StoryPageState extends State<StoryPage> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    var winRate = widget.walletData.winrate ?? 0.0;

    var pnln30d = widget.walletData.pnl ?? 0.0;

    var totalProfit = widget.walletData.totalProfit ?? 0.0;

    return Scaffold(
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: StoryView(controller: controller, repeat: true, storyItems: [
              _storyItemInline(widget: WinRateSlide(winRate: winRate * 100), backgroundColor: Colors.black),
              _storyItemInline(widget: WinRateGifDisplay(winRate: winRate * 100), backgroundColor: Colors.black),
              _storyItemInline(
                  widget: PnLWrappedSlide(
                    pnlPercent: pnln30d * 100,
                    pnlAmount: totalProfit, // Appropriately humorous or motivational text
                  ),
                  backgroundColor: Colors.black),
            ])));
  }

  _storyItemInline({
    required Widget widget,
    required Color backgroundColor,
    Key? key,
    Duration? duration,
  }) {
    return StoryItem(
      Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(0),
            bottom: Radius.circular(0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Center(
          child: widget,
        ),
        //color: backgroundColor,
      ),
      shown: true,
      duration: duration ?? const Duration(seconds: 5),
    );
  }
}
