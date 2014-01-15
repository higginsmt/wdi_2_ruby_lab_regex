require_relative 'source'
require 'pry'

def valid_ip_addresses(text)
	text.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
end

def valid_mit_ip_addresses(text)
	text.scan(/18\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
end

def non_mit_ip_addresses(text)
	all_ips = text.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
	non_mit_ips = all_ips.reject{ |ip| ip =~ /18\.\d{1,3}\.\d{1,3}\.\d{1,3}/}
end

def valid_phone_numbers(text)
	text.scan(/[2-9]{1}\d{0,2}\-\d{0,3}\-?\d{4}/).uniq
end

def area_codes(text)
	array_phone_numbers = text.scan(/[2-9]{1}\d{0,2}\-\d{0,3}\-?\d{4}/).uniq

	# cut any phone numbers without area codes
	array_phone_numbers.map{ |number|
		if number.length < 9
			array_phone_numbers.delete(number)
		end
	}

	array_area_codes = array_phone_numbers.map{ |number| number[0..2] }
end

def email_addresses(text)
	text.scan(/\S+\@\S+/)

end

def zip_codes(text)
	zips = text.scan(/\D\d\d\d\d\d\D/)
	zips.map{ |f| f[1..5]}
end

def hex_colors(text)
	hex_array = text.scan(/#([0-9]|[a-f]){1}([0-9]|[a-f]){1}([0-9]|[a-f]){1}([0-9]|[a-f]){1}([0-9]|[a-f]){1}([0-9]|[a-f]){1}/)
	smart_array = []
	hex_array.each{ |n| smart_array << n.join}
	smart_array
end

# ["ccddee", "b1dafb", "741d0d"]

# hex_colors(@source_text)




