class LawReport
    def initialize
        @pilcrow = pilcrow
        @vol = vol
        @judicial_officer = judicial_officer


        def vol
            puts "Is a volume required?" + bool_question
            vol_requried = gets.strip.to_i
            if vol_requried == 2
                @year_string = "[#{@year_queries}]"
                @program_data << "no_vol"
                break
            else
                @year_string = "(#{@year_queries}]"
                @vol = gets.to_i

        end
        def pilcrow_req
            if @program_data.includes?("no_vol")
            puts "is a pilcrow/paragraph mark prior to the vol required?" + bool_question
            @pilcrow_mark = gets.strip.to_i
                if @pilcrow_mark == 1
                @pilcrow = "¶"
                else
                end
            else 
            end
        end
    
    def pilcrow_req
        if @program_data.includes?("no_vol")
        puts "is a pilcrow/paragraph mark prior to the vol required?" + bool_question
            @pilcrow_mark = gets.strip.to_i
                if @pilcrow_mark == 1
                @pilcrow = "¶"
                else
                end
            else 
            end
        end    

        def pilcrow_req
            if @program_data.includes?("no_vol")
            puts "is a pilcrow/paragraph mark prior to the vol required?" + bool_question
            @pilcrow_mark = gets.strip.to_i
                if @pilcrow_mark == 1
                @pilcrow = "¶"
                else
                end
            else 
            end
        end



    end
    def judge

        puts "Enter caterogry of judicial officer."
            @judicial_officer_types.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                @judicial_officer_choice_1 = gets.strip.to_i
                case judicial_officer_choice_1
                when 1
                    puts "Chose the appropriate judicial officer."
                    @acting.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @acting_abreviations[judicial_officer_choice_2 - 1]    
                when 2
                    puts "Chose the appropriate judicial officer."
                    @chief.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @chief_abreviations[judicial_officer_choice_2 - 1]
                when 3
                    puts "Chose the appropriate judicial officer."
                    @other_judicial_officer.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @other_judicial_officer_abreviations[judicial_officer_choice_2 - 1]
                when 4
                    puts "Chose the appropriate judicial officer."
                    @magistrates.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @magistrates_abreviations[judicial_officer_choice_2 - 1]
                when 5
                    puts "Chose the appropriate judicial officer."
                    @judge.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @judge_abreviations[judicial_officer_choice_2 - 1]

                when 6
                    puts "Chose the appropriate judicial officer."
                    @senior.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @senior_abreviations[judicial_officer_choice_2 - 1]
                when 7
                    puts "Chose the appropriate judicial officer."
                    @admin_judicial_officers.each.with_index do { |type, index| puts "#{index + 1}. #{type}"}
                        judicial_officer_choice_2 = gets.strip.to_i
                        @judicial_officer = @admin_judicial_officers_abreviations[judicial_officer_choice_2 - 1]
                    end
                when 8
                    #Help
                    end
            
end