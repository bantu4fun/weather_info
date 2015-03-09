class PagesController < ApplicationController
  before_action :get_provider

  def weather

    client = Savon.client(wsdl: @provider.url, convert_request_keys_to: :camelcase, read_timeout: 5)

    if params[:city_id].present?
      city = City.find(params[:city_id])
      begin
        response = client.call(@operation.to_sym, message: { city_name: city.city_name, country_name: city.country })
      rescue Net::ReadTimeout => e
        puts e.to_s
        error = true
      end
  
      unless error
        list = response.body[@operation_response.to_sym][@operation_result.to_sym]
        xml_doc = Nokogiri.XML(list)
        @location = xml_doc.xpath('//Location').text
        @time = xml_doc.xpath('//Time').text
        @temperature = xml_doc.xpath('//Temperature').text
        @sky_condition = xml_doc.xpath('//SkyConditions').text
        @humidity = xml_doc.xpath('//RelativeHumidity').text
        @pressure = xml_doc.xpath('//Pressure').text

        WeatherLog.create(location: @location, date: @time, temp: @temperature, sky: @sky_condition, humidity: @humidity, pressure: @pressure)
      else
        info = WeatherLog.where("location LIKE ?", "%#{city.city_name}%").last
        @location = info.location
        @time = info.date
        @temperature = info.temp
        @sky_condition = info.sky
        @humidity = info.humidity
        @pressure = info.pressure
      end
    end
  end

  private

    def get_provider
      @provider = Provider.last
      @operation = @provider.operation.underscore
      @operation_response = @operation + "_response"
      @operation_result = @operation + "_result"
    end

end
