require_relative "help"
require_relative "data"
require 'date'
require 'json'
require 'colorize'
file = File.read('data.json')
data_hash = JSON.parse(file)

def year
         begin
         puts "what year is this matter?"
         the_year = gets.strip.to_i
          unless the_year.is_a?(Numeric)
         raise ArgumentError, "Year must not be empty and must be a number."
         end
         unless the_year > 1000 && the_year < Date.today.year + 1
            raise ArgumentError, "Year must be between 1000 and #{Date.today.year + 1}"
         end
         rescue 
            puts "Year must not be blank, and must be four digits between 1000 and #{Date.today.year + 1}. Hit the enter key to try again."
            enter_key = gets
            retry
         end
         @data_hash["year_queries"] = the_year
         File.write('data.json', JSON.dump(@data_hash))  
end