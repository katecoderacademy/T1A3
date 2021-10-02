require_relative = '../xcitation'
require_relative = '../data'
require_relative = '../help'
require_relative = '../law-report'
require_relative = '../party'


describe government do
    it 'should return Queen if year is > 1952'
    before do 
        @data_hash["party_number"] = 1 
        @data_hash["year_queries"] = 1999
        @government_entity_answer == 4
    end
    expect(@data_hash["party_1"] = "The Queen")
end

# describe monarch_king do
#     it 'should return king if year is < 1952'
#     before do


#     end


# describe year_brackets do
#     it 'should return Queen if '

#     before do 
#         @data_hash["party_filled_#{@data_hash["party_number"]}"] = ""

#     expect(@data_hash["party_filled_#{@data_hash["party_number"]}"])
# end