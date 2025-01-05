class WalletResponse {
  final int code;
  final String msg;
  final WalletData? data; // Make data nullable

  WalletResponse({required this.code, required this.msg, this.data});

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      code: json['code'],
      msg: json['msg'],
      data: json['data'] != null ? WalletData.fromJson(json['data']) : null,
    );
  }
}

class WalletData {
  final bool? twitterBind;
  final int? twitterFansNum;
  final String? twitterUsername;
  final String? twitterName;
  final String? ens;
  final String? avatar;
  final String? name;
  final String? ethBalance;
  final String? solBalance;
  final String? trxBalance;
  final String? balance;
  final double? totalValue;
  final double? unrealizedProfit;
  final double? unrealizedPnl;
  final double? realizedProfit;
  final double? pnl;
  final double? pnl7d;
  final double? pnl30d;
  final double? realizedProfit7d;
  final double? realizedProfit30d;
  final double? winrate;
  final double? allPnl;
  final double? totalProfit;
  final double? totalProfitPnl;
  final int? buy30d;
  final int? sell30d;
  final int? buy7d;
  final int? sell7d;
  final int? buy;
  final int? sell;
  final double? historyBoughtCost;
  final double? tokenAvgCost;
  final double? tokenSoldAvgProfit;
  final int? tokenNum;
  final int? profitNum;
  final int? pnlLtMinusDot5Num;
  final int? pnlMinusDot5To0xNum;
  final int? pnlLt2xNum;
  final int? pnl2x5xNum;
  final int? pnlGt5xNum;
  final int? lastActiveTimestamp;
  final List<String>? tags;
  final Map<String, int>? tagRank;
  final int? followersCount;
  final bool? isContract;
  final int? updatedAt;
  final int? refreshRequestedAt;

  WalletData({
    this.twitterBind,
    this.twitterFansNum,
    this.twitterUsername,
    this.twitterName,
    this.ens,
    this.avatar,
    this.name,
    this.ethBalance,
    this.solBalance,
    this.trxBalance,
    this.balance,
    this.totalValue,
    this.unrealizedProfit,
    this.unrealizedPnl,
    this.realizedProfit,
    this.pnl,
    this.pnl7d,
    this.pnl30d,
    this.realizedProfit7d,
    this.realizedProfit30d,
    this.winrate,
    this.allPnl,
    this.totalProfit,
    this.totalProfitPnl,
    this.buy30d,
    this.sell30d,
    this.buy7d,
    this.sell7d,
    this.buy,
    this.sell,
    this.historyBoughtCost,
    this.tokenAvgCost,
    this.tokenSoldAvgProfit,
    this.tokenNum,
    this.profitNum,
    this.pnlLtMinusDot5Num,
    this.pnlMinusDot5To0xNum,
    this.pnlLt2xNum,
    this.pnl2x5xNum,
    this.pnlGt5xNum,
    this.lastActiveTimestamp,
    this.tags,
    this.tagRank,
    this.followersCount,
    this.isContract,
    this.updatedAt,
    this.refreshRequestedAt,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      twitterBind: json['twitter_bind'],
      twitterFansNum: json['twitter_fans_num'],
      twitterUsername: json['twitter_username'],
      twitterName: json['twitter_name'],
      ens: json['ens'],
      avatar: json['avatar'],
      name: json['name'],
      ethBalance: json['eth_balance'],
      solBalance: json['sol_balance'],
      trxBalance: json['trx_balance'],
      balance: json['balance'],
      totalValue: json['total_value'],
      unrealizedProfit: json['unrealized_profit'],
      unrealizedPnl: json['unrealized_pnl'],
      realizedProfit: json['realized_profit'],
      pnl: json['pnl'],
      pnl7d: json['pnl_7d'],
      pnl30d: json['pnl_30d'],
      realizedProfit7d: json['realized_profit_7d'],
      realizedProfit30d: json['realized_profit_30d'],
      winrate: json['winrate'],
      allPnl: json['all_pnl'],
      totalProfit: json['total_profit'],
      totalProfitPnl: json['total_profit_pnl'],
      buy30d: json['buy_30d'],
      sell30d: json['sell_30d'],
      buy7d: json['buy_7d'],
      sell7d: json['sell_7d'],
      buy: json['buy'],
      sell: json['sell'],
      historyBoughtCost: json['history_bought_cost'],
      tokenAvgCost: json['token_avg_cost'],
      tokenSoldAvgProfit: json['token_sold_avg_profit'],
      tokenNum: json['token_num'],
      profitNum: json['profit_num'],
      pnlLtMinusDot5Num: json['pnl_lt_minus_dot5_num'],
      pnlMinusDot5To0xNum: json['pnl_minus_dot5_0x_num'],
      pnlLt2xNum: json['pnl_lt_2x_num'],
      pnl2x5xNum: json['pnl_2x_5x_num'],
      pnlGt5xNum: json['pnl_gt_5x_num'],
      lastActiveTimestamp: json['last_active_timestamp'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      tagRank: json['tag_rank'] != null ? Map<String, int>.from(json['tag_rank']) : null,
      followersCount: json['followers_count'],
      isContract: json['is_contract'],
      updatedAt: json['updated_at'],
      refreshRequestedAt: json['refresh_requested_at'],
    );
  }
}
