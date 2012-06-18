desc 'Run basic requests to local SOAP service with PHP'
task :php do
  puts `php lib/tasks/php/soap.php`
end