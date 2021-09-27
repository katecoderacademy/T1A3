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

citation = []
user_selections = { 
    exparte_1: "",
    exparte_2: "",
    party_1: "",
    party_2: "",
    party_ship: "",
    party_3: "",
    party_4: "",
    year: 0,
    law_report: ""
}

program_data = []

puts "is it ex parte? Enter the relevant affix."
exparte_1 = gets.strip.to_s
user_selections[:exparte_1] = exparte_1

puts "Name first party."
party_1 = gets.strip.to_s
user_selections[:party_1] = party_1

# puts "Name second party."
# party_2 = gets.strip.to_s
# user_selections[party_2] = party_2

# # puts "Name ship."
# # party_ship = gets.strip.to_s
# # user_selections[party_ship] = party_ship

puts "Enter Year."
year = gets.strip.to_i
user_selections[:year] = year

puts "Enter Law Report Deets."
law_report = gets.strip.to_s
user_selections[:law_report] = law_report

# user_selections.each do |element|
    #     if element == element.is_f?(Integer)
    #         citation << element
    #     end
    # end

# user_selections.each do |element|
#     puts element
# end

puts "#{user_selections[:exparte_1]}#{user_selections[:party_1]}#{user_selections[:party_ship]}#{user_selections[:year]}" 

File.open("output.txt", "a") do |file|

    file.write("#{user_selections[:exparte_1]}#{user_selections[:party_1]}#{user_selections[:party_ship]}#{user_selections[:year]}")
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