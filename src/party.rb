require_relative "help"
require_relative "data"
#require_relative "xcitation"
require 'date'
require 'json'
require 'colorize'
file = File.read('data.json')
data_hash = JSON.parse(file)

# def the_year=(value)
#    min, max = 1200, 2022
#       if value < min || > max 
#          raise RangeError, "Year must be between 1200 and 2022."
#       else the_year = value
#       end
# end

def year
               
   
   # begin
         begin
         puts "what year is this matter?"
         the_year = gets.strip.to_i
          unless the_year.is_a?(Numeric)
         raise ArgumentError, "Year must not be empty and must be a number."
         end
         unless the_year > 1000 && the_year < Date.today.year + 1
            raise ArgumentError, "Year must be between 1200 and #{Date.today.year + 1}"
         end
         rescue 
            puts "Year must not be blank, and must be four digits between 1000 and #{Date.today.year + 1}. Hit the enter key to try again."
            enter_key = gets
            retry
         end
         @data_hash["year_queries"] = the_year
         File.write('data.json', JSON.dump(@data_hash))
        

end
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
#######################ERROR HANDLING
            puts "Enter the number of the relevant company structure, or 6 for a foreign registered company."
            @company_types.each.with_index do  |type, index| 
            puts "#{index + 1}. #{type}"
                    end
                    company_answer = gets.strip.to_i
#######################ERROR HANDLING
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
                            puts "Please enter the relevant suffix." 
                            foreign_suffix = gets.strip
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
                    ####This needs error handling
            if is_under_admin == 1 
               #######################ERROR HANDLING 
               puts "Select the relevant type of administration arrangement"
                @admin_types.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
                end  
                admin_answer = gets.strip.to_i
                #######################ERROR HANDLING
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
                when 9
                  #help
                

                end
                #elsif admin_answer = n - what does this mean?
            #else puts "enter either 1 or 2. "
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
   


            if is_co == 1 #Start helping user define their company party
            puts "The appropriate suffix has been addeed to the name.\nPlease do not include characters after the 'and' when entering the party name"
               @data_hash["co_suffix_#{@data_hash["party_number"]}"] = "& Co"
               File.write('data.json', JSON.dump(@data_hash))

            end
         end
        File.write('data.json', JSON.dump(@data_hash))
     end
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
            
         ########################ERROR HANDLING HERE
            puts "Enter the relevant state."
            @states.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
            end
            states_answer = gets.strip.to_i
      #######################this needs error handling


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
########################ERRROR HANDLING HERE
                    @aus_ter.each.with_index do  |type, index| puts "#{index + 1}. #{type}"
                    end
                    aus_ter_answer = gets.strip.to_i
                    #########################
                  when 10
                     #hellllpppp
               end
         end  
            
            if government_answer == 2
               @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(Cth)"
               File.write('data.json', JSON.dump(@data_hash))
            
            end
            if government_answer == 3
               #######################ERROR HANDLING
               puts "Enter the name of the government, including any relevant suffixes."
                    @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1
                    
                    name_of_government = gets.strip
                    #######################ERROR HANDLING
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
            ################ERROR HANDLING HERE
            puts "Chose the entity type."
            #puts "Enter a number between 1 and #{government_entity.length}."
            @government_entity.each.with_index do |type, index| puts "#{index + 1}. #{type}"
            end
            @government_entity_answer = gets.to_i
            ##############
            case @government_entity_answer
                when 1
                  ###################ERROR HANDLING   
                  puts "Enter Government Department Name"
                    government_department_name = gets.strip
                    ####################ERROR HANDLING
                     @data_hash["party_#{@data_hash["party_number"]}"] = government_department_name
                when 2
                  ##################ERROR HANDLING  
                  puts "Was the Minister an Attorney-General?"
                    is_ag = gets.strip.to_i
                    ##################ERROR HANDLING
                    
                    if is_ag == 1
                        ############################## ERROR HANDLING HERE
                        puts "Was the proceeding a relator action?"
                        rel_action_answer = gets.to_i
                           ######################
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
                       puts "Enter the Ministers's title including all relevant departments." 
                       ##################ERROR HANDLING
                       ministers_title = gets.strip
                       #####################ERRROR HANDLING
                       @data_hash["party_#{@data_hash["party_number"]}"] = ministers_title
                       File.write('data.json', JSON.dump(@data_hash))
                    end
                when 3
                    check_dpp = 1
                    ####################ERROR HANDLING
                    
                    puts "Is it the Director of Public Prosecutions?" 
                    
                    check_dpp = gets.strip.to_i
                    #######################ERROR HANDLING
                    if check_dpp == 2 && @data_hash["govt_abbreviation_#{@data_hash["party_number"]}"] = "(NI)" && year_date < 2016
                        puts "As the case is a prosecution brought by the Norfolk Island administration, please manually enter the title of the individual or government representative who brought the action."
                        ##########THIS REQUIRES VALIDATION
                        ni_govt_action = gets.strip
                     #####################

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
                        ####################ERROR HANDLING
                           else puts "As the year selected is 1952 and the Queen has reigned from February 1952, please indicate whether the decision was from January 1952. #{@data_hash["bool_question"]}"

                           month_of_1952 = gets.strip.to_i
                           
                           ####################ERROR HANDLING
                           
                           
                           
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
                           puts "Please enter the party name."
                           @data_hash["party_filled_#{@data_hash["party_number"]}"] = 1 
                           @data_hash["party_#{@data_hash["party_number"]}"]  = gets.strip
                           ########AND ERROR CHECKING




                           File.write('data.json', JSON.dump(@data_hash))
                  when 9
                #this is for help.d
               end
            
        end
      end



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
        puts "does it require a suffix? #{@data_hash["bool_question"]}"
        case_affix_requred = gets.strip.to_i
        if case_affix_requred == 1
        @case_affix.each.with_index do |type, index| puts "#{index + 1}. #{type}"
        end   
        case_affix_answer = gets.strip.to_i
        if case_affix_answer == 1
            case case_affix
            when 1
               @data_hash["case_suffix_#{@data_hash["party_number"]}"] = "Ex parte" 
               File.write('data.json', JSON.dump(@data_hash))
            when 2
               @data_hash["case_suffix_#{@data_hash["party_number"]}"] = "Re"
               File.write('data.json', JSON.dump(@data_hash))
            else
                puts "enter either 1 or 2."
            end
        end
        end
        if case_affix_requred == 2
        end
        end
        # else puts "enter either Y or N. "

     
    # @program_data.each do |e|
    #     puts e
    end
    def write_name
       
      if @data_hash["party_filled_#{@data_hash["party_number"]}"] != 1
      begin     
      puts "please enter the name of your party"
      party_name_entered = gets.strip
      unless party_name_entered.match?(/[[:alnum:]]/) || party_name_entered.include?(" ") || party_name_entered.include?("-") || party_name_entered.include?("'") || party_name_entered.length <= 80
      end
      if party_name_entered.empty? || party_name_entered.nil
      end
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
    

 




