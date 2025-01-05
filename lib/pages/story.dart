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
    String message = winRate >= 50 ? "You're smashing it! 🚀" : "Got some work to do! 📉";

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Win Rate: ${winRate.toStringAsFixed(2)}%",
            style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(color: textColor, fontSize: 20),
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
    // URLs for the GIFs
    final String positiveGifUrl =
        "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMHB5NW1yeTJoaHdoazU5dDg3Z3UxcHc0aHVyNThtdTF5cXhiNzhsdCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/aRRGY0316l5GMK2uZE/giphy.webp";
    final String negativeGifUrl =
        "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExcDQ3bnR2Y2QyazM4NWJ1OWs4bjZwOWk4czBlcDk2NHlybnI3ZXM4ayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/IlgcQyV59WCWMgRI2D/giphy.webp";

    // Determine which GIF to use based on the win rate
    String gifUrl = winRate >= 50 ? positiveGifUrl : negativeGifUrl;

    return Center(
      child: Image.network(
        gifUrl,
        fit: BoxFit.cover,
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
          return Text('Failed to load image');
        },
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
    if (pnlPercent > 0) {
      return "Looks like you're out of the trenches and heading to the moon! 🚀";
    } else if (pnlPercent == 0) {
      return "Steady in the trenches, soldier! Not every day's a battle. 🛡️";
    } else {
      return "Might need to report back to retardio bootcamp! Better luck next flip! 🍔";
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
        Text(
          'Your PnL over the last year',
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
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        Text(
          jokeText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
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
    return Scaffold(
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: StoryView(controller: controller, repeat: true, storyItems: [
              _storyItemInline(
                  widget: WinRateSlide(winRate: widget.walletData.winrate! * 100), backgroundColor: Colors.black),
              _storyItemInline(
                  widget: WinRateGifDisplay(winRate: widget.walletData.winrate! * 100), backgroundColor: Colors.black),
              _storyItemInline(
                  widget: PnLWrappedSlide(
                    pnlPercent: widget.walletData.pnl30d! * 100,
                    pnlAmount: widget.walletData.totalProfit!, // Appropriately humorous or motivational text
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
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0),
            bottom: Radius.circular(0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Center(
          child: widget,
        ),
        //color: backgroundColor,
      ),
      shown: true,
      duration: duration ?? Duration(seconds: 5),
    );
  }
}
