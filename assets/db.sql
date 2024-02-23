create table camgirln_blitzwin.users (
    id integer primary key auto_increment,
    user_id varchar(200) default '',
    username varchar(200) default '',
    email varchar(100) default '',
    password varchar(100) default '',
    firstname varchar(200) default '',
    lastname varchar(200) default '',
    dob varchar(100) default '',
    date_joined varchar(20) default,
    balance varchar(20) default '',
    wallet text default '',
    currency varchar(100) default ''
);

create table camgirln_blitzwin.bets (
    id integer primary key auto_increment,
    game_id varchar(100) default '',
    game_type varchar(10) default '',
    owner varchar(200) default '',
    bet_amount varchar(10) default '',
    transaction_amount varchar(10) default '',
    currency_id varchar(10) default '',
    status varchar(100) default '',
    rollback varchar(10) default '',
    refund varchar(10) default '',
    bonus varchar(10) default '',
    jackpot varchar(10) default '',
    buyin varchar(10) default '',
    buyout varchar(10) default '',
    pushbet varchar(10) default '',
    transaction_id varchar(100) default '',
    wager_id varchar(100) default '',
    payout_amount varchar(100) default '',
    creation_date varchar(100) default ''
);