desc 'Run basic requests to local SOAP service with Savon'
task :savon => :environment do
  client = Savon::Client.new("http://localhost:3000/rumbas/wsdl")

  begin
    puts
    puts "Available actions:".bold.underline
    puts client.wsdl.soap_actions.inspect.yellow
    puts

    puts "Running concat('123', 'abc')".bold.underline
    result = client.request(:concat) do
      soap.body = { :a => "123", :b => "abc" }
    end
    puts "Answer: #{result.to_hash.inspect}".yellow
    puts

    puts "Running emptiness({a: ''})".bold.underline
    result = client.request(:emptiness) do
      soap.body = { :a => '' }
    end
    puts "Answer: #{result.to_hash.inspect}".yellow
    puts

    puts "Running addCircle({circle: center{x: 20, y: 20}, radius: 2})"
    begin
      result = client.request(:add_circle) do
        soap.body = { :circle => {:center => {:x => 20, :y => 20}, :radius => 2 } }
      end
      puts "Answer: #{result.to_hash.inspect}".yellow
    rescue Savon::SOAP::Fault => error
      puts "Exception caught: #{error.inspect}".yellow
    end
    puts

    puts "Running addCircle({circle: center{x: 20, y: 20}, radius: 5})"
    begin
      result = client.request(:add_circle) do
        soap.body = { :circle => {:center => {:x => 20, :y => 20}, :radius => 5 } }
      end
      puts "Answer: #{result.to_hash.inspect}".yellow
    rescue Savon::SOAP::Fault => error
      puts "Exception caught: #{error.inspect}".yellow
    end
    puts
  rescue
    puts "Something went wrong. Are you sure Rails are started on 3000 port?".red.bold
  end

  puts "Running bools_to_integers({:value => [true,false,true]})"
  begin
    result = client.request(:bools_to_integers) do
      soap.body = { :value => [true, false, true] }
    end
    puts "Answer: #{result.to_hash.inspect}".yellow
  rescue Savon::SOAP::Fault => error
    puts "Exception caught: #{error.inspect}".yellow
  end

  puts "Running complex_return()"
  begin
    result = client.request(:complex_return)
    puts "Answer: #{result.to_hash.inspect}".yellow
  rescue Savon::SOAP::Fault => error
    puts "Exception caught: #{error.inspect}".yellow
  end
end