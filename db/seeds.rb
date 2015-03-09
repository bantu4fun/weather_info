# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.first_or_create(name: 'Provider', url: 'http://www.webservicex.com/globalweather.asmx?WSDL', operation: 'GetWeather', timeout: 10)

City.first_or_create([{ city_name: 'Katowice', country: 'Poland' }, { city_name: 'Berlin-Schoenefeld', country: 'Germany' },
                      { city_name: 'Beijing', country: 'China' }, { city_name: 'Los Angeles', country: 'United States' }])
