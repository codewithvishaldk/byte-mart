<?php
// Database connection configuration
$serverName = "sql105.infinityfree.com"; // Correct MySQL Hostname
$dBUsername = "if0_38269202"; // Correct MySQL Username
$dBPassword = "Vishal6397"; // Correct MySQL Password
$dBName = "if0_38269202_shop"; // Correct Database Name

// Creating database connection
$conn = new mysqli($serverName, $dBUsername, $dBPassword, $dBName, 3306); // Specified MySQL Port

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
?>
