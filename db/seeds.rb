Provider.first_or_create(name: 'Provider', url: 'http://www.webservicex.com/globalweather.asmx?WSDL', operation: 'GetWeather', timeout: 10)

City.first_or_create([{ city_name: 'Katowice', country: 'Poland' }, { city_name: 'Berlin-Schoenefeld', country: 'Germany' },
                      { city_name: 'Beijing', country: 'China' }, { city_name: 'Los Angeles', country: 'United States' }])
