require_relative "help"
require_relative "data"
require 'json'
require 'colorize'
file = File.read('data.json')
data_hash = JSON.parse(file)

def government
    if @data_hash["is_company_#{@data_hash["party_number"]}"] != 1
    begin
     puts "Is it a government party or representing government? #{@data_hash["bool_question"]}"
      is_government = gets.strip.to_i
        unless is_government.is_a?(Numeric)
           raise ArgumentError, "Answer must not be empty and must be a number."
           end
           unless is_government > 0 && is_government < 4
              raise ArgumentError, "Answer must be between 1 and 3."
           end
        rescue
           puts "Please enter a number between 1 and 3. Hit enter to try again."
           enter_key = gets
           retry
        end
    end
    if is_government == 1 #Start helping user define which government
       @data_hash["is_government_#{@data_hash["party_number"]}"] = "1"
       begin 
       government_types = ["State/Territory Government", "Australian Government", "Foreign Government"]
        puts "Select the relevant type of government"
        government_types.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
        end
        
        government_answer = gets.strip.to_i
        unless  government_answer.is_a?(Numeric)
           raise ArgumentError, "Answer must not be empty and must be a number."
           end
           unless government_answer > 0 && government_answer < 11
              raise ArgumentError, "Answer must be between 1 and 10."
           end
        rescue
           puts "Please select the type of government using the numbers. Hit enter to return and try again."
           enter_key = gets
           retry
        end      

    end        
        
    if government_answer == 1
        
        begin
        puts "Enter the relevant state."
        @states.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
        end
        states_answer = gets.strip.to_i
        unless   states_answer.is_a?(Numeric)
           raise ArgumentError, "Answer must not be empty and must be a number."
           end
           unless  states_answer > 0 &&   states_answer < 10
              raise ArgumentError, "Answer must be between 1 and 9."
           end
        rescue
           puts "Please select an Australian State or Territory, using numbers 1 to 9. Hit the enter key to try again."
           enter_key = gets
           retry
        end  


        case states_answer #this both notes that the party is a state based party, and puts the name of it in shortened form into the bracket section
            when 1
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Vic)"
               File.write('data.json', JSON.dump(@data_hash))
            when 2
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NSW)"
               File.write('data.json', JSON.dump(@data_hash))
            when 3
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(QLD)"
               File.write('data.json', JSON.dump(@data_hash))
            when 4
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Tas)"
               File.write('data.json', JSON.dump(@data_hash))
            when 5
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(SA)"
               File.write('data.json', JSON.dump(@data_hash))
            when 6
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NT)"
               File.write('data.json', JSON.dump(@data_hash))
            when 7
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(ACT)"
               File.write('data.json', JSON.dump(@data_hash))
            when 8
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(WA)"
               File.write('data.json', JSON.dump(@data_hash))
            when 9
                aus_ter_selection = 0
                aus_ter_answer = 0
              begin
                @aus_ter.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
                end
                aus_ter_answer = gets.strip.to_i
                unless   aus_ter_answer.is_a?(Numeric)
                 raise ArgumentError, "Answer must not be empty and must be a number."
                 end
                 unless  aus_ter_answer > 0 &&   aus_ter_answer < 10
                    raise ArgumentError, "Answer must be between 1 and 9."
                 end
              rescue
                 puts "Please select an Australian Territory, using numbers 1 to 8. Hit the enter key to try again."
                 enter_key = gets
                 retry
              end  
              when 10
                 #hellllpppp
           end
     end  
        
        if government_answer == 2
           @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Cth)"
           File.write('data.json', JSON.dump(@data_hash))
        
        end
        if government_answer == 3

           begin
           puts "Enter the name of the government, including any relevant suffixes."
                @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1
                name_of_government = gets.strip
                unless name_of_government.match?(/[[:alpha:]]/) || name_of_government.include?(" ") || name_of_government.include?("-") || name_of_government.include?(")") || name_of_government.include?("(") || name_of_government.length <= 80
                    raise ArgumentError, "No special characters"
                end
                if name_of_government.empty? || name_of_government.nil
                    raise ArgumentError, "No blank returns"
                end
              rescue
                puts "A foreign Government name cannot be blank, can contain spaces, dashes, letters and round brackets. They can contain up to 80 characters. Please hit enter to return and try again."
                enter_key = gets
                retry
            end 
               
                @data_hash["party_#{@data_hash["party_number"]}"] = name_of_government
               File.write('data.json', JSON.dump(@data_hash))
        end   
                    
           case aus_ter_answer
              when 1, 4
              @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(WA)"
              File.write('data.json', JSON.dump(@data_hash))
              when 2, 3, 6
              @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Cth)"
              File.write('data.json', JSON.dump(@data_hash))
              when 5, 7
              @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NI)"
              File.write('data.json', JSON.dump(@data_hash))
              when 8
              @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(ACT)"
              File.write('data.json', JSON.dump(@data_hash))
              when 9
              puts "#{@help[:five]}" #PLACEHOLDER
                    
           end

  if government_answer == 1 || government_answer == 2
        begin
                puts "Chose the entity type."
                @government_entity.each.with_index do |type, index| puts "#{index + 1}. #{type}"
                end
                    @government_entity_answer = gets.to_i
                unless   @government_entity_answer.is_a?(Numeric)
                    raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless   @government_entity_answer > 0 &&   @government_entity_answer < 8
                    raise ArgumentError, "Answer must be between 1 and 8."
                end
                rescue
                puts "Please select a government entity, using numbers 1 to 6. Hit the enter key to try again."
                enter_key = gets
                retry
        end     
        case @government_entity_answer
            when 1
                begin
                puts "Enter Government Department Name"
                government_department_name = gets.strip
                unless government_department_name.match?(/[[:alnum:]]/) || government_department_name.include?(" ") || government_department_name.include?("-") || government_department_name.include?(")") || government_department_name.include?("(") || government_department_name.include?("]") || government_department_name.include?("[") || government_department_name.length <= 80
                    raise ArgumentError, "No special characters"
                end
                if government_department_name.empty? || government_department_name.nil
                    raise ArgumentError, "No blank returns"
                end  
            rescue
                puts "A Government Department name cannot be blank, can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters. Please hit enter to return and try again."
                enter_key = gets
                retry
             end 
                @data_hash["party_#{@data_hash["party_number"]}"] = government_department_name
            when 2
              
              begin
              puts "Was the Minister an Attorney-General?"
                is_ag = gets.strip.to_i
                unless   is_ag.is_a?(Numeric)
                 raise ArgumentError, "Answer must not be empty and must be a number."
                 end
                 unless   is_ag > 0 &&   is_ag < 4
                    raise ArgumentError, "Answer must be between 1 and 3."
                 end
              rescue
                 puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                 enter_key = gets
                 retry
              end   
               
                
                if is_ag == 1
               
                    begin
                    puts "Was the proceeding a relator action?"
                    rel_action_answer = gets.to_i
                    unless   rel_action_answer.is_a?(Numeric)
                       raise ArgumentError, "Answer must not be empty and must be a number."
                       end
                       unless   rel_action_answer > 0 &&   rel_action_answer < 4
                          raise ArgumentError, "Answer must be between 1 and 3."
                       end
                    rescue
                       puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                       enter_key = gets
                       retry
                    end     
  
                      
                   @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = state_abbreviation
                    case rel_action_answer
                    when 1
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Attorney-General (#{state_abreviation}); ex rel"
                        File.write('data.json', JSON.dump(@data_hash)) 
                    when 2
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Attorney-General (#{state_abreviation});"
                        File.write('data.json', JSON.dump(@data_hash))
                    when 3
                        #help
                    end
                end
        
        
                if is_ag == 2
                  @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                  begin 
                  puts "Enter the Ministers's title including all relevant departments." 
                   
                   ministers_title = gets.strip
                   unless ministers_title.match?(/[[:alnum:]]/) || ministers_title.include?(" ") || ministers_title.include?("-") || ministers_title.include?(")") || ministers_title.include?("(") || ministers_title.include?("]") || ministers_title.include?("[") || ministers_title.length <= 80
                    raise ArgumentError, "No special characters"
                   end
                   if ministers_title.empty? || ministers_title.nil
                    raise ArgumentError, "No blank returns"
                   end
               rescue
                   puts "Ministers's titles cannot be blank, can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters. Please hit enter to return and try again."
                   enter_key = gets
                   retry
                end 
                   @data_hash["party_#{@data_hash["party_number"]}"] = ministers_title
                   File.write('data.json', JSON.dump(@data_hash))
                end
            when 3
                check_dpp = 1

                begin
                puts "Is it the Director of Public Prosecutions?" 
                
                check_dpp = gets.strip.to_i
                unless   check_dpp.is_a?(Numeric)
                 raise ArgumentError, "Answer must not be empty and must be a number."
                 end
                 unless   check_dpp > 0 &&   check_dpp < 4
                    raise ArgumentError, "Answer must be between 1 and 3."
                 end
              rescue
                 puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                 enter_key = gets
                 retry
              end     

                if check_dpp == 2 && @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NI)" && year_date < 2016
                begin   
                 puts "As the case is a prosecution brought by the Norfolk Island administration, please manually enter the title of the individual or government representative who brought the action."
                    
                    ni_govt_action_party = gets.strip
                    unless ni_govt_action_party.match?(/[[:alnum:]]/) || ni_govt_action_party.include?(" ") || ni_govt_action_party.include?("-") || ni_govt_action_party.include?(")") || ni_govt_action_party.include?("(") || ni_govt_action_party.include?("]") || ni_govt_action_party.include?("[") || ni_govt_action_party.length <= 80
                        raise ArgumentError, "No special characters"
                    end
                    if ni_govt_action_party.empty? || ni_govt_action_party.nil
                        raise ArgumentError, "No blank returns"
                    end
                    rescue
                    puts "Government parties cannot be blank, can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters. Please hit enter to return and try again."
                    enter_key = gets
                    retry
                end 

                   @data_hash["party_#{@data_hash["party_number"]}"] = ni_govt_action 
                   File.write('data.json', JSON.dump(@data_hash))
                else check_dpp == 1 
                 @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                  @data_hash["party_#{@data_hash["party_number"]}"] = "Director of Public Prosecutions"
                   File.write('data.json', JSON.dump(@data_hash)) 
                end
                
            when 4
                if @data_hash["party_number"] = 1 || @data_hash["party_number"] = 3
                    if @data_hash["year_queries"] > 1952
                       puts "The relevant monarch was the Queen. This has been written as the party."
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1
                       @data_hash["party_#{@data_hash["party_number"]}"] = "The Queen"
                        
                       File.write('data.json', JSON.dump(@data_hash))
                    elsif @data_hash["year_queries"] < 1952
                       puts "The relevant monarch was a King. This has been written as the  party."
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "The King"
                        File.write('data.json', JSON.dump(@data_hash))

                       else 
                       begin
                          puts "As the year selected is 1952 and the Queen has reigned from February 1952, please indicate whether the decision was from January 1952. #{@data_hash["bool_question"]}"

                       month_of_1952 = gets.strip.to_i
                       unless   month_of_1952.is_a?(Numeric)
                          raise ArgumentError, "Answer must not be empty and must be a number."
                          end
                          unless   month_of_1952 > 0 &&   month_of_1952 < 4
                             raise ArgumentError, "Answer must be between 1 and 3."
                          end
                       rescue
                          puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                          enter_key = gets
                          retry
                       end        

                       
                       
                       
                       if month_of_1952 == 1
                          @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                          @data_hash["party_#{@data_hash["party_number"]}"] = "The King"
                           File.write('data.json', JSON.dump(@data_hash))
                        else
                          @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1  
                          @data_hash["party_#{@data_hash["party_number"]}"] = "The Queen"
                           File.write('data.json', JSON.dump(@data_hash))
                        end
                    end
                 else
                    @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1
                    @data_hash["party_#{@data_hash["party_number"]}"] = "R"
                    File.write('data.json', JSON.dump)
                    

                 end
                
            when 5
                case
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Vic)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Victoria"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{data_hash["party_number"]}"] = "(NSW)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "New South Wales"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(SA)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{data_hash["party_number"]}"] = "South Australia"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(WA)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Western Australia"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Qld)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Queensland"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(ACT)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Australian Capital Territory"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NT)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{data_hash["party_number"]}"] = "Northern Territory"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NI)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Norfolk Island"
                       File.write('data.json', JSON.dump(@data_hash))
                    when @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Cth)"
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       @data_hash["party_#{@data_hash["party_number"]}"] = "Commonwealth"
                       File.write('data.json', JSON.dump(@data_hash))
                 end
              when 6
                       begin
                       puts "Please enter the Government Entity name."
                       @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                       government_entity_custom_name = gets.strip
                             unless government_entity_custom_name.match?(/[[:alnum:]]/) || government_entity_custom_name.include?(" ") || government_entity_custom_name.include?("-") || government_entity_custom_name.include?(")") || government_entity_custom_name.include?("(") || government_entity_custom_name.include?("]") || government_entity_custom_name.include?("[") || government_entity_custom_name.length <= 80
                                raise ArgumentError, "No special characters"
                             end
                             if government_entity_custom_name.empty? || government_entity_custom_name.nil
                                raise ArgumentError, "No blank returns"
                             
                                
                             end
                       rescue
                             puts "Government entities cannot be blank, can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters. Please hit enter to return and try again."
                             enter_key = gets
                             retry
                          end
                       @data_hash["party_#{@data_hash["party_number"]}"] = government_entity_custom_name
                       File.write('data.json', JSON.dump(@data_hash))
              when 7
            #this is for help.d
           end
        
    end
  end