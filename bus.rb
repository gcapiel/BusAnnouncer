#!/usr/bin/env ruby

require 'muni'

def pingable?(addr)
  output = `ping -c 4 #{addr}`
  !output.include? "100% packet loss"
end

#puts "Shizam!" if pingable? "192.168.1.143"

r = Muni::Route.find(48)
busTimes = "Good morning! The next buses are coming in "
r.inbound.stop_at("5495").predictions.map(&:minutes).each { |min| busTimes.concat("#{min} minutes ") }

begin
  file = File.open("/home/pi/bustime.txt", "w")
  file.write(busTimes)
rescue IOError => e
  puts "file writing error"
ensure
  file.close unless file == nil
end


