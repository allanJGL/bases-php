<?php

$requestedPage = '/';

if (isset($_SERVER['REQUEST_URI'])) {
    $requestedPage = $_SERVER['REQUEST_URI'];
    $requestedPage = explode('?', $requestedPage);
}

switch ($requestedPage[0]) {
    case '/' :
        include_once(__DIR__ . '/src/controller/frontController.php');
        break;
}

?>