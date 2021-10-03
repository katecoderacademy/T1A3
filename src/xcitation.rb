require_relative "party"
require_relative "law-report"
require_relative "help"
require_relative "data"
require_relative "government"
require_relative "company"
require_relative "year"
require 'json'
require 'colorize'
file = File.read('data.json')

quit = 1

# :light_white , :blue :light_blue :light_black :italic

loop do
    begin
        sysclear = system("clear") || system("cls")
        puts "Welcome to xcitation, the x-citing way to cite law!\nWould you like to enter a citation?".colorize(:light_blue)
    puts "\n1. Yes \n2. No \n3. Help\n".colorize(:blue)   
start = gets.strip.to_i 
unless start.is_a?(Numeric)
    raise ArgumentError, "Answer must not be empty and must be a number."
    end
    unless start > 0 && start < 4
       raise ArgumentError, "Answer must be between 1 and 3."
    end
 rescue
    puts "Please enter a number between 1 and 3. Hit the enter key to try again."
    enter_key = gets
    retry
 end

case
when start == 3
    sysclear = system("clear") || system("cls")
    puts "xcitation is the easy way to cite law, based off the standards set out in the Australian Guide to Legal Citiation Version 4.\nThe AGLC is the preeminent guide for legal practitioners on how to structure citations, what types of law to cite, and when to cite.\nxcitation has a few limitations due to the limitation of time regarding\n\n1. the appending of pilcrows prior to citiation in certain specialist law reports; \n2. citing judges when the judgement is a joint judgement;\n3. Party seperators are currently only settable to 'v' and not customisable;\n4. The Monarch identification code is rough prior to Elizabeth II - Victoria died in January 1901 and was corinated in July 1836 so cases around this time should be date checked. More precise handling has not been implimented due to time constraints and the often inverse relationship between how often law is used and how old it is, especially criminal law. Elizbeth I is also ignored because of the unlikely need to cite case law from her period, especially in Australia.
    \n\nPress any key to return to the main menu.".colorize(:green)
continue = gets
when start == 2
quit = 2
break
when start == 1
break

end
end

#sysclear = system("clear") || system("cls")

