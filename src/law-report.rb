require_relative "party"
require_relative "law-report"
require_relative "help"
require_relative "data"
require 'json'
file = File.read('data.json')
data_hash = JSON.parse(file)

#class LawReport
    # def initialize
    #     @pilcrow = pilcrow
    #     @vol = vol
    #     @judicial_officer = judicial_officer
    #     @case_number = case_number
    #     @judicial_officer_types = ["Acting Judicial Officer", "Chief Judicial Officer", "Magistrate/Master", "Judge/s", "Senior Judicial Officer", "Administrative Judicial Officer/s", "Other"]

    #     @acting = ["Acting Chief Justice", "Acting Justice of Appeal",  "Acting Justices of Appeal", "Acting Justice",  "Acting Justices", ]
    #         @acting_abreviations = ["ACJ", "AJA", "AJJA", "AJ", "AJJ"]
    #     @chief = ["Chief Judge Administrator", "Chief Judge at Common Law",  "Chief Judge in Equity", "Chief Judge of the Commercial Division",  "Chief Justice" ]
    #         @chief_abreviations = ["CJA", "CJ at CL", "CJ in Eq", "CJ Comm D","CJ"]
    #     @other_judicial_officer = ["Chief Justice/District Court Judge", "Associate Justice", "Auxiliary Judge" "President","Vice-President", ]
    #         @other_judicial_officer_abreviations = ["DCJ", "AsJ", "AUJ", "P", "V-P"]
    #     @magistrates = ["Federal Magistrate", "Magistrate", "Master"]
    #         @magistrates_abreviations = ["FM","Magistrate", "Master"]
    #     @judge = ["Judge", "Judicial Registrar", "Justice of Appeal",  "Justices of Appeal", "Justice", "Justices"]
    #         @judge_abreviations = ["Judge","JR", "JA",  "JJA", "J", "JJ"]
    #     @senior = ["Senior Judge Administrator", "Senior Judge","Senior Judges", "Senior Puisne Judge"]
    #         @senior_abreviations = ["SJA",  "SJ", "SJJ",  "SPJ"]
    #     @admin_judicial_officers = ["President","Vice-President",  "Member",  "Senior Member",  "Commissioner", "Acting President", ]
    #         @admin_judicial_officers_abreviations = ["P", "V-P","Member","Senior Member","Commissioner","AP"]
    # end
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
        puts "Please enter the vol #{@data_hash["bool_question"]}"
        @data_hash["vol"] = gets.strip
        @data_hash["year_string"] = "(#{@data_hash["year_queries"]})"
        File.write('data.json', JSON.dump(@data_hash))
        else
        @data_hash["year_string"] = "[#{@data_hash["year_queries"]}]"

        File.write('data.json', JSON.dump(@data_hash))
        end
    end

        
        def pilcrow_req
            # if @program_data.includes?("no_vol")
            # puts "is a pilcrow/paragraph mark prior to the vol required?#{@data_hash["bool_question"]}"
            # @pilcrow_mark = gets.strip.to_i
            #     if @pilcrow_mark == 1
            #     @data_hash["pilcrow"] = "¶"
            #     File.write('data.json', JSON.dump(@data_hash))
            #     else
            #     end
            # else 
            # end
        end
    
    def starting_page
        puts "Please enter your pinpoint reference."
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

    def judge
    #     puts "do you have more than one judicial officer on your matter, or is your matter in an administrative jurisdiction?"
    #     @judicial_officer = gets.strip.to_i
    #     puts "Enter catergory of judicial officer."
    #         @judicial_officer_types.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #         end
    #             @judicial_officer_choice_1 = gets.strip.to_i
    #             case judicial_officer_choice_1
    #             when 1
    #                 puts "Chose the appropriate judicial officer."
    #                 @acting.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @acting_abreviations[judicial_officer_choice_2 - 1]
    #                 end    
    #             when 2
    #                 puts "Chose the appropriate judicial officer."
    #                 @chief.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @chief_abreviations[judicial_officer_choice_2 - 1]
    #                 end
    #             when 3
    #                 puts "Chose the appropriate judicial officer."
    #                 @other_judicial_officer.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @other_judicial_officer_abreviations[judicial_officer_choice_2 - 1]
    #                 end
    #             when 4
    #                 puts "Chose the appropriate judicial officer."
    #                 @magistrates.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @magistrates_abreviations[judicial_officer_choice_2 - 1]
    #                 end
    #             when 5
    #                 puts "Chose the appropriate judicial officer."
    #                 @judge.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @judge_abreviations[judicial_officer_choice_2 - 1]
    #                 end
    #             when 6
    #                 puts "Chose the appropriate judicial officer."
    #                 @senior.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @senior_abreviations[judicial_officer_choice_2 - 1]
    #                 end
    #             when 7
    #                 puts "Chose the appropriate judicial officer."
    #                 @admin_judicial_officers.each.with_index do |type, index| puts "#{index + 1}. #{type}"
    #                     judicial_officer_choice_2 = gets.strip.to_i
    #                     @judicial_officer = @admin_judicial_officers_abreviations[judicial_officer_choice_2 - 1]
    #                 end
    #             when 8
    #                 #Help
                end
        
    
    # def party_seperators
    #     puts "is the relevant party seperator a 'v'? #{@data_hash["bool_question"]}" 
    #     party_seperator_required = gets.to_i
    #     if party_seperator_required == 1
    #         puts "Please enter the relevant seperator."
    #         custom_seperator = gets.strip
    #         @data_hash["parties_seperator_#{@data_hash["parties_seperator_group"]}"] = custom_seperator
    #         File.write('data.json', JSON.dump(@data_hash))
    #     else @data_hash["parties_seperator_#{@data_hash["parties_seperator_group"]}"] = "v"
    #         File.write('data.json', JSON.dump(@data_hash))
    #     end
    #  end
