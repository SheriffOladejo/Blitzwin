import 'package:blitzwin/models/app_user.dart';
import 'package:blitzwin/models/bet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class DbHelper {

  DbHelper._createInstance();

  static const String db_name = "blitzwin.db";

  static Database _database;
  static DbHelper helper;

  static const String TABLE_USERS = "users";

  static const String COL_USER_ID = "user_id";
  static const String COL_USERNAME = "username";
  static const String COL_EMAIL = "email";
  static const String COL_PASSWORD = "password";
  static const String COL_FIRSTNAME = "firstname";
  static const String COL_LASTNAME = "lastname";
  static const String COL_DOB = "dob";
  static const String COL_DATE_JOINED = "date_joined";
  static const String COL_BALANCE = "balance";
  static const String COL_WALLET = "wallet";
  static const String COL_CURRENCY = "currency";


  static const String COL_ID = "id";


  static const String TABLE_BETS = "bets";

  static const String COL_GAME_ID = "game_id";
  static const String COL_GAME_TYPE = "game_type";
  static const String COL_OWNER = "owner";
  static const String COL_BET_AMOUNT = "bet_amount";
  static const String COL_TRANSACTION_AMOUNT = "transaction_amount";
  static const String COL_CURRENCY_ID = "currency_id";
  static const String COL_STATUS = "status";
  static const String COL_ROLLBACK = "rollback";
  static const String COL_REFUND = "refund";
  static const String COL_BONUS = "bonus";
  static const String COL_JACKPOT = "jackpot";
  static const String COL_BUYIN = "buyin";
  static const String COL_BUYOUT = "buyout";
  static const String COL_PUSHBET = "pushbet";
  static const String COL_TRANSACTION_ID = "transaction_id";
  static const String COL_WAGER_ID = "wager_id";
  static const String COL_PAYOUT_AMOUNT = "payout_amount";
  static const String COL_CREATION_DATE = "creation_date";

  factory DbHelper(){
    if(helper == null){
      helper = DbHelper._createInstance();
    }
    return helper;
  }

  Future<Database> get database async {
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    final db_path = await getDatabasesPath();
    final path = join(db_path, db_name);
    return await openDatabase(path, version: 1, onCreate: createDb);
  }

  Future createDb(Database db, int version) async {

    String create_bet_table = "create table ${TABLE_BETS} ("
        "$COL_ID integer primary key,"
        "$COL_GAME_ID varchar(100),"
        "$COL_GAME_TYPE varchar(10),"
        "$COL_OWNER varchar(200),"
        "$COL_BET_AMOUNT varchar(10),"
        "$COL_TRANSACTION_AMOUNT varchar(10),"
        "$COL_CURRENCY_ID varchar(10),"
        "$COL_STATUS varchar(100),"
        "$COL_ROLLBACK varchar(10),"
        "$COL_REFUND varchar(10),"
        "$COL_BONUS varchar(10),"
        "$COL_JACKPOT varchar(10),"
        "$COL_BUYIN varchar(10),"
        "$COL_BUYOUT varchar(10),"
        "$COL_PUSHBET varchar(10),"
        "$COL_TRANSACTION_ID varchar(100),"
        "$COL_WAGER_ID varchar(100),"
        "$COL_PAYOUT_AMOUNT varchar(100),"
        "$COL_CREATION_DATE varchar(100)"
        ")";

    String create_user_table = "create table ${TABLE_USERS} ("
        "$COL_ID integer primary key,"
        "$COL_USER_ID varchar(200),"
        "$COL_USERNAME varchar(200),"
        "$COL_EMAIL varchar(100),"
        "$COL_PASSWORD varchar(100),"
        "$COL_FIRSTNAME varchar(200),"
        "$COL_LASTNAME varchar(200),"
        "$COL_DOB varchar(100),"
        "$COL_DATE_JOINED varchar(100),"
        "$COL_BALANCE varchar(20),"
        "$COL_WALLET text,"
        "$COL_CURRENCY varchar(100)"
        ")";

    await db.execute(create_user_table);
    await db.execute(create_bet_table);
  }

  Future<void> saveBet (Bet bet) async {
    Database db = await database;
    String query = "insert into $TABLE_BETS ("
        "$COL_GAME_ID, $COL_GAME_TYPE, $COL_OWNER, $COL_BET_AMOUNT, $COL_TRANSACTION_ID,"
        "$COL_BONUS, $COL_BUYIN, $COL_BUYOUT, $COL_CREATION_DATE, $COL_CURRENCY_ID, "
        "$COL_JACKPOT, $COL_PAYOUT_AMOUNT, $COL_PUSHBET, $COL_REFUND, $COL_ROLLBACK, "
        "$COL_STATUS, $COL_WAGER_ID) values (${bet.game_id}, ${bet.game_type}, ${bet.owner},"
        "${bet.bet_amount}, ${bet.transaction_id}, ${bet.bonus}, ${bet.buyin}, ${bet.buyout}, "
        "${bet.creation_date}, ${bet.currency_id}, ${bet.jackpot}, ${bet.payout_amount}, "
        "${bet.pushbet}, ${bet.refund}, ${bet.rollback}, ${bet.status}, ${bet.wager_id})";
    await db.execute(query);
  }

  Future<List<Bet>> getBets () async {
    Database db = await database;
    String query = "select * from $TABLE_BETS";
    List<Bet> list = [];
    List<Map<String, Object>> result = await db.rawQuery(query);
    for (var i = 0; i < result.length; i++) {
      list.add(
        Bet(
          game_id: result[i][COL_GAME_ID],
          game_type: result[i][COL_GAME_TYPE],
          owner: result[i][COL_OWNER],
          bet_amount: result[i][COL_BET_AMOUNT],
          transaction_id: result[i][COL_TRANSACTION_ID],
          currency_id: result[i][COL_CURRENCY_ID],
          status: result[i][COL_STATUS],
          rollback: result[i][COL_ROLLBACK],
          refund: result[i][COL_REFUND],
          bonus: result[i][COL_BONUS],
          jackpot: result[i][COL_JACKPOT],
          buyin: result[i][COL_BUYIN],
          buyout: result[i][COL_BUYOUT],
          pushbet: result[i][COL_PUSHBET],
          wager_id: result[i][COL_WAGER_ID],
          payout_amount: result[i][COL_PAYOUT_AMOUNT],
          creation_date: result[i][COL_CREATION_DATE]
        )
      );
    }
    return list;
  }

  Future<Bet> getBetByWager (String wager_id) async {
    Bet bet;
    Database db = await database;
    String query = "select * from $TABLE_BETS where $COL_WAGER_ID = $wager_id";
    List<Map<String, Object>> result = await db.rawQuery(query);
    bet = Bet(
      game_id: result[0][COL_GAME_ID],
      game_type: result[0][COL_GAME_TYPE],
      owner: result[0][COL_OWNER],
      bet_amount: result[0][COL_BET_AMOUNT],
      transaction_id: result[0][COL_TRANSACTION_ID],
      currency_id: result[0][COL_CURRENCY_ID],
      status: result[0][COL_STATUS],
      rollback: result[0][COL_ROLLBACK],
      refund: result[0][COL_REFUND],
      bonus: result[0][COL_BONUS],
      jackpot: result[0][COL_JACKPOT],
      buyin: result[0][COL_BUYIN],
      buyout: result[0][COL_BUYOUT],
      pushbet: result[0][COL_PUSHBET],
      wager_id: result[0][COL_WAGER_ID],
      payout_amount: result[0][COL_PAYOUT_AMOUNT],
      creation_date: result[0][COL_CREATION_DATE]
    );
    return bet;
  }

  Future<Bet> getBetByTransaction (String transaction_id) async {
    Bet bet;
    Database db = await database;
    String query = "select * from $TABLE_BETS where $COL_TRANSACTION_ID = $transaction_id";
    List<Map<String, Object>> result = await db.rawQuery(query);
    bet = Bet(
        game_id: result[0][COL_GAME_ID],
        game_type: result[0][COL_GAME_TYPE],
        owner: result[0][COL_OWNER],
        bet_amount: result[0][COL_BET_AMOUNT],
        transaction_id: result[0][COL_TRANSACTION_ID],
        currency_id: result[0][COL_CURRENCY_ID],
        status: result[0][COL_STATUS],
        rollback: result[0][COL_ROLLBACK],
        refund: result[0][COL_REFUND],
        bonus: result[0][COL_BONUS],
        jackpot: result[0][COL_JACKPOT],
        buyin: result[0][COL_BUYIN],
        buyout: result[0][COL_BUYOUT],
        pushbet: result[0][COL_PUSHBET],
        wager_id: result[0][COL_WAGER_ID],
        payout_amount: result[0][COL_PAYOUT_AMOUNT],
        creation_date: result[0][COL_CREATION_DATE]
    );
    return bet;
  }

  Future<void> saveUser (AppUser user) async {
    Database db = await database;
    String query = "insert into $TABLE_USERS ("
        "$COL_USER_ID, $COL_USERNAME, $COL_EMAIL, $COL_PASSWORD, $COL_FIRSTNAME,"
        "$COL_LASTNAME, $COL_DOB, $COL_DATE_JOINED, $COL_BALANCE, $COL_WALLET, "
        "$COL_CURRENCY) values (${user.user_id}, ${user.username}, ${user.email},"
        "${user.password}, ${user.firstname}, ${user.lastname}, ${user.dob},"
        "${user.date_joined}, ${user.balance}, ${user.wallet}, ${user.currency})";
    await db.execute(query);
  }

  Future<AppUser> getUser () async {
    AppUser user;
    Database db = await database;
    String query = "select * from $TABLE_USERS";
    List<Map<String, Object>> result = await db.rawQuery(query);
    for(var i = 0; i<result.length; i++){
      user = AppUser(
        user_id: result[i][COL_USER_ID],
        username: result[i][COL_USERNAME],
        date_joined: result[i][COL_DATE_JOINED],
        email: result[i][COL_EMAIL],
        password: result[i][COL_PASSWORD],
        firstname: result[i][COL_FIRSTNAME],
        lastname: result[i][COL_LASTNAME],
        dob: result[i][COL_DOB],
        balance: result[i][COL_BALANCE],
        wallet: result[i][COL_WALLET],
        currency: result[i][COL_CURRENCY]
      );
    }
    return user;
  }


}