class HoldingResponse {
  final int code;
  final Data data;

  HoldingResponse({
    required this.code,
    required this.data,
  });

  factory HoldingResponse.fromJson(Map<String, dynamic> json) {
    return HoldingResponse(
      code: json['code'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data.toJson(),
    };
  }
}

class Data {
  final List<Holding> holdings;
  final String next;

  Data({required this.holdings, required this.next});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      holdings: (json['holdings'] as List)
          .map((item) => Holding.fromJson(item))
          .toList(),
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'holdings': holdings.map((item) => item.toJson()).toList(),
      'next': next,
    };
  }
}

class Holding {
  final Token token;
  final String balance;
  final String usdValue;
  final String realizedProfit30d;
  final String realizedProfit;
  final String realizedPnl;
  final String realizedPnl30d;
  final String unrealizedProfit;
  final String unrealizedPnl;
  final String totalProfit;
  final String totalProfitPnl;
  final String avgCost;
  final String avgSold;
  final int buy30d;
  final int sell30d;
  final int sells;
  final String price;
  final String cost;
  final String positionPercent;
  final int lastActiveTimestamp;
  final String historySoldIncome;
  final String historyBoughtCost;

  Holding({
    required this.token,
    required this.balance,
    required this.usdValue,
    required this.realizedProfit30d,
    required this.realizedProfit,
    required this.realizedPnl,
    required this.realizedPnl30d,
    required this.unrealizedProfit,
    required this.unrealizedPnl,
    required this.totalProfit,
    required this.totalProfitPnl,
    required this.avgCost,
    required this.avgSold,
    required this.buy30d,
    required this.sell30d,
    required this.sells,
    required this.price,
    required this.cost,
    required this.positionPercent,
    required this.lastActiveTimestamp,
    required this.historySoldIncome,
    required this.historyBoughtCost,
  });

  factory Holding.fromJson(Map<String, dynamic> json) {
    return Holding(
      token: Token.fromJson(json['token']),
      balance: json['balance'],
      usdValue: json['usd_value'],
      realizedProfit30d: json['realized_profit_30d'],
      realizedProfit: json['realized_profit'],
      realizedPnl: json['realized_pnl'],
      realizedPnl30d: json['realized_pnl_30d'],
      unrealizedProfit: json['unrealized_profit'],
      unrealizedPnl: json['unrealized_pnl'],
      totalProfit: json['total_profit'],
      totalProfitPnl: json['total_profit_pnl'],
      avgCost: json['avg_cost'],
      avgSold: json['avg_sold'],
      buy30d: json['buy_30d'],
      sell30d: json['sell_30d'],
      sells: json['sells'],
      price: json['price'],
      cost: json['cost'],
      positionPercent: json['position_percent'],
      lastActiveTimestamp: json['last_active_timestamp'],
      historySoldIncome: json['history_sold_income'],
      historyBoughtCost: json['history_bought_cost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token.toJson(),
      'balance': balance,
      'usd_value': usdValue,
      'realized_profit_30d': realizedProfit30d,
      'realized_profit': realizedProfit,
      'realized_pnl': realizedPnl,
      'realized_pnl_30d': realizedPnl30d,
      'unrealized_profit': unrealizedProfit,
      'unrealized_pnl': unrealizedPnl,
      'total_profit': totalProfit,
      'total_profit_pnl': totalProfitPnl,
      'avg_cost': avgCost,
      'avg_sold': avgSold,
      'buy_30d': buy30d,
      'sell_30d': sell30d,
      'sells': sells,
      'price': price,
      'cost': cost,
      'position_percent': positionPercent,
      'last_active_timestamp': lastActiveTimestamp,
      'history_sold_income': historySoldIncome,
      'history_bought_cost': historyBoughtCost,
    };
  }
}

class Token {
  final String address;
  final String tokenAddress;
  final String symbol;
  final String name;
  final int decimals;
  final String logo;
  final String? priceChange6h;
  final bool isShowAlert;
  final bool? isHoneypot;

  Token({
    required this.address,
    required this.tokenAddress,
    required this.symbol,
    required this.name,
    required this.decimals,
    required this.logo,
    this.priceChange6h,
    required this.isShowAlert,
    this.isHoneypot,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      address: json['address'],
      tokenAddress: json['token_address'],
      symbol: json['symbol'],
      name: json['name'],
      decimals: json['decimals'],
      logo: json['logo'],
      priceChange6h: json['price_change_6h'],
      isShowAlert: json['is_show_alert'],
      isHoneypot: json['is_honeypot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'token_address': tokenAddress,
      'symbol': symbol,
      'name': name,
      'decimals': decimals,
      'logo': logo,
      'price_change_6h': priceChange6h,
      'is_show_alert': isShowAlert,
      'is_honeypot': isHoneypot,
    };
  }
}
