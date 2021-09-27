class party
    def initialize
        @partyname = partyname
        @company_suffix = company_suffix
        @bracket_status = bracket_status    
        @admin = admin
        @party_suffix = party_suffix   
        @co_suffix = co_suffix        
    end
    request_for_input = "/n Type Y or N and hit enter."
    
    def company
        puts "Is the party a company?" + request_for_input
        is_company = gets.downcase.to_s
            if is_company = "y" #Start helping user define their company party
            company_types = ["Limited (Ltd)", "Proprietary (Pty)", "Proprietary Limited (Pty Ltd)", "Incorporated (Inc)", "No Liability (NL)", "None of the above, or foreign company"]
                puts "Enter the number of the relevant company suffix, or 6 for a foreign registered company."
                    company_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        company_answer = "string"
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
                    @suffix = gets.to_s
                    break
                    break
            else
                puts "enter a number between 1 and #{company_types.length}."
            elsif is_company = n
            else puts "enter either Y or N. "
            puts "Is the company under external management?" + request_for_input
                is_under_admin = gets.to_downcase
            
                if is_under_admin = "y" 
            admin_types = ["in liquidation", "in provisional liquidation", "administrator appointed", "manager appointed", "reciever appointed"]
            puts "Select the relevant type of administration arrangement"
            admin_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                admin_answer = "string"   
                case admin_answer
                when 1
                    @bracket_status  = "(in liquidation)" #try to code so I don't need to waste bytes weith brackets here
                when 2
                    @bracket_status  = "(in provisional liquidation)"
                when 3
                    @bracket_status  = "(administrator appointed)"
                when 4
                    @bracket_status  = "(manager appointed)"
                when 5
                    @bracket_status  = "(reciever appointed)"
                else
                    puts "enter a number between 1 and #{admin_types.length}."
            elsif admin_answer = n
            else puts "enter either Y or N. "
            end    
        end
         puts "Is the company under external management?" + request_for_input
            is_under_admin = gets.to_downcase
            if is_under_admin = "y" 
            admin_types = ["in liquidation", "in provisional liquidation", "administrator appointed", "manager appointed", "reciever appointed"]
            puts "Select the relevant type of administration arrangement"
            admin_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                admin_answer = "string"   
                case admin_answer
                when 1
                    @suffix = "(in liquidation)" #try to code so I don't need to waste bytes weith brackets here
                when 2
                    @suffix = "(in provisional liquidation)"
                when 3
                    @suffix = "(administrator appointed)"
                when 4
                    @suffix = "(manager appointed)"
                when 5
                    @suffix = "(reciever appointed)"
                else
                    puts "enter a number between 1 and #{admin_types.length}."
            elsif admin_answer = n
            else puts "enter either Y or N. "
            end    
        end
            
        puts "Is the structure of the name 'NAME' and company?" + request_for_input
            company_ = gets.downcase.to_s
            if is_company = "y" #Start helping user define their company party
            puts "The appropriate suffix has been addeed to the name.\nPlease do not include characters after the 'and' when entering the party name"
                @co_suffix = "& Co"


            elsif is_company = "n"
            else puts "enter either Y or N. " #error handling
            return #error handling
    end
    def government
        puts "Is it a government part or representing government?" + request_for_input
        is_government = gets.downcase.to_s
        if is_government = "y" #Start helping user define which government
            government_types = ["State/Territory Government", "Australian Government", "Foreign Government"]
            puts "Select the relevant type of government"
            government_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                government_answer = "string"   
                if government_answer == 1
                    states_answer = "string"                    
                    states = ["Victoria", "NSW", "Queensland", "Tasmania", "South Australia", "Northern Territory", "Australian Capital Territory", "Western Australia", "Other"]
                    puts "Enter a number between 1 and #{states.length}."
                    states.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        states_answer = gets.to_i
                        case states_answer
                        when 1
                            program_data << vic
                            @bracket_status = "Vic"
                        when 2
                            program_data << nsw
                            @bracket_status = "NSW"
                        when 3
                            program_data << qld
                            @bracket_status = "QLD"
                        when 4
                            program_data << tas
                            @bracket_status = "Tas"
                        when 5
                            program_data << sa
                            @bracket_status = "SA"
                        when 6
                            program_data << nt
                            @bracket_status = "NT"
                        when 7
                            program_data << act
                            @bracket_status = "ACT"
                        when 8
                            program_data << wa
                            @bracket_status = "WA"
                        when 9
                            aus_ter_selection = 0
                            aus_ter_answer = 0
                            aus_ter = ["Cocos Islands", "Ashmore and Cartier Islands", "Australian Antarctic Territory", "Christmas Island", "Coral Sea Islands/Willis Island", "Heard Island and McDonald Islands", "Norfolk Island", "Jervis Bay Territory"]
                            puts "Enter a number between 1 and #{aus_ter.length}."
                            aus_ter.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                            aus_ter_answer = gets.to_i
                            case aus_ter_answer
                            when 1, 4
                                program_data << wa
                                @bracket_status = "WA"
                            when 2, 3, 6
                                program_data << cth
                                @bracket_status = "Cth"
                            when 5, 7
                                program_data << ni
                                @bracket_status = "NI"
                            when 8
                                program_data << act
                                @bracket_status = "ACT"
                            end
                        end

                elsif government_answer == 2
                    program_data << cth
                    
                elsif government_answer == 3
                    puts "Enter the name of the government, including any relevant suffixes."
                    @partyname = gets.strip
                    break
                end            
                #error handling - enter number between 1 and 3
            
            

            government_entity_answer = 0
            government_entity_answer = 0
            government_entity = ["Government Department", "Government Minister", "Government Officer", "The Monarch", "The Government itself", "Other (Manual Entry)"]
            puts "Enter a number between 1 and #{government_entity.length}."
            government_entity.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
            government_entity_answer = gets.to_i
                    case government_entity_answer
                    when 1
                        puts "Enter Government Department Name"
                        @partyname = gets.strip
                        break
                    when 2
                        minister_departments = "string"
                        puts "Enter the Ministers's Department/s" 
                        minister_departments = gets.strip
                        @partyname = "Minister for #{minister_departments}"
                        break
                    when 3
                        check_dpp = n
                        puts "Is it the Director of Public Prosecutions? Enter y or n."
                        check_dpp = gets.downcase.to_s
                        if check_dpp == y && program_data.include?("ni") && year_date < 2016
                            puts "As the case is a prosecution brought by the Norfolk Island administration, please manually enter the title of the individual or government representative who brought the action."
                            @partyname = gets.strip
                            break
                        elsif check_dpp == y 
                            @partyname = "Director of Public Prosecutions"
                            break
                    when 4


                    when 5

                    when 6

                    when 7

                    when 8

                    when 9
                    end







            

                end
                case government_answer
                when 1
                    @suffix == "(in liquidation)" #try to code so I don't need to waste bytes weith brackets here
                when 2
                    @suffix == "(in provisional liquidation)"
                when 3
                    @suffix == "(administrator appointed)"
                when 4
                    @suffix == "(manager appointed)"
                when 5
                    @suffix == "(reciever appointed)"
                else
                    puts "enter a number between 1 and #{admin_types.length}."
        
        elsif is_government = n
        else puts "enter either Y or N. "    
            




    def single_party_procedure
            puts "does the "
        case_affix = ["Ex parte", "Re", "ex rel"]
        case_affix.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
            admin_answer = "string"   
                case case_affix
                when 1
                    @suffix = "Ex parte" #try to code so I don't need to waste bytes weith brackets here
                when 2
                    @suffix = "Re"
                when 3
                    @suffix = "ex rel"
                else
                    puts "enter a number between 1 and #{admin_types.length}."
            elsif admin_answer = n
            else puts "enter either Y or N. "
            end     


    end
    end
 end


 #if [input].include?(variable_passed)