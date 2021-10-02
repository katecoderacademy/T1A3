require_relative "help"
require_relative "data"
require 'json'
require 'colorize'
file = File.read('data.json')
data_hash = JSON.parse(file)

def single_party_procedure
         begin
               puts "is this a single party application? #{@data_hash["bool_question"]}"
               single_party = gets.strip.to_i
               unless single_party.is_a?(Numeric)
                  raise ArgumentError, "Answer must not be empty and must be a number."
                  end
                  unless single_party > 0 && single_party < 4
                     raise ArgumentError, "Answer must be between 1 and 3."
                  end
               rescue
                  puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                  enter_key = gets
                  retry
         end 
   if single_party == 1
         @data_hash["case_suffix_#{@data_hash["is_single_party_1"]}"] = "Ex parte" 
               File.write('data.json', JSON.dump(@data_hash))
        begin
        puts "does it require a suffix? #{@data_hash["bool_question"]}"
        case_affix_required = gets.strip.to_i
        unless case_affix_required.is_a?(Numeric)
         raise ArgumentError, "Answer must not be empty and must be a number."
         end
         unless case_affix_required > 0 && case_affix_required < 4
            raise ArgumentError, "Answer must be between 1 and 3."
         end
         rescue
         puts "Please enter a number between 1 and 3. Hit the enter key to try again."
         enter_key = gets
         retry
         end
        
            if case_affix_required == 1
               begin
               @case_affix.each.with_index do |type, index| puts "#{index + 1}. #{type}"
               end   
               case_affix_answer = gets.strip.to_i
               unless case_affix_answer.is_a?(Numeric)
               raise ArgumentError, "Answer must not be empty and must be a number."
               end
               unless case_affix_answer > 0 && case_affix_answer < 4
                  raise ArgumentError, "Answer must be between 1 and 3."
               end
               rescue
               puts "Please enter a number between 1 and 3. Hit the enter key to try again."
               enter_key = gets
               retry
               end
            end
        
        
        
        
               if case_affix_answer == 1
                  @data_hash["case_suffix_#{@data_hash["party_number"]}"] = "Ex parte" 
                        File.write('data.json', JSON.dump(@data_hash))
               else    
                  @data_hash["case_suffix_#{@data_hash["party_number"]}"] = "Re"
                  File.write('data.json', JSON.dump(@data_hash))        
               end
   end

end
    def write_name
       
      if @data_hash["party_filled_#{@data_hash["party_number"]}"] != 1
      begin     
      puts "please enter the name of your party"
      party_name_entered = gets.strip
      unless party_name_entered.match?(/[[:alnum:]]/) || party_name_entered.include?(" ") || party_name_entered.include?("-") || party_name_entered.include?("'") || party_name_entered.length <= 80
         raise ArgumentError, "No special characters or blank returns"
      end
      if party_name_entered.empty? || party_name_entered.nil
         raise ArgumentError, "No special characters or blank returns"
      end
         
            
      rescue
      puts "Names cannot be blank, can contain spaces, appostrophies, dashes and letters and numbers. They can contain up to 80 characters. Please hit enter to return and try again."
      enter_key = gets
      retry
      end
       
      @data_hash["party_#{@data_hash["party_number"]}"]  = party_name_entered
      @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1
      File.write('data.json', JSON.dump(@data_hash))
   end   
   end
    
    #File.write('data.json', JSON.dump(data_hash))
    

 




