<?php

class Person {
    private $name;
    private $age;
    
    public function __construct(string $name, int $age) {
        $this->name = $name;
        $this->age = $age;
    }
    
    public function getName(): string {
        return $this->name;
    }
    
    public function getAge(): int {
        return $this->age;
    }
}

function calculateSum(int $a, int $b): int {
    return $a + $b;
}

function isPositive(int $number): bool {
    if ($number > 0) {
        return true;
    } else {
        return false;
    }
}

function printNumbers(int $start, int $end): void {
    for ($i = $start; $i <= $end; $i++) {
        echo $i . " ";
    }
    echo "\n";
}

function getAverage(array $numbers): float {
    $sum = 0;
    $count = count($numbers);
    
    for ($i = 0; $i < $count; $i++) {
        $sum += $numbers[$i];
    }
    
    return $sum / $count;
}

function factorial(int $number): int {
    if ($number <= 1) {
        return 1;
    }
    
    return $number * factorial($number - 1);
}

function divideNumbers(int $dividend, int $divisor): float {
    if ($divisor === 0) {
        throw new Exception("Divisor cannot be zero.");
    }
    
    return $dividend / $divisor;
}

function sanitizeInput(string $input): string {
    return htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
}

function getUserData(PDO $pdo, string $username): array {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$username]);
    
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

session_start();
$_SESSION['username'] = 'john.doe';

echo calculateSum(5, 10) . "\n";
echo isPositive(7) . "\n";
printNumbers(1, 5);
echo getAverage([1, 2, 3, 4, 5]) . "\n";
echo factorial(5) . "\n";

$person = new Person("John Doe", 30);
echo $person->getName() . "\n";
echo $person->getAge() . "\n";

try {
    echo divideNumbers(10, 2) . "\n";
    echo divideNumbers(10, 0) . "\n";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}

$input = "<script>alert('XSS');</script>";
echo sanitizeInput($input) . "\n";

$pdo = new PDO("mysql:host=localhost;dbname=mydb", "username", "password");
$userData = getUserData($pdo, "john.doe");
print_r($userData);

echo $_SESSION['username'];

function getSafeInput($key, $default = '') {
    return isset($_GET[$key]) ? htmlspecialchars($_GET[$key]) : $default;
}

$password = "password123";
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

$name = "John";
$age = 30;
$safeString = sprintf("Name: %s, Age: %d", $name, $age);

function validateEmail(string $email): bool {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

function readFileContent(string $filename): string {
    $content = file_get_contents($filename);
    
    if ($content === false) {
        throw new Exception("Failed to read file.");
    }
    
    return $content;
}

$expiry = time() + (30 * 24 * 60 * 60); // Cookie expires in 30 days
setcookie("username", "john.doe", $expiry, "/", "example.com", true, true);

$userId = $_SESSION['user_id'];
$query = "SELECT * FROM users WHERE id = " . intval($userId);

$ipAddress = $_SERVER['REMOTE_ADDR'];
if (filter_var($ipAddress, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) === false) {
    die("Invalid IP address.");
}

$filename = "file.txt";
if (!file_exists($filename) || !is_readable($filename)) {
    die("File does not exist or is not readable.");
}

$baseUrl = "https://example.com";
$productId = 123;
$productUrl = sprintf("%s/products/%d", $baseUrl, $productId);

ini_set("display_errors", "Off");
error_reporting(0);

function isStrongPassword(string $password): bool {
    return strlen($password) >= 8;
}

$ch = curl_init("https://example.com");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
$response = curl_exec($ch);

$command = "ls -l";
$escapedCommand = escapeshellcmd($command);
$output = shell_exec($escapedCommand);

$value1 = 10;
$value2 = "10";
if ($value1 === $value2) {
    echo "Equal";
} else {
    echo "Not equal";
}

$requestMethod = $_SERVER['REQUEST_METHOD'];
if ($requestMethod !== "GET" && $requestMethod !== "POST") {
    die("Invalid request method.");
}

$filename = "file.txt";
$fileExtension = pathinfo($filename, PATHINFO_EXTENSION);
$allowedExtensions = ["jpg", "png", "gif"];
if (!in_array($fileExtension, $allowedExtensions)) {
    die("Invalid file extension.");
}

$pdo->beginTransaction();
$pdo->exec("LOCK TABLES table1 WRITE, table2 WRITE");
$pdo->exec("UNLOCK TABLES");
$pdo->commit();

session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => 'example.com',
    'secure' => true,
    'httponly' => true,
    'samesite' => 'Strict'
]);
session_start();

$username = $_POST['username'];
$password = $_POST['password'];
$stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
$stmt->execute([$username, $password]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

/* Make sure to replace "localhost", "mydb", "username", and "password" in the PDO connection section 
according to the database settings you are using.
*/
?>