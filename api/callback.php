<?php
    
    include 'connection.php';

    $request_uri = $_SERVER['REQUEST_URI'];
    
    header('Content-Type: application/json');
    
    $script_name = $_SERVER['SCRIPT_NAME'];
    $request_uri = str_replace($script_name, '', $request_uri);
    
    $SECRET_KEY = "Sfh4Oj";
    
    $request_uri = trim($request_uri, '/');
    
    $uri_parts = explode('/', $request_uri);
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $jsonData = file_get_contents("php://input");
        
        $requestParameters = json_decode($jsonData, true);
    
        if ($requestParameters !== null) {
            $memberName = $requestParameters['MemberName'];
            $operatorCode = $requestParameters['OperatorCode'];
            $productID = $requestParameters['ProductID'];
            $messageID = $requestParameters['MessageID'];
            $sign = $requestParameters['Sign'];
            $requestTime = $requestParameters['RequestTime'];
            
            $balance = getBalanceDB($memberName, $conn);
            
            if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'GetBalance') {
                $check = checkSignature($operatorCode, $requestTime, "getbalance", $sign, $SECRET_KEY);
                if ($check) {
                    getBalance($memberName, false, 0, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'MobileLogin') {
                $check = checkSignature($operatorCode, $requestTime, "mobilelogin", $sign, $SECRET_KEY);
                if ($check) {
                    $password = $requestParameters['Password'];
                    login($memberName, $password, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'PushBet') {
                $check = checkSignature($operatorCode, $requestTime, "pushbet", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transactions'];
                    $transaction_amount = $requestParameters['Transactions'][0]['TransactionAmount'];
                    $transaction_id = $requestParameters['Transactions'][0]['TransactionID'];
                    $wager_id = $requestParameters['Transactions'][0]['WagerID'];
                    pushbet($memberName, $transaction_id, $wager_id, $transaction_amount, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'BuyOut') {
                $check = checkSignature($operatorCode, $requestTime, "buyout", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transaction'];
                    $transaction_amount = $requestParameters['Transaction']['TransactionAmount'];
                    $transaction_id = $requestParameters['Transaction']['TransactionID'];
                    $wager_id = $requestParameters['Transaction']['WagerID'];
                    buyin($memberName, $transaction_id, $wager_id, $transaction_amount, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'BuyIn') {
                $check = checkSignature($operatorCode, $requestTime, "buyin", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transaction'];
                    $transaction_amount = $requestParameters['Transaction']['TransactionAmount'];
                    $transaction_id = $requestParameters['Transaction']['TransactionID'];
                    $wager_id = $requestParameters['Transaction']['WagerID'];
                    buyin($memberName, $transaction_id, $wager_id, $transaction_amount, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'Jackpot') {
                $check = checkSignature($operatorCode, $requestTime, "jackpot", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transactions'];
                    $transaction_amount = $requestParameters['Transactions'][0]['TransactionAmount'];
                    $transaction_id = $requestParameters['Transactions'][0]['TransactionID'];
                    $wager_id = $requestParameters['Transactions'][0]['WagerID'];
                    jackpot($memberName, $transaction_id, $wager_id, $transaction_amount, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'Bonus') {
                $check = checkSignature($operatorCode, $requestTime, "bonus", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transactions'];
                    $transaction_amount = $requestParameters['Transactions'][0]['TransactionAmount'];
                    $transaction_id = $requestParameters['Transactions'][0]['TransactionID'];
                    $wager_id = $requestParameters['Transactions'][0]['WagerID'];
                    addBonus($memberName, $transaction_id, $wager_id, $transaction_amount, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'CancelBet') {
                $check = checkSignature($operatorCode, $requestTime, "cancelbet", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transactions'];
                    $transaction_amount = $requestParameters['Transactions'][0]['TransactionAmount'];
                    $transaction_id = $requestParameters['Transactions'][0]['TransactionID'];
                    $wager_id = $requestParameters['Transactions'][0]['WagerID'];
                    
                    cancelBet($memberName, $wager_id, $transaction_id, $transaction_amount, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'Rollback') {
                $check = checkSignature($operatorCode, $requestTime, "rollback", $sign, $SECRET_KEY);
                if ($check) {
                    
                    $transactions = $requestParameters['Transactions'];
                    $transaction_amount = $requestParameters['Transactions'][0]['TransactionAmount'];
                    $transaction_id = $requestParameters['Transactions'][0]['TransactionID'];
                    $wager_id = $requestParameters['Transactions'][0]['WagerID'];
                    
                    rollback($memberName, $transaction_amount, $wager_id, $conn);
                    
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'GameResult') {
                $check = checkSignature($operatorCode, $requestTime, "gameresult", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transactions'];
                    $status = $requestParameters['Transactions'][0]['Status'];
                    $game_id = $requestParameters['Transactions'][0]['GameID'];
                    $payout_amount = $requestParameters['Transactions'][0]['PayoutAmount'];
                    $jackpot_amount = $requestParameters['Transactions'][0]['JackpotAmount'];
                    $commission_amount = $requestParameters['Transactions'][0]['CommissionAmount'];
                    $transaction_id = $requestParameters['Transactions'][0]['TransactionID'];
                    $wager_id = $requestParameters['Transactions'][0]['WagerID'];
                    
                    
                    $total = $payout_amount + $jackpot_amount + $commission_amount;
                    
                    gameResult($memberName, $game_id, $transaction_id, $wager_id, $status, $total, $conn);
                }
            }
            else if (count($uri_parts) > 1 && $uri_parts[0] === 'Seamless' && $uri_parts[1] === 'PlaceBet') {
                $check = checkSignature($operatorCode, $requestTime, "placebet", $sign, $SECRET_KEY);
                if ($check) {
                    $transactions = $requestParameters['Transactions'];
                    $bet_amount = $requestParameters['Transactions'][0]['BetAmount'];
                    if (intval($bet_amount) > $balance) {
                        $responseArray = array(
                            "ErrorCode" => 1,
                            "ErrorMessage" => 'Insufficient balance'
                        );
                
                        $jsonResponse = json_encode($responseArray);
                        
                        echo $jsonResponse;
                    }
                    else {
                        placeBet($operatorCode, $memberName, $productID, $messageID, $sign, $requestTime, $transactions, $conn);
                    }
                }
            }
            else {
                checkSignature($operatorCode, $requestTime, strtolower($uri_parts[1]), $sign, $SECRET_KEY);
            }
        }
    }
    else {
        error_log("Invalid request method");
    }
    
    function pushbet($memberName, $transaction_id, $wager_id, $transaction_amount, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        
        
        
        $query = "select pushbet from bets where wager_id = '$wager_id'";
        $result = mysqli_query($conn, $query);
        
        if (mysqli_num_rows($result) > 0) {
            
            $row = mysqli_fetch_assoc($result);
            
            $pushbet = $row['pushbet'];
            
            if (pushbet == 'true') {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction"
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
        }
        else {
            updateBalance($balance + $transaction_amount, $memberName, $conn);
            $query = "insert into bets (pushbet, transaction_id) values ('true', '$transaction_id')";
            $result = mysqli_query($conn, $query);
            error_log("query: ".$query);
            $responseArray = array(
                "ErrorCode" => 0,
                "ErrorMessage" => "Success",
                "Balance" => $balance,
                "BeforeBalance" => 0
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
    }
    
    function buyout($memberName, $transaction_id, $wager_id, $transaction_amount, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        
        
        
        $query = "select buyout from bets where transaction_id = '$transaction_id'";
        $result = mysqli_query($conn, $query);
        
        if (mysqli_num_rows($result) > 0) {
            
            $row = mysqli_fetch_assoc($result);
            
            $buyout = $row['buyout'];
            
            if ($buyout == 'true') {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction"
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
        }
        else {
            updateBalance($balance + $transaction_amount, $memberName, $conn);
            $query = "insert into bets (buyout, transaction_id) values ('true', '$transaction_id')";
            $result = mysqli_query($conn, $query);
            $responseArray = array(
                "ErrorCode" => 0,
                "ErrorMessage" => "Success",
                "Balance" => $balance + $transaction_amount,
                "BeforeBalance" => $balance
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
    }
    
    function buyin($memberName, $transaction_id, $wager_id, $transaction_amount, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        
        
        
        $query = "select buyin from bets where transaction_id = '$transaction_id'";
        $result = mysqli_query($conn, $query);
        if (($balance * -1) > $transaction_amount) {
            $responseArray = array(
                "ErrorCode" => 1,
                "ErrorMessage" => "Insufficient fund"
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
        else if (mysqli_num_rows($result) > 0) {
            
            $row = mysqli_fetch_assoc($result);
            
            $buyin = $row['buyin'];
            
            if ($buyin == 'true') {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction"
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
        }
        else {
            updateBalance($balance + $transaction_amount, $memberName, $conn);
            $query = "insert into bets (buyin, transaction_id) values ('true', '$transaction_id')";
            $result = mysqli_query($conn, $query);
            $responseArray = array(
                "ErrorCode" => 0,
                "ErrorMessage" => "Success",
                "Balance" => $balance + $transaction_amount,
                "BeforeBalance" => $balance
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
    }
    
    function login($memberName, $password, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        $query = "select * from users where password = '$password' and username = '$memberName'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) > 0) {
            $responseArray = array(
                "ErrorCode" => 0,
                "ErrorMessage" => "Success",
                "Balance" => $balance,
                "BeforeBalance" => $balance
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
        else {
            $responseArray = array(
                "ErrorCode" => 1,
                "ErrorMessage" => "Member Login Failed"
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
    }
    
    function jackpot($memberName, $transaction_id, $wager_id, $transaction_amount, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        updateBalance($balance + $transaction_amount, $memberName, $conn);
        
        
        $query = "select jackpot from bets where wager_id = '$wager_id'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) > 0) {
            
            $row = mysqli_fetch_assoc($result);
            
            $jackpot = $row['jackpot'];
            
            if ($jackpot == 'true') {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction"
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
        }
        else {
            $query = "insert into bets (jackpot, wager_id) values ('true', '$wager_id')";
            $result = mysqli_query($conn, $query);
            $responseArray = array(
                "ErrorCode" => 0,
                "ErrorMessage" => "Success",
                "Balance" => $balance + $transaction_amount,
                "BeforeBalance" => $balance
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
    }
    
    function addBonus($memberName, $transaction_id, $wager_id, $transaction_amount, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        updateBalance($balance + $transaction_amount, $memberName, $conn);
        
        
        $query = "select bonus from bets where wager_id = '$wager_id'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) > 0) {
            
            $row = mysqli_fetch_assoc($result);
            
            $bonus = $row['bonus'];
            
            if ($bonus == 'true') {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction"
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
        }
        else {
            
            $query = "insert into bets (bonus, wager_id) values ('true', '$wager_id')";
            
            $result = mysqli_query($conn, $query);
            
            error_log("query: ".$query);
            $responseArray = array(
                "ErrorCode" => 0,
                "ErrorMessage" => "Success",
                "Balance" => $balance + $transaction_amount,
                "BeforeBalance" => $balance
            );
        
            $jsonResponse = json_encode($responseArray);
            
            echo $jsonResponse;
        }
    }
    
    function cancelBet($memberName, $wager_id, $transaction_id, $transaction_amount, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        if ($wager_id != '') {
            $query = "select refund from bets where wager_id = '$wager_id'";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) > 0) {
                
                $row = mysqli_fetch_assoc($result);
                
                $refund = $row['refund'];
                
                if ($refund == 'true') {
                    $responseArray = array(
                        "ErrorCode" => 1,
                        "ErrorMessage" => "Duplicate Transaction"
                    );
                
                    $jsonResponse = json_encode($responseArray);
                    
                    echo $jsonResponse;
                }
                else {
                    
                    $query = "update bets set refund = 'true' where wager_id = '$wager_id'";
                    $result = mysqli_query($conn, $query);
                    
                    $responseArray = array(
                        "ErrorCode" => 0,
                        "ErrorMessage" => "Success",
                        "Balance" => $balance + $transaction_amount,
                        "BeforeBalance" => $balance
                    );
                
                    $jsonResponse = json_encode($responseArray);
                    
                    echo $jsonResponse;
                }
                
            }
        }
        else {
            $query = "select refund from bets where transaction_id = '$transaction_id'";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) > 0) {
                
                $row = mysqli_fetch_assoc($result);
                
                $refund = $row['refund'];
                
                if ($refund == 'true') {
                    $responseArray = array(
                        "ErrorCode" => 1,
                        "ErrorMessage" => "Duplicate Transaction"
                    );
                
                    $jsonResponse = json_encode($responseArray);
                    
                    echo $jsonResponse;
                }
                else {
                    
                    $query = "update bets set refund = 'true' where transaction_id = '$transaction_id'";
                    $result = mysqli_query($conn, $query);
                    
                    $responseArray = array(
                        "ErrorCode" => 0,
                        "ErrorMessage" => "Success",
                        "Balance" => $balance + $transaction_amount,
                        "BeforeBalance" => $balance
                    );
                
                    $jsonResponse = json_encode($responseArray);
                    
                    echo $jsonResponse;
                }
                
            }
        }
    }
    
    function rollback ($memberName, $transaction_amount, $wager_id, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        
        $query = "select rollback from bets where wager_id = '$wager_id'";
        
        $result = mysqli_query($conn, $query);
        
        if (mysqli_num_rows($result) > 0) {
                
            $row = mysqli_fetch_assoc($result);
            
            $rollback = $row['rollback'];
            
            if ($rollback == 'true') {
                
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction"
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
            else {
                updateBalance($balance + $transaction_amount, $memberName, $conn);
                $query = "update bets set rollback = 'true' where wager_id = '$wager_id'";
                mysqli_query($conn, $query);
                $responseArray = array(
                    "ErrorCode" => 0,
                    "ErrorMessage" => "Success",
                    "Balance" => $balance + $transaction_amount,
                    "BeforeBalance" => $balance
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
                
            }
            
        }
    }
    
    function gameResult($memberName, $game_id, $transaction_id, $wager_id, $status, $payout, $conn) {
        $balance = getBalanceDB($memberName, $conn);
        $total = $balance + $payout;
        $query = "select status, rollback from bets where wager_id = '$wager_id'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) > 0) {
                
            $row = mysqli_fetch_assoc($result);
            
            $s = $row['status'];
            $r = $row['rollback'];
            
            if ($r == 'true') {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Failed To Resettle",
                    "Balance" => $balance,
                    "BeforeBalance" => $balance + $payout
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
            else if ($s == 101) {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => "Duplicate Transaction",
                    "Balance" => $balance,
                    "BeforeBalance" => $balance
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
            else {
                $query = "update bets set status = '$status' where wager_id = '$wager_id'";
                mysqli_query($conn, $query);
                $query = "update users set balance = '$total' where username = '$memberName'";
                mysqli_query($conn, $query);
                
                $responseArray = array(
                    "ErrorCode" => 0,
                    "ErrorMessage" => "Success",
                    "Balance" => $total,
                    "BeforeBalance" => $balance
                );
            
                $jsonResponse = json_encode($responseArray);
                
                echo $jsonResponse;
            }
            
        }
        else {
            $responseArray = array(
                "ErrorCode" => 1,
                "ErrorMessage" => 'Bet does not exist'
            );
    
            $jsonResponse = json_encode($responseArray);
            
            
            echo $jsonResponse;
        }
        
        
    }
    
    
    function checkSignature ($operatorCode, $requestTime, $methodName, $sign, $SECRET_KEY) {
        if ($_SERVER['REQUEST_METHOD'] === 'POST'){
            $signature = md5($operatorCode.$requestTime.$methodName.$SECRET_KEY);
            if ($signature !== $sign) {
                $responseArray = array(
                    "ErrorCode" => 1,
                    "ErrorMessage" => 'Invalid signature'
                );
        
                $jsonResponse = json_encode($responseArray);
                
                
                echo $jsonResponse;
                return false;
            }
            return true;
        }
        return false;
    }
    
    
    function placeBet ($operatorCode, $memberName, $productID, $messageID, $sign, $requestTime, $transactions, $conn) {
        
        $before_balance = getBalanceDB($memberName, $conn);
        
        foreach ($transactions as $json) {
            $transaction_id = $json['TransactionID'];
            $bet_amount = $json['BetAmount'];
            $transaction_amount = $json['TransactionAmount'];
            $game_id = $json["GameID"];
            $game_type = $json["GameType"];
            $currency_id = $json["CurrencyID"];
            $status = $json["Status"];
            $creation_date = $json["CreatedOn"];
            $payout_amount = $json["PayoutAmount"];
            $wager_id = $json["WagerID"];
            
            $check_transaction = "select * from bets where transaction_id = '$transaction_id'";
            
            $result = mysqli_query($conn, $check_transaction);
            
            if ($result) {
                
                if (mysqli_num_rows($result) > 0) {
                    $responseArray = array(
                        "ErrorCode" => 1,
                        "ErrorMessage" => "Duplicate transaction",
                    );
                    
                    $jsonResponse = json_encode($responseArray);
                    
            
                    echo $jsonResponse;
                }
                else {
                    $query = "insert into bets (transaction_id, owner, bet_amount, transaction_amount, game_id, game_type, currency_id, status, creation_date, payout_amount, wager_id) values ('$transaction_id', 
                    '$memberName', '$bet_amount', '$transaction_amount', '$game_id', '$game_type', '$currency_id', '$status', '$creation_date', '$payout_amount', '$wager_id')";
                    
                    $result = mysqli_query($conn, $query);
                    getBalance($memberName, true, $transaction_amount, $conn);
                }
            } 
            else {
                error_log("Error executing query: " . mysqli_error($conn));
            }
        }
    }
    
    function updateBalance ($balance, $member, $conn) {
        $query = "update users set balance = '$balance' where username = '$member'";
        mysqli_query($conn, $query);
    }
    
    function getBalanceDB ($memberName, $conn) {
        $query = "select balance from users where username = '$memberName'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) > 0) {
                
            $row = mysqli_fetch_assoc($result);
            
            $balance = $row['balance'];
            
            return $balance;
        }
        return 0;
    }
    
    function getBalance ($memberName, $placing_bet, $transaction_amount, $conn) {
        $query = "select balance from users where username = '$memberName'";
        $result = mysqli_query($conn, $query);
        
        if ($result) {
                
            if (mysqli_num_rows($result) > 0) {
                
                $row = mysqli_fetch_assoc($result);
                
                $balance = $row['balance'];
                
                if ($placing_bet) {
                    $responseArray = array(
                        "ErrorCode" => 0,
                        "ErrorMessage" => "Success",
                        "Balance" => $balance + $transaction_amount,
                        "BeforeBalance" => $balance
                    );
                
                    $jsonResponse = json_encode($responseArray);
                    
                    echo $jsonResponse;
                    
                    updateBalance($balance + $transaction_amount, $memberName, $conn);
                    
                }
                else {
                    $responseArray = array(
                        "ErrorCode" => 0,
                        "ErrorMessage" => "Success",
                        "Balance" => $balance,
                        "BeforeBalance" => $balance
                    );
                
                    $jsonResponse = json_encode($responseArray);
                    
                    echo $jsonResponse;
                }
                
            }
        }
        
        return 0;
        
    }
?>












