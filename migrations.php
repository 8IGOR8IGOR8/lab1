<?php

function showClients(PDO $db)
{
    $statement = $db->query("SELECT DISTINCT `name` FROM clients");
    while ($data = $statement->fetch()) {
        echo "<option value='$data[0]'>$data[0]</option>";
    }
}

function findProfiles($db, $client)
{
    $statement = $db->prepare("SELECT `start`, stop, in_trafic, out_trafic FROM seanses inner join clients on FID_Client = ID_Client WHERE `name`=?");
    $statement->execute([$client]);
    echo "<table>";
    echo " <tr>
 <th> Start time  </th>
 <th> Stop time </th>
 <th> In Traffic </th>
 <th> Out Traffic </th>
</tr> ";
    while ($data = $statement->fetch()) {
        echo " <tr>
 <th> {$data['start']}  </th>
 <th> {$data['stop']} </th>
 <th> {$data['in_trafic']} </th>
 <th> {$data['out_trafic']} </th>
</tr> ";
    }
    echo "</table>";
}

function findStatistics(PDO $db, $start, $stop)
{
    $statement = $db->prepare("
SELECT `name`, `start`, stop, in_trafic, out_trafic 
FROM seanses inner join clients on FID_Client = ID_Client 
WHERE `start` BETWEEN :start_date AND :stop OR `stop` BETWEEN :start_date AND :stop
");
    $statement->execute(["start_date" => $start, "stop" => $stop]);
    echo "<table>";
    echo " <tr>
 <th> Name  </th>
 <th> Start time  </th>
 <th> Stop time </th>
 <th> In Traffic </th>
 <th> Out Traffic </th>
</tr> ";
    while ($data = $statement->fetch()) {
        echo " <tr>
 <th> {$data['name']}  </th>
 <th> {$data['start']}  </th>
 <th> {$data['stop']} </th>
 <th> {$data['in_trafic']} </th>
 <th> {$data['out_trafic']} </th>
</tr> ";
    }
    echo "</table>";
}

function findBalances($db)
{
    $statement = $db->prepare("SELECT `name`, login, password, IP, balance FROM clients WHERE balance < 0");
    $statement->execute();
    echo "<table>";
    echo " <tr>
 <th> Name  </th>
 <th> Login  </th>
 <th> Password </th>
 <th> IP </th>
 <th> Balance </th>
</tr> ";
    while ($data = $statement->fetch()) {
        echo " <tr>
 <th> {$data['name']}  </th>
 <th> {$data['login']}  </th>
 <th> {$data['password']} </th>
 <th> {$data['IP']} </th>
 <th> {$data['balance']} </th>
</tr> ";
    }
    echo "</table>";
}

