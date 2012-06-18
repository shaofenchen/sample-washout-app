<?php

function output($str='') 
{
 echo $str."\n";
}

$client = new soapclient("http://localhost:3000/rumbas/wsdl", array("cache_wsdl" => WSDL_CACHE_NONE));

output();
output("Available actions:");
var_export($client->__getFunctions());
output();
output();

$result = $client->concat("123", "abc");
output("Running concat('123', 'abc')");
var_export($result);
output();
output();

$result = $client->emptiness("");
output("Running emptiness({a: ''})");
var_export($result);
output();
output();

$result = $client->complex_return();
output("Running complex_return()");
var_export($result);
output();
output();

?>
