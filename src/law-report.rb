require_relative "help"
require_relative "data"
require 'json'
require 'colorize'
file = File.read('data.json')
data_hash = JSON.parse(file)


    def case_number
        begin
        puts "Does your matter have numerous decisions on the same matter? #{@data_hash["bool_question"]}"
        case_number_req = gets.to_i
        unless case_number_req.is_a?(Numeric)
            raise ArgumentError, "Answer must not be empty and must be a number."
            end
            unless case_number_req > 0 && case_number_req < 4
               raise ArgumentError, "Answer must be between 1 and 3."
            end
         rescue
            puts "Please enter a number between 1 and 3. Hit the enter key to try again."
            enter_key = gets
            retry
         end
        
        if case_number_req == 1
            begin
            puts "Please enter the number decision this is."
            case_number_input = gets.to_i
            unless case_number_input.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless case_number_input > 0 && case_number_input < 21
                   raise ArgumentError, "Answer must be between 1 and 20."
                end
             rescue
                puts "Please enter a number between 1 and 20. Hit the enter key to try again."
                enter_key = gets
                retry
             end
             @data_hash["case_number"] = "[No #{case_number_input}]"
             File.write('data.json', JSON.dump(@data_hash))
        end
    end
    def vol
        begin
        puts "Is a volume required? #{@data_hash["bool_question"]}"
        vol_required = gets.strip.to_i
        unless vol_required.is_a?(Numeric)
            raise ArgumentError, "Answer must not be empty and must be a number."
            end
            unless  vol_required > 0 &&  vol_required < 4
               raise ArgumentError, "Answer must be between 1 and 3."
            end
         rescue
            puts "Please enter a number between 1 and 3. Hit the enter key to try again."
            enter_key = gets
            retry
         end
        if vol_requried == 1
        begin
        puts "Please enter the vol"
        vol_entered = gets.strip.to_i
        unless vol_entered.is_a?(Numeric)
            raise ArgumentError, "Answer must not be empty and must be a number."
            end
            unless vol_entered > 0 && vol_entered < 1000
               raise ArgumentError, "Answer must be between 1 and 1000."
            end
         rescue
            puts "Please enter a number between 1 and 1000. Hit the enter key to try again."
            enter_key = gets
            retry
         end
         @data_hash["vol"] = vol_entered
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
        begin
            puts "Is a pinpoint reference required? #{@data_hash["bool_question"]}"
            pinpoint_required = gets.strip.to_i
            unless pinpoint_required.is_a?(Numeric)
                raise ArgumentError, "Answer must not be empty and must be a number."
                end
                unless pinpoint_required > 0 && pinpoint_required < 4
                   raise ArgumentError, "Answer must be between 1 and 3."
                end
             rescue
                puts "Please enter a number between 1 and 3. Hit the enter key to try again."
                enter_key = gets
                retry
             end
             if pinpoint_required == 1
                begin
                    puts "Please enter your pinpoint reference."
                pinpoint_ref_spec = gets.strip
                 if pinpoint_ref_spec.empty || pinpoint_ref_spec.nil
                 end
                 rescue
                    puts "Pinpoint reference cannot be blank. Please enter a reference."
                    enter_key = gets
                    retry
                 end
            
            @data_hash["starting_page"]  = "#{@data_hash["starting_page"]},"
            @data_hash["pinpoint"]  = pinpoint_ref_spec
            File.write('data.json', JSON.dump(@data_hash))
             end
        end

    
