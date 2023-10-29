<?php
$server = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');
$db = getenv('DB_NAME');
function checkDataBaseConnection($server, $user, $pass, $db)
{
    $conn = mysqli_connect($server, $user, $pass, $db);
    if (!$conn) {
        return FALSE;
    } else {
        //mysqli_close($conn); why would you close the connection?
        return $conn;
    }
}

if (checkDataBaseConnection($server, $user, $pass, $db))
   echo "Success!";
else
   echo "Fail.";
