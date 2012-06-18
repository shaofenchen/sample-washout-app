require 'nori'
class FixSoapActionHeaderMiddleware
  def initialize(app)
    @app = app
  end

    def call(env)

      if env.has_key?('HTTP_SOAPACTION')  
		if env["HTTP_SOAPACTION"].empty? || env["HTTP_SOAPACTION"] == %Q("")
			puts "+++++++++++++++++++++"
			puts "The HTTP_SOAPACTION is empty" 
			_Envelop = env["action_dispatch.request.request_parameters"]
			_Envelop = _Envelop["Envelope"]["Body"]
			if _Envelop.keys.length > 1
				_action = _Envelop.keys[1]
				env["HTTP_SOAPACTION"] = _action.dup
			end
			puts _Envelop.keys
		end
		
		if env["HTTP_SOAPACTION"].include?('http://developer.intuit.com')
			puts "+++++++++++++++++++++"
			puts "The HTTP_SOAPACTION has the format http://developer.intuit.com/xxxxx"
			env["HTTP_SOAPACTION"] = env["HTTP_SOAPACTION"].split('/').last.delete '"'
		end
      end
	  
	  
	  
      @app.call(env)
   
   end
end