#require party
#require law-report
#require help

=begin
These are the definitions of each sections

exparte_1:
exparte_2:
party_1: 
party_2: 
party_ship:
party_3:
party_4:
year: 
law_report:
=end
#["exparte", "party_1", "party_2", "party_ship", "party_3", "party_4", "year", "law-report"]


quit = 1

while true
    if quit == 2
        break
else 

    system("clear") || system("cls")

    citation = []
    user_selections = { 
        exparte_1: "",
        exparte_2: "",
        party_1: "",
        party_2: "",
        party_ship: "",
        party_3: "",
        party_4: "",
        year_queries: 0,
        year_string: "",
        law_report: ""
    }

    user_selections_temp = user_selections.clone

    program_data = []

    puts "is it ex parte? Enter the relevant affix."
    user_selections_temp[:exparte_1] = gets.strip.to_s


    puts "Name first party."
    user_selections_temp[:party_1] = gets.strip.to_s

    # puts "Name second party."
    # party_2 = gets.strip.to_s
    # user_selections[party_2] = party_2

    # puts "Name ship."
    # party_ship = gets.strip.to_s
    # user_selections[party_ship] = party_ship

    puts "Enter Year."
    user_selections_temp[:year] = gets.strip.to_i

    puts "Enter Law Report details."
    user_selections_temp[:law_report] = gets.strip.to_s

    output = "#{user_selections_temp[:exparte_1]} #{user_selections_temp[:party_1]} #{user_selections_temp[:party_ship]} #{user_selections_temp[:year]}".split.join(" ") #this takes the entire string, splits it into an array defaulted by spaces, rejoins it with all single spaces and calls it "output"

    puts output

    File.open("output.txt", "a") { |file|  file.puts(output) }

    user_selections_temp.clear

    puts "would you like to enter another citation?"
    quit = gets.strip.to_i
      
end
end

# #{user_selections[party_1]} #{user_selections[party_2]} #{user_selections[year]} #{user_selections[law_report]}

##{user_selections[party_ship]}

#}

#ignore null entries




#puts "   v #{user_selections[2]}; #{user_selections[3]} #{user_selections[6]} #{user_selections[7]}"


#class year
#    def initialize
#        @year_date = year_date
#    end
#end




#"#{exparte_1} #{party_1} #{v party_2}#{check-party_3-present}#{; exparte_2 }#{party_3}#{ship_2} #{v party_4}#{year}#{law_report}"