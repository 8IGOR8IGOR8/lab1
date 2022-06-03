<?php
$db = new PDO("mysql:host=127.0.0.1;dbname=network", "root", "");
require_once __DIR__ . "/migrations.php";
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lab 1</title>
</head>
<body>
<?php
if (isset($_POST["clients"])) {
    findProfiles($db, $_POST["clients"]);
} elseif (isset($_POST["start"])) {
    findStatistics($db, $_POST["start"], $_POST["stop"]);
} elseif (isset($db, $_POST["balance"])) {
    findBalances($db);
}
?>
<br>
<form action="" method="post">
    <select name="clients">
        <?php
        showClients($db);
        ?>
    </select>
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <label>Choose the time interval:</label>
    <input type="datetime-local" name="start">
    <input type="datetime-local" name="stop">
    <input type="submit" value="Enter"><br>
</form>
<br>
<form action="" method="post">
    <input type="submit" value="Check balance" name="balance"><br>
</form>
</body>
</html>