while true
    if quit == 2
        sysclear = system("clear") || system("cls")
        puts "Thank you for using xcitiation. Please use us again soon!"
        break
        else 

        #file_data = File.read("data").split
        
        begin
        @data_hash = JSON.parse(file)
        rescue Errno::ENOENT
            sysclear = system("clear") || system("cls")
            puts "Sorry, the data file this program requires was not found. Please contact the source of this program to obtain the full set of required files."
            break
        end
        
            #Start dealing with the first party
        @data_hash["party_number"] = 1
        File.write('data.json', JSON.dump(@data_hash))
        year
        company
        government
        single_party_procedure
        write_name
        
        if @data_hash["is_single_party_#{@data_hash["party_number"]}"] != 1
         
            
            begin
            puts "Do you need to add a second party?#{@data_hash["bool_question"]}" 
            req_second_party = gets.strip.to_i
            unless  req_second_party.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless  req_second_party > 0 &&  req_second_party < 4
                   raise ArgumentError, "Answer must be between 1 and 3."
                end
             rescue
                puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                enter_key = gets
                retry
             end        
            
            if req_second_party == 1
                    @data_hash["party_number"] = 2
                    @data_hash["parties_seperator_1"] = "v"
                    File.write('data.json', JSON.dump(@data_hash))
                    company
                    government
                    write_name 
                    end
            begin
            ################################################## Explain concurrent judgements
            ##############################
            
            
                puts "Do you need to add a third party?#{@data_hash["bool_question"]}" 
            req_third_party = gets.strip.to_i
            unless  req_third_party.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless  req_third_party > 0 &&  req_third_party < 4
                   raise ArgumentError, "Answer must be between 1 and 3."
                end
             rescue
                puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                enter_key = gets
                retry
             end
                    if req_third_party == 1
                    @data_hash["party_number"] = 3             
                    if @data_hash["party_filled_2"] = 1
                        @data_hash["party_2"] = "#{@data_hash["party_2"]};"
                    else 
                        @data_hash["party_1"] = "#{@data_hash["party_1"]};"
                    end
                    File.write('data.json', JSON.dump(@data_hash))
                    company
                    government
                    single_party_procedure
                    write_name 
                    end
            begin
                    puts "Do you need to add a fourth party?#{@data_hash["bool_question"]}" 
            req_fourth_party = gets.strip.to_i
            unless  req_fourth_party.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless  req_fourth_party > 0 &&  req_fourth_party < 4
                   raise ArgumentError, "Answer must be between 1 and 3."
                end
             rescue
                puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                enter_key = gets
                retry
             end                
            
            if req_fourth_party == 1
                    @data_hash["party_number"] = 4
                    @data_hash["parties_seperator_2"] = "v"
                    File.write('data.json', JSON.dump(@data_hash))             
                    company
                    government
                    write_name 
                    end
        end
       
        case_number
        vol
        law_report_name
        starting_page
        pinpoint_ref      

        output_party = "#{@data_hash["case_affix_1"]} #{@data_hash["party_1"]} #{@data_hash["state_long_1"]} #{@data_hash["co_suffix_1"]} #{@data_hash["company_suffix_1"]}#{@data_hash["administration_status_1"]} #{@data_hash["parties_seperator_1"]} #{@data_hash["case_affix_2"]} #{@data_hash["party_2"]} #{@data_hash["state_long_2"]} #{@data_hash["co_suffix_2"]} #{@data_hash["company_suffix_2"]} #{@data_hash["administration_status_2"]} #{@data_hash["case_affix_3"]} #{@data_hash["party_3"]} #{@data_hash["state_long_3"]} #{@data_hash["co_suffix_3"]} #{@data_hash["company_suffix_3"]} #{@data_hash["administration_status_3"]} #{@data_hash["parties_seperator_2"]} #{@data_hash["case_affix_4"]} #{@data_hash["party_4"]} #{@data_hash["state_long_4"]} #{@data_hash["co_suffix_4"]} #{@data_hash["company_suffix_4"]} #{@data_hash["administration_status_4"]} #{@data_hash["case_number"]}".split.join(" ")
        output_reports = "#{@data_hash["year_string"]} #{@data_hash["vol"]} #{@data_hash["law_report"]} #{@data_hash["starting_page"]} #{@data_hash["pinpoint"]}".split.join(" ")

        puts "Thank you for your inputs. Please see your outputted citation. This has also been written to output.txt \n \n"

        puts output_party.colorize(:italic) + " " + output_reports

        begin
        File.open("output.txt", "a") { |file|  file.puts(output_party + " " + output_reports) }
        rescue Errno::EROFS
            puts "An error occured and the citation was unable to be written. Please manually copy and paste the ciation from the console into your text editor of choice."

        end

    end
    #REDO THE JSON TO LIMITED FIELDS    
    
    #data_hash = {"party_number": 0, "exparte_1": "", "exparte_3": "", "party_1": "", "party_suffix": "", "company_suffix_1": "", "administration_status_1": "", "co_suffix_1": "", "govt_abbreviation_1": "",  "party_2": "",   "case_affix_1": "", "party_3": "", "party_4": "", "party_co": "",   "party_ship_1": "", "party_ship_2": "", "judge_number": "",  "is_company_1": 0, "year_queries": 0, "year_string": "", "law_report": "", "starting_page": "", "vol": "", "pinpoint": "", "pilcrow": "", "state_short": "", "state_long": "", "judicial_officer_1": "", "judicial_officer_2": "", "bool_question": "\n1. Yes\n2. No", "is_government_1": 0 }
        #File.write('data.json', JSON.dump(data_hash))
        
        begin
        puts "would you like to enter another citation?#{@data_hash["bool_question"]}"
        quit = gets.strip.to_i
        unless  quit.is_a?(Numeric)
            raise ArgumentError, "Answer must not be empty and must be a number."
            end
            unless quit > 0 && quit < 3
               raise ArgumentError, "Answer must be between 1 and 2."
            end
         rescue
            puts "Please 1 for yes, or 2 for no. Hit the enter key to try again."
            enter_key = gets
            retry
         end

end



#ignore null entries