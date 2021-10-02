require_relative "party"
require_relative "law-report"
require_relative "help"
require_relative "data"
require 'json'
file = File.read('data.json')
data_hash = JSON.parse(file)


    def case_number
        puts "Does your matter have numerous decisions on the same matter? #{@data_hash["bool_question"]}"
        case_number_req = gets.to_i
        if case_number_req == 1
            puts "Please enter the number decision this is."
            case_number_input = gets.to_i
            @data_hash["case_number"] = "[No #{case_number_input}]"
            File.write('data.json', JSON.dump(@data_hash))
    
        end
    end
    def vol
        puts "Is a volume required? #{@data_hash["bool_question"]}"
        vol_requried = gets.strip.to_i
        if vol_requried == 1
        puts "Please enter the vol"
        @data_hash["vol"] = gets.strip
        @data_hash["year_string"] = "(#{@data_hash["year_queries"]})"
        File.write('data.json', JSON.dump(@data_hash))
        else
        @data_hash["year_string"] = "[#{@data_hash["year_queries"]}]"

        File.write('data.json', JSON.dump(@data_hash))
        end
    end    
    def starting_page
        puts "Please enter your starting page reference."
        starting_page = gets.strip
        @data_hash["starting_page"]  = starting_page
        File.write('data.json', JSON.dump(@data_hash))
    end    

    def law_report_name
        puts "Please enter your law report name in abbreviation form."
        law_report_name_entered = gets.strip
        @data_hash["law_report"]  = law_report_name_entered
        File.write('data.json', JSON.dump(@data_hash))
    end


    def pinpoint_ref
            puts "Please enter your pinpoint reference."
            pinpoint_ref_spec = gets.strip
            @data_hash["pinpoint"]  = pinpoint_ref_spec
            File.write('data.json', JSON.dump(@data_hash))
        end

    
