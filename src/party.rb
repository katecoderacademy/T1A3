class party
    def initialize
        @partyname = partyname
        @company_suffix = company_suffix
        @bracket_status = bracket_status    
        @co_suffix = co_suffix  
        @admin = admin
        @party_suffix = party_suffix   
    end
    def company
        puts "Is the party a company?" + bool_question
        is_company = gets.strip.to_i
            if is_company == 1 #Start helping user define their company party "==y"
                @program_data << "company"

                puts "Enter the number of the relevant company suffix, or 6 for a foreign registered company."
                    @company_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        company_answer = gets.strip.to_i
            case company_answer
                when 1
                    @suffix = "Ltd"
                when 2
                    @suffix = "Pty"
                when 3
                    @suffix = "Pty Ltd"
                when 4
                    @suffix = "Inc"
                when 5
                    @suffix = "NL"
                when 6
                    puts "Please enter the relevant suffix." #this then breaks the user out of the rest because foreign registered companies cannot be subject to insolvency in Australia?
                    @suffix = gets.strip
                    #no_insolvency
                    break
                    
            else
                puts "enter a number between 1 and #{company_types.length}."
            elsif is_company = n
            else puts "enter either Y or N. "
            puts "Is the company under external management?" + bool_question
                is_under_admin = gets.strip.to_i
            
                if is_under_admin == 1 

            puts "Select the relevant type of administration arrangement"
            admin_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                @admin_answer = gets.strip.to_i   
                case admin_answer
                when 1
                    @bracket_status  = "(in liq)" #try to code so I don't need to waste bytes weith brackets here
                when 2
                    @bracket_status  = "(in prov liq)"
                when 3
                    @bracket_status  = "(admin appt)"
                when 4
                    @bracket_status  = "(mgr apptd)"
                when 5
                    @bracket_status  = "(rec apptd)"
                else
                    puts "enter a number between 1 and #{admin_types.length}."
            elsif admin_answer = n
            else puts "enter either 1 or 2. "
            end    
        end
            
        puts "Is the structure of the name 'NAME' and company?" + bool_question
            is_co = gets.strip.to_i
            if is_co == 1 #Start helping user define their company party
            puts "The appropriate suffix has been addeed to the name.\nPlease do not include characters after the 'and' when entering the party name"
                @co_suffix = "& Co"


            elsif is_company = 2
            else puts "enter either 1 or 2." #error handling
            return #error handling
    end
    def government
        if @program_data.include?("company")
        break
        else
        puts "Is it a government part or representing government?" + bool_question
            is_government = gets.strip.to_i

        if is_government = 1 #Start helping user define which government
            @program_data << "government"
            government_types = ["State/Territory Government", "Australian Government", "Foreign Government"]
            puts "Select the relevant type of government"
            government_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
            government_answer = gets.strip.to_i      
        elsif is_government = 2
        else puts "enter either 1 or 2. " # this is error handling
        end        
            
        if government_answer == 1
            states_answer = gets.strip.to_i                    

            puts "Enter a number between 1 and #{@states.length}."
            @states.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
            states_answer = gets.strip.to_i
            
            case states_answer #this both notes that the party is a state based party, and puts the name of it in shortened form into the bracket section
                when 1
                    program_data << "vic"
                    @bracket_status = "(Vic)"
                when 2
                    program_data << "nsw"
                    @bracket_status = "(NSW)"
                when 3
                    program_data << "qld"
                    @bracket_status = "(QLD)"
                when 4
                    program_data << "tas"
                    @bracket_status = "(Tas)"
                when 5
                    program_data << "sa"
                    @bracket_status = "(SA)"
                when 6
                    program_data << "nt"
                    @bracket_status = "(NT)"
                when 7
                    program_data << "act"
                    @bracket_status = "(ACT)"
                when 8
                    program_data << "wa"
                    @bracket_status = "(WA)"
                when 9
                    aus_ter_selection = 0
                    aus_ter_answer = 0
                    puts "Enter a number between 1 and #{@aus_ter.length}."
                    @aus_ter.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                    aus_ter_answer = gets.strip.to_i
                elsif government_answer == 2
                    program_data << cth
                    @bracket_status = "Cth"
                    next
                elsif government_answer == 3
                    puts "Enter the name of the government, including any relevant suffixes."
                    @partyname = gets.strip
                    break
            end   
        end                
        case aus_ter_answer
         when 1, 4
            program_data << "wa"
            @bracket_status = "(WA)"
         when 2, 3, 6
            program_data << "cth"
            @bracket_status = "(Cth)"
         when 5, 7
            program_data << "ni"
            @bracket_status = "(NI)"
         when 8
            program_data << "act"
            @bracket_status = "(ACT)"
         when 9
         puts "#{@help[:one]}" #PLACEHOLDER
                
        end

         
        #error handling - enter number between 1 and 3       

        puts "Is it a government party or representing government?"
        puts "Enter a number between 1 and #{@government_entity.length}."
        @government_entity.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
        government_entity_answer = gets.to_i
         case government_entity_answer
         when 1
            puts "Enter Government Department Name"
            @partyname = gets.strip
            break
         when 2
            puts "Was the Minister the Attorney-General?" + bool_question
            is_ag = gets.strip.to_i
            if is_ag == 1
                puts "Was the proceeding a relator action?"
                rel_action = gets.to_i
                rel_action_answer = 0
                case rel_action_answer
                when 1
                    @partyname = "Attorney-General (#{@bracket_status}); ex rel" #program data needs to become a hash
                when 2
                    @partyname = "Attorney-General (#{@bracket_status});"
                when 3
                    #help
                end
            if is_ag == 2
            minister_departments = "string"
            puts "Enter the Ministers's title" 
            minister_departments = gets.strip
            @partyname = "#{minister_departments}"
            break
         when 3
            check_dpp = 1
            puts "Is it the Director of Public Prosecutions?" + bool_question
            check_dpp = gets.strip.to_i
            if check_dpp == 2 && program_data.include?("ni") && year_date < 2016
                puts "As the case is a prosecution brought by the Norfolk Island administration, please manually enter the title of the individual or government representative who brought the action."
                @partyname = gets.strip
                break
                elsif check_dpp == 1 
                    @partyname = "Director of Public Prosecutions"
                    break
         when 4
            if @year > 1952 
            @program_data << queen
            elsif @year < 1952
            @program_data << king
            else puts "As the year selected is 1952 and the Queen has reigned from February 1952, please indicate whether the decision was from January 1952." + bool_question
            month_of_1952 = gets.strip.to_i
            if month_of_1952 == 1
            @program_data << king
            else
            @program_data << queen
            end
            end     
        when 5
            case #need something here????
            when @program_data.include?("Vic")
                @partyname = "Victoria"
            when @program_data.include?("NSW")
                @partyname = "New South Wales"
            when @program_data.include?("SA")
                @partyname = "South Australia"
            when @program_data.include?("WA")
                @partyname = "Western Australia"
            when @program_data.include?("Qld")
                @partyname = "Queensland"
            when @program_data.include?("ACT")
                @partyname = "Australian Capital Territory"
            when @program_data.include?("NT")
                @partyname = "Northern Territory"
            when @program_data.include?("NI")
                @partyname = "Norfolk Island"
            when @program_data.include?("Cth")
                @partyname = "Commonwealth"
        when 6
            puts "Please enter the party name."
            @partyname = gets.strip
        when 9
        #this is for help.
        end
    end


    def single_party_procedure
        puts "does the "
    @case_affix.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
        admin_answer = "string"   
            case case_affix
            when 1
                @suffix = "Ex parte" 
            when 2
                @suffix = "Re"
            else
                puts "enter either 1 or 2."
        elsif admin_answer = n
        else puts "enter either Y or N. "
    end     
end
    



 #if [input].include?(variable_passed)