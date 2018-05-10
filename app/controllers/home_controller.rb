class HomeController < ApplicationController
	before_action :creat_client
	

	def index
		batch_size = 10
	    @twitter_handle = "Sebaslondo02"	
		@users = User.all
  		
	end


#=> [#<Hashie::Mash arma_empleada="ARMA DE FUEGO" barrio="LA MADERA" c_digo_dane="5088000" cantidad="1" clase="MOTOCICLETA" clase_de_empleado="EMPLEADO PARTICULAR" clase_de_sitio="VIAS PUBLICAS" color="ROJO" d_a="Domingo" departamento="ANTIOQUIA"
#=>  edad="26" escolaridad="SUPERIOR" estado_civil="SOLTERO" fecha="2017-01-01T00:00:00.000" hora="1899-12-31T06:30:00.000" linea="RX 115 S" 
#=>  m_vil_agresor="PASAJERO MOTOCICLETA" m_vil_victima="CONDUCTOR MOTOCICLETA"
#=>   marca="YAMAHA" modelo="2004" municipio="BELLO" pa_s_de_nacimiento="COLOMBIA" 
#=>  profesi_n="-" sexo="MASCULINO" zona="URBANA">]
#=> result[]



  	def lo_tweets
	 	batch_size = 10
	    @twitter_handle = "Sebaslondo02"
	    @tweets = @client.user_timeline(@twitter_handle).take(batch_size)    
	    @friends = @client.friends(@twitter_handle).take(batch_size)
		@followers = @client.followers(@twitter_handle).take(batch_size)
		
	end
 
  	private

  	def home_params
  		params.require(:home).permit(:keywork)
  	end

	def creat_client
	    @client = Twitter::REST::Client.new do |config|
	      config.consumer_key        = Rails.application.secrets.twitter_api_key
	      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
	      config.access_token        = current_user.token
	      config.access_token_secret = current_user.secret
    end 
  end
end

