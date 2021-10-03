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
        if vol_required == 1
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
        begin
        puts "Please enter your starting page reference/s. You may enter several pages seperated by a comma."
        starting_page = gets.strip
        unless starting_page.match?(/[[:digit:]]/) || starting_page.include?(" ") || starting_page.include?("-") || starting_page.include?("[") || starting_page.include?("]") || starting_page.include?("¶") || starting_page.include?(",") || starting_page.length <= 20
            raise ArgumentError, "No special characters"
        end
        if starting_page.empty? || starting_page.nil?
            raise ArgumentError, "No blank returns"
        end
        
        
         
        rescue
        puts "Starting page references cannot be blank, nor contain any special characters except for '-', commas, or square brackets. If you know how to paste a pilcrow sign into the input '¶' then this can also be entered. Please hit enter and try again."
        enter_key = gets
        retry
        end
        @data_hash["starting_page"]  = starting_page
        File.write('data.json', JSON.dump(@data_hash))
    end    

def law_report_name
        begin
        puts "Please enter your law report name in abbreviation form."
        law_report_name_entered = gets.strip
        unless law_report_name_entered.match?(/[[:alpha:]]/) || law_report_name_entered.include?(" ") || law_report_name_entered.include?("-")  || law_report_name_entered.length <= 30
            raise ArgumentError, "No special characters"
        end
        if law_report_name_entered.empty? || law_report_name_entered.nil?
            raise ArgumentError, "No blank returns"
        
           
        end
    rescue
        puts "Law report names cannot be blank, can only contain spaces and hypens. They can also only contain 30 characters. Please hit enter to return and try again."
        enter_key = gets
        retry
     end 

        @data_hash["law_report"]  = law_report_name_entered
        File.write('data.json', JSON.dump(@data_hash))
end


    def pinpoint_ref
        begin
            puts "Is a pinpoint reference required? #{@data_hash["bool_question"]}"
            pinpoint_required = gets.strip.to_i
            unless pinpoint_required.is_a?(Numeric) #numeric here because the answer is just numbers
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
                 unless pinpoint_ref_spec.match?(/[[:digit:]]/) || pinpoint_ref_spec.include?(" ") || pinpoint_ref_spec.include?("-") || pinpoint_ref_spec.include?("[") || pinpoint_ref_spec.include?("]") || starting_page.include?(",") || pinpoint_ref_spec.length <= 20
                    raise ArgumentError, "No special characters"
                 end
                 if pinpoint_ref_spec.empty? || pinpoint_ref_spec.nil?
                    raise ArgumentError, "No blank returns"
                 end

                 
                 rescue
                    puts "Pinpoint reference cannot be blank, can only contain spaces, square brackets and hyphens. They also cannot be more than 20 characters. Please hit enter to return and try again."
                    enter_key = gets
                    retry
                 end
            
            @data_hash["starting_page"]  = "#{@data_hash["starting_page"]},"
            @data_hash["pinpoint"]  = pinpoint_ref_spec
            File.write('data.json', JSON.dump(@data_hash))
             end
        end

    
