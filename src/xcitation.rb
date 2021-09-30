
require_relative "party"
#require_relative "law-report"
require_relative "help"
require_relative "data"
require 'json'
file = File.read('data.json')

#bool_question = puts "\n1. Yes\n2. No"


#@citition = []
#@program_data = []

#sysclear = system("clear") || system("cls")
quit = 1
while true
    if quit == 2
        break
        else 
        #program_data []
        # citation = []
        # user_selections = { 
        #     exparte_1: "",
        #     exparte_2: "",
        #     party_1: "",
        #     party_2: "",
        #     party_ship: "",
        #     party_3: "",
        #     party_4: "",
        #     year_queries: 0,
        #     year_string: "",
        #     law_report: "",
        #     state_short: "",
        #     state_long: "",
        # }

        # user_selections_temp = @user_selections.clone
#file_data = File.read("data").split
data_hash = JSON.parse(file)
        data_hash["party_number"] == 1
        File.write('data.json', JSON.dump(data_hash))
        party_1 = Party.new

            # if program_data.include?("exrel") || program_data.include?("ex_affix") || program_data.include?("")
                
            #     else
            #     puts "Do you need to add a second party?#{bool_question}" 
            #     req_second_party = gets.strip.to_i
            #     if req_second_party == 1
            #     data_hash["party_number"] = "2"
            #     party_2 = Party.new
            #     end
            # end
        data_hash["party_number"] == 3

        File.write('data.json', JSON.dump(data_hash))
        party_3 = Party.new

        #if program_data.include?("exrel") || program_data.include?("ex_affix") || program_data.include?("")
            
            # else
            # puts "Do you need to add a second party?#{bool_question}"
            # req_second_party = gets.strip.to_i
            # if req_second_party == 1
            # party_2 = party.New
            # end
        # end
        
        
        data_hash = {"party_number": 0, "exparte_1": "", "exparte_3": "", "party_1": "", "party_suffix": "", "company_suffix_1": "", "administration_status_1": "", "co_suffix_1": "", "govt_abbreviation_1": "",  "party_2": "",   "case_suffix_1": "", "party_3": "", "party_4": "", "party_co": "",   "party_ship_1": "", "party_ship_2": "", "judge_number": "",  "is_company_1": 0, "year_queries": 0, "year_string": "", "law_report": "", "starting_page": "", "vol": "", "pinpoint": "", "pilcrow": "", "state_short": "", "state_long": "", "judicial_officer_1": "", "judicial_officer_2": "", "bool_question": "\n1. Yes\n2. No", "is_government_1": 0 }
        File.write('data.json', JSON.dump(data_hash))
        
        puts "would you like to enter another citation?#{@bool_question}"
        quit = gets.strip.to_i
    end
        

end
#ignore null entries