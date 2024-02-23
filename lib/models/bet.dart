class Bet {

  String game_id;
  String game_type;
  String owner;
  double bet_amount;
  String transaction_id;
  String currency_id;
  String status;
  String rollback;
  String refund;
  String bonus;
  String jackpot;
  String buyin;
  String buyout;
  String pushbet;
  String wager_id;
  String payout_amount;
  String creation_date;

  Bet({
    this.game_id,
    this.game_type,
    this.owner,
    this.bet_amount,
    this.transaction_id,
    this.bonus,
    this.buyin,
    this.buyout,
    this.creation_date,
    this.currency_id,
    this.jackpot,
    this.payout_amount,
    this.pushbet,
    this.refund,
    this.rollback,
    this.status,
    this.wager_id
  });

}