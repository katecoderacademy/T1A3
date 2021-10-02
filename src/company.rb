require_relative "help"
require_relative "data"
require 'json'
require 'colorize'
file = File.read('data.json')
data_hash = JSON.parse(file)

def company
    begin 
    
       puts "Is the party a company? #{@data_hash["bool_question"]}"
     is_company = gets.strip.to_i 
     unless is_company.is_a?(Numeric)
       raise ArgumentError, "Answer must not be empty and must be a number."
       end
       unless is_company > 0 && is_company < 4
          raise ArgumentError, "Answer must be between 1 and 3."
       end
    rescue
       puts "Please enter a number between 1 and 3. Hit the enter key to try again."
       enter_key = gets
       retry
    end
     @data_hash["is_company_#{@data_hash["party_number"]}"] = is_company
     File.write('data.json', JSON.dump(@data_hash))
 
             if is_company == 1
 
             begin
          puts "Enter the number of the relevant company structure, or 6 for a foreign registered company."
             @company_types.each.with_index do  |type, index| 
             puts "#{index + 1}. #{type}"
                     end
                     company_answer = gets.strip.to_i
                     unless  company_answer.is_a?(Numeric)
                      raise ArgumentError, "Answer must not be empty and must be a number."
                      end
                      unless company_answer > 0 && company_answer < 8
                         raise ArgumentError, "Answer must be between 1 and 7."
                      end
                   rescue
                      puts "Please enter a number between 1 to 6 to select a company suffix. Hit the enter key to return and try again."
                      enter_key = gets
                      retry
                   end
 
                     case company_answer
                         when 1
                            @data_hash["company_suffix_#{@data_hash["party_number"]}"] = "Ltd"
                            File.write('data.json', JSON.dump(@data_hash))
                         when 2
                            @data_hash["company_suffix_#{@data_hash["party_number"]}"] = "Pty"
                            File.write('data.json', JSON.dump(@data_hash))
                         when 3
                            @data_hash["company_suffix_#{@data_hash["party_number"]}"] = "Pty Ltd"
                            File.write('data.json', JSON.dump(@data_hash))
                         when 4
                            @data_hash["company_suffix_#{@data_hash["party_number"]}"] = "Inc"
                            File.write('data.json', JSON.dump(@data_hash))
                         when 5
                            @data_hash["company_suffix_#{@data_hash["party_number"]}"] = "NL"
                            File.write('data.json', JSON.dump(@data_hash))
                         when 6
                            begin 
                            puts "Please enter the relevant suffix." 
                             foreign_suffix = gets.strip
                             unless foreign_suffix.match?(/[[:alpha:]]/) || foreign_suffix.include?(" ") || foreign_suffix.include?("-") || foreign_suffix.include?(".") || foreign_suffix.length <= 12
                                raise ArgumentError, "No special characters"
                             end
                             if foreign_suffix.empty? || foreign_suffix.nil
                                raise ArgumentError, "No blank returns"
                             end
                              
                             
                            rescue
                               puts "Foreign suffixes cannot contain more than 12 characters, and can include letters, full stops and hyphens. Hit enter to return and enter the suffix again."
                               enter_key = gets
                               retry
                            end 
                             
                             @data_hash["company_suffix_#{@data_hash["party_number"]}"] = foreign_suffix
                             File.write('data.json', JSON.dump(@data_hash))
                             #no_insolvency
                     end
                 
 
             begin
            
                puts "Is the company under external management? #{@data_hash["bool_question"]}"
             is_under_admin = gets.strip.to_i
             unless  is_under_admin.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless is_under_admin > 0 && is_under_admin < 4
                   raise ArgumentError, "Answer must be between 1 and 3."
                end
             rescue
                puts "Please 1 for yes, or 2 for no. Hit the enter key to try again."
                enter_key = gets
                retry
             end
 
             if is_under_admin == 1 
                begin
                puts "Select the relevant type of administration arrangement"
                 @admin_types.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
                 end  
                 admin_answer = gets.strip.to_i
                 unless  admin_answer.is_a?(Numeric)
                   raise ArgumentError, "Answer must not be empty and must be a number."
                   end
                   unless admin_answer > 0 && admin_answer < 7
                      raise ArgumentError, "Answer must be between 1 and 7."
                   end
                rescue
                   puts "Please enter a number between 1 to 7 to select the form of administration the company is currently under. Hit the enter key to return and try again."
                   enter_key = gets
                   retry
                end
                 case admin_answer
                 when 1
                    @data_hash["administration_status_#{@data_hash["party_number"]}"]  = "(in liq)"
                    File.write('data.json', JSON.dump(@data_hash))
                 when 2
                    @data_hash["administration_status_#{@data_hash["party_number"]}"]  = "(in prov liq)"
                    File.write('data.json', JSON.dump(@data_hash))
                 when 3
                    @data_hash["administration_status_#{@data_hash["party_number"]}"]  = "(admin appt)"
                    File.write('data.json', JSON.dump(@data_hash))
                 when 4
                    @data_hash["administration_status_#{@data_hash["party_number"]}"]  = "(mgr apptd)"
                    File.write('data.json', JSON.dump(@data_hash))
                 when 5
                    @data_hash["administration_status_#{@data_hash["party_number"]}"]  = "(rec apptd)"
                    File.write('data.json', JSON.dump(@data_hash))
                 when 6
                   #help
                 
 
                 end
             end
             begin
             puts "Is the structure of the name NAME and company?#{@data_hash["bool_question"]}"
             is_co = gets.strip.to_i
             unless  is_co.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless is_co > 0 && is_co < 4
                   raise ArgumentError, "Answer must be between 1 and 3."
                end
             rescue
                puts "Please 1 for yes, or 2 for no. Hit the enter key to try again."
                enter_key = gets
                retry
             end
    
 
 
             if is_co == 1
             puts "The appropriate suffix for 'and company' has been addeed to the name.\nPlease do not include characters after the 'and' when entering the party name"
                @data_hash["co_suffix_#{@data_hash["party_number"]}"] = "& Co"
                File.write('data.json', JSON.dump(@data_hash))
 
             end
          end
         File.write('data.json', JSON.dump(@data_hash))
      end