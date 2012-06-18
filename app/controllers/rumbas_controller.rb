require 'nokogiri'

class RumbasController < ApplicationController

  before_filter :set_soap_header
  include WashOut::SOAP
  
  soap_action "integer_to_string",
              :args   => :integer,
              :return => :string
  def integer_to_string
    render :soap => params[:value].to_s
  end

  soap_action "emptiness", :args => {:a => :string}, :return => {:a => :string}
  def emptiness
    render :soap => {:a => params[:a]}
  end
  
	soap_action "clientVersion", :args => {:version => :string}, :return => [:string]
  def clientVersion
	render :soap => {}
  end

  soap_action "authenticate", :args => {:strUserName  => :string, :strPassword  => :string}, :return => { "authenticateResult" => [{string: [:string]}]}
  def authenticate
	render :soap => { "authenticateResult" => [{string: ['abc111', 'none','120','120']}]}
  end

   soap_action "connectionError", :args => {:ticket  => :string, :hresult  => :string, :message  => :string}, :return => [:string]
  def connectionError
  end

     soap_action "sendRequestXML", :args => {:ticket  => :string, :hpc_response  => :string, :company_file_name  => :string, :country => :string, :qbxml_major_version => :int, :qbxml_minor_version => :int}, :return => :string
  def sendRequestXML
  end
  
  
  soap_action "receiveResponseXML", :args => {:ticket  => :string, :response  => :string, :hresult => :string}, :return => :int
  def receiveResponseXML
  end

  soap_action "getLastError", :args => {:ticket => :string}, :return => :string
  def getLastError
  end

  soap_action "closeConnection", :args => {:ticket => :string}, :return => :string
  def closeConnection
  end
  
  
  soap_action "concat",
              :args   => { :a => :string, :b => :string },
              :return => :string
  def concat
    render :soap => (params[:a] + params[:b])
  end

  soap_action "AddCircle",
              :args => {
                :circle => {
                  :center => {
                    :x => :integer,
                    :y => :integer
                  },
                  :radius => :double
                }
              },
              :return => nil,
              :to     => :add_circle
  def add_circle
    circle = params[:circle]

    raise SOAPError, "radius is too small" if circle[:radius] < 3.0

    Circle.new(circle[:center][:x], circle[:center][:y], circle[:radius])

    render :soap => nil
  end

  soap_action "bools_to_integers",
              :args => [:boolean],
              :return => [:integer]
  def bools_to_integers
    render :soap => params[:value].map{|x| x ? 1 : 0 }
  end

  soap_action "complex_return",
    :args   => nil,
    :return => {
      :rumbas => [{:zombies => :string, :puppies => :string}]
    }
  def complex_return
    render :soap =>
      {:rumbas => [
          {:zombies => "suck1", :puppies => "rock1" },
          {:zombies => "suck2", :puppies => "rock2" }
        ]
      }
  end

  # You can use all Rails features like filtering, too. A SOAP controller
  # is just like a normal controller with a special routing.
  before_filter :dump_parameters
  def dump_parameters
    Rails.logger.debug params.inspect
  end

  soap_action "upload_program",
    :args => { 
      :import_request => { 
        :programmes => { 
          :program => [{ 
            :id => :string,
            :program_name => [:string],
            :jacs_code => [:string],
            :school_name => [:string],
            :faculty_name => [:string],
            :study_type => [:string],
            :record_type => :string
          }]
        }
      }
    },
    :return => :xml
  def upload_program
    raise params.inspect
  end

  soap_action "rumba",
  :args => nil,
  :return => { :plupp => {:xyz => :string} }
  def rumba
    render :soap => { :plupp => {:xyz => "123"} }
  end
  
private  
	def set_soap_header

		#if request.env['wash_out.soap_action'].blank? || request.env['wash_out.soap_action'] == %Q("")
		  # xml = request.body.read
          # my_params = Nokogiri::XML(xml)
		  # my_params.remove_namespaces!
		  # childnode = my_params.xpath('Body').children


		  
		  #actionname = childnode.keys
			# @my_params = @my_params.values_at(:envelope, :Envelope).compact.first
			# puts @my_params
            # @my_params = @my_params.first
		#end
		# puts "+++++++++++++++++++++"
		# puts my_params
		# childnode.each do |node|
			# @name =  node.name() 
		# end
		#puts @name.to_s
		#request.env['wash_out.soap_action'] = "authenticate" 
		#request.env['wash_out.soap_action'] = '"authenticate"'
		 #puts "+++++++++++++++++++++"
	end
	
end
