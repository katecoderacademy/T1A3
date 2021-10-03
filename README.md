# Kate T1A3 Project
This is my Terminal project submission for Coderacademy.

I have chosen to do a terminal app that helps people do legal citation.


# Statement of Purpose and Scope
The Australian Guide to Legal Citiation, the offical document scoping how to cite in Australia, has 30+ pages of rules around citing cases.
With the most common cases (criminal prosecutions), it should be able to provide parties to streamline the effort in doing citations. It also identifies whether the monarch at the time was Queen or King. It is designed to help Law students, Legal professionals, and other students who are required to do legal citations. It is designed to take some of the guesswork out of certain types of citations, and educate regarding how to do citation outside of the app and export almost user-ready citations
It is designed to Prompt the user to provide input and streamlines process of citing for Australian companies, guides user regarding how to put these organizations as parties, for Australian and State Government/Territories, assist with inserting them as parties
For single party cases, assist with entry. It also exports all citations to a file for copying and pasting out. Help is offered through the external help file.


# Features
1. The user will enter a menu asking if they wish to enter a citation. Pressing 1 starts the citation process. 2 will quit the program. 3 will display some information regarding the program as well as limitations. This prompt includes the same error handling as Boolean Prompt save for there being 3 numbers as acceptable inputs - 1, 2 and 3.

1. The user will encounter a String Prompt. If the year is < 1000 or > this year + 1, the prompt will say that the year is wrong and ask the user to hit enter to try and enter another year.

2. The user encounters a Boolean Prompt asking whether the entity they're entering is a company. If they answer 2, proceed to step 3. If they answer 1, they are then taken to a Numerical Prompt for a number between 1 to 6. If they answer between 1 - 5 then the app will fill in the 'company_suffix_$' field itself. If they select 6, the user will receive a String Prompt limited to 12 characters, dashes, full stops and spaces.
Once they have selected their company suffix, user receives a Boolean Prompt if the company is under external management. If they answer 1, they are then provided with a Numerical Prompt to chose between one of 5 administration arrangements. All of these will write an AGLC approved suffix to 'administration_status' to show the party's external administration arrangement. Once they have chosen the administration type or pressed 2 at the previous Boolean Prompt, they will receive a Boolean Prompt as to if the company has the name of the structure "and Company" eg. "Charlie and Company". If the user answers 1 then the AGLC suffix will be added to the 'co_suffix_$' field.

3. The user encounters a Boolean prompt asking if the party is a government. If they answer no, they will proceed to step 4. If they answer yes, the program will check if the year they specified is before 1901. If the year is >1900, the user is asked to manually enter the party's title. If false, the program will provide a Numerical Prompt. If the user answers 1, it will record the 'govt_abbreviation_$' as Commonwealth. If the user answers 3, it will provide a string prompt with a limit to alpha characters, spaces, dashes, round brackets and 80 characters. If the user answers 2, the user will then be asked to select from a Numerical Prompt of States/Territories or other. If the user selects a state, the state abbreviation will be recorded in 'govt_abbreviation_". If the user choses other, they will be asked to chose from a list of territories. Most territories will map their answer to a jurisdiction that has judicial authority over the state and push that value to 'govt_abbreviation_', except Norfolk Island which will record 'NI'. The values of 1 and 2 at the earlier prompt are then checked again, and if true, the app will provide a Numercial Prompt of Australian and State/Territory governmment entites to chose from which accepts numbers up to 7. If the user choses 1, they are provide a String Prompt to enter the government department name, accepting alphanumeric characters, spaces, dashes, round and square brackets up to 80 characters. If the user choses 2, the user will be given a Boolean Prompt as to whether the relevant minister is the Attorney-General. If 1, the user will recieve another Boolean Prompt asking if the action was a relator action (ie on behalf of someone without capacity to sue). If 1, the 'party_$' will be filled with the title and relevant state as well as the relator action suffix. If 2, the Attorney General will be filled but without the suffix. If the minister is not an Attorney-General, the user recieves a String Prompt asking to enter the Minister's full title including relevant departments. THis string takes 80 characters including dashes, spaces, open and closed brackets (both types). This will then populate the "party_$" field. If the user chose 3 to the Numercial Prompt of Australian and State/Territory governmment entites, they will be provided a Boolean Prompt if the party is the "Director of Public Prosecutions". If 1, the app will then check if the govt_abbreviation is Norfolk Island and year is < 2016. If so, it provides a String Prompt to enter the title of the prosecuting offical and the app will then populate "party_$". This can be up to 80 characters, with spaces, dashes, open and closed brackets. If not, the app will then populate "party_" with "Director of Public Prosecutions". If user answers 2 to the question about Director of Public Prosecutions, they are then prompted to enter the name of the government official who brought the action, up to 80 characters, with spaces, dashes, open and closed brackets. This will populate to "party_$". If the user choses 4 for Crown Prosecution to the Australian and State/Territory governmment entites, the app will query if the current Party is party 1 or party 3. If the party is not party 1 or 3, "party_" is set to R. If it is either, it will quiery the year. If the year > 1952, it will set "party_$" to "The Queen.". If the year is < 1901 and > 1952, the app will set "party_$" to "The King". Whilst there is other functional code that can query years all the way back until 1603, this is currently bypassed and the user would have had to enter the Monarch's title manually (as the program won't allow government parties < 1901). If the year happens to be 1952, the user recieves a Boolean Prompt as to whether the month of the judgement was January 1952. If 1, then "party_" is set to "the King", and otherwise set to "the Queen". This format is in line with the AGLC requirements. If the user choses 5 for The Government itself to the Australian and State/Territory governmment entites, it will populate the 'party_$' field by quierying the content of the 'govt_abbreviation_$' field. If the user choses 6 to the Australian and State/Territory government entities, the user receives a String Prompt limited to alphanumeric characters, spaces, dashes, square and round brackets, and 80 characters in length.

4. If the "party_$" string is not already populated, the user will receive a Boolean Prompt asking if the proceeding is a single party procedure. If 1, they are served a Boolean Prompt whether the matter requires a procedural phrase affix. If they answer 1, they will be provided with a Boolean prompt to select from one of the two options of affix.

5. Once they have selected an affix, or they answered 2 to the question of 'single party proceeding', a String Prompt to enter the name of the party, which can take alphanumeric characters, spaces, dashes, apostrophes and be up to 80 characters.

6. The app will then check if the user has answered 1 'single party proceedure'. If false, it will add a party seperator character, then start prompting for steps 2-3 and 5 again for party 2.

7. If the single party procedure for party_1 was true, party 2 will not be prompted.

8. The app will then serve a Boolean prompt as to whether the first party from the concurrent judgement is required. If true, it will go through steps 2-5.

9. The app will then serve a Boolean prompt as to whether a second party from the concurrent judgement is required. If true, it will go through steps 2-3 and 5.

10. The app will then serve a Boolean prompt asking if there were more than one decision on the matter. If 1 is answered, the user is then provided a Numerical Prompt to enter a number between 1 and 20. This is then inserted into the 'case_number' field.

11. If the user answered 2 or once the user provides a number, the user is served a Boolean Prompt asking if a Volume is required. If the user answers 1, they are then provided a Numeric Prompt to enter a number between 1 and 1000. If 2, the user skips this step. The year of the case is also wrapped in the appropriate brackets and stored in a string field.

12. The user is then served a String prompt asking about the name of the Law Report. The string can be alphabetic, include spaces and dashes and cannot be longer than 30 characters.

13. The user is served a String Prompt asking for the starting page of the judgement. The string prompt can accept spaces, digits, dashes, square and round brackets, commas and pilcrows and a length of 20 characters.

14. The user is served a Boolean Prompt asking if a pinpoint reference is required. If 1 then the user will be served a String Prompt accepting digits, spaces, dashes, square brackets, and commas and with a length of 20 characters.

15. Once this is entered the program takes all the data, converts all the stored hash values into a string, splits the string into an array and then joins back to remove all excessive whitespace but to retain a single space between each element. This citation is output to the screen and to a file called 'output.txt'.

16. The user is then asked if they want to enter another citation. If 1, the JSON file is cleared, and the user is prompted through the steps above again. If 2 the program will quit.


# Diagram of Control Flow
!(/docs/LRS_Reference.drawio.png)
!(/docs/party_names.drawio.png)
!(/docs/party_names.year.png)

# Implimentation Plan
Edit 
copypasta from thingy

# Help File
# Manual
Welcome to xCitation, the easy way to cite law.

## Goals of xCitation
xCitation aims to make citing law easier. Focused on Australian Law, it tries to take out some of the steps in terms of specific formatting required by the pre-eminent case law style guide in Australia, the *Australian Guide to Legal Citation*. Now in its fourth edition, this guide can be very specific in the way it requires the styling of Australian (and often UK) judgements. 
**NOTE** We encourage you to continue using the AGLC in conjunction with xCitation as the styling guides run beyond the current scope of xCitation. 

To start, run xCitation. 

## Note on using xCitation
xCitation requires the user to enter numbers and then hit the enter key. When this manual refers to entering numbers, it also implies hitting the enter key after hitting the number.
**NOTE:** If you encounter an error, hit the enter key as instructed to return to the prompt to re-enter the requested information. Note that any data you enter on an error page will not be saved.


## Running xCitiation
When you first run xCitation, a menu will appear. 
Hit 1 to begin citing law. Hit 2 to quit. Hit 3 to read some background on the program.

## Year
xCitation will first ask you to enter year.
Years can be between 1000 and the current year. Years must be a number.

## Party
After entering the year, xCitation will ask you a series of questions relating to the party. 
**NOTE:** The AGLC states that if one group of parties are suing another group of parties, then only the *first-named* is listed on the citation. You must identify who the first party is from the judgement.  xCitation also offers including details from concurrent judgements. However, this is when two distinct matters are heard concurrently if the court holds it complies with all of its obligations under law. E.g. *A-G (Vic) ex rel Dale v Commonwealth* (1945) 71 CLR 237 - which has party 1 as the Attorney-General of Victoria, party 3 as 'Dale' and party 4 as 'the Commonwealth'.

1. Is the party a company? 
If the company ends in Pty, Ltd, Pty Ltd, NL, or Inc, then the party is probably a company. 
a) Structure Suffixes
If you nominate your party as a company, you will be presented with a list of common company structure affixes (such as those listed above) plus the option for a manual entry for a foreign affix. The manual entry option allows  up to 12 characters, and can include letters, full stops and hyphens. Note this is merely for an unlisted suffix and not for the entire company name.
b) External Management
You will be asked to answer whether your company is under external management.
These arrangements usually occur in Australia when a company is potentially insolvent. They could take the form of calling in an administrator to try to trade the business out of insolvency, to other professionals such as receivers, managers, or liquidators whose job it is usually to convert whatever assets are left into a return for the investors, or to try to claw back money and/or pursue former officers for money. 
The best way to determine the status of the company is to search by company number on the Australian Securities and Investments Commission (ASIC) website to see what form of notices are present. Old judgements should make clear the status of the company during the matter.
c) '& Company' suffix
If a company's name is 'Johnson and Company," the AGLC set out that the name be shorted to "Johnson & Co". If your party has this structure of name, select true, and do not add anything after "and Company" starts when you are later asked to enter a name.
2. Is the party a government?
If you responded yes to company, you will not be asked if the party is a government. 
Governments include foreign governments.
**NOTE:** Government entities before Federation in 1901 are manual entry only. 
If your case is after 1901, you will be asked whether your party is a State/Territory, 

Corporatised entities that are owned by government but not directly controlled (ie Australia Post and the Australian Broadcasting Corporation) but their would be input by way of manual entry.  'Government' is a best fit for a department, minister, or other entity that has its powers as a result of its association with the relevant government.

a) State/Territory Government
If your party is a department, minister, or other entity that has its powers as a result of its association with the relevant government, select this option.  There is a submenu for smaller Territories. 
b) Commonwealth
This will note your government as the Commonwealth.
c) Foreign Government
This is manual entry, limited to spaces, dashes, letters and round brackets. They can contain up to 80 characters.

a) State, Territory and Commonwealth Options
States, Territories and the Commonwealth will be presented with a number of options in terms of government entities.

 - Government Department: An organisation within government. 'the' should be omitted.
 - Government Minister:  A government minister. Their title should be manually entered without any proceeding 'the' in its shortened form and  can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters.
 - Government Officer:  When a government officer such as a secretary of a government department are sued, this provides a manual option to enter that officer. It should be entered by way of 'title' ,  'Department'.  (with a comma separating the names). e.g *Montenegro v Secretary, Department of Education* [2020] FCAFC 210. They can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters. A Director of Public Prosecution is an example of one as well. 
 - The Monarch/Crown:  When a prosecution is filed, it is frequently filed in the name of the monarch by way of 'Crown Prosecution'. The AGLC requires identification of the Monarch when the Crown is the second named party. xCitation can determine the Monarch back through until 1603 (although assisted inputting of prosecutions prior to 1901 is currently unsupported).
 - The Government itself: When a state sues an individual, another state, or is sued. e.g *Palmer v Western Australia*[2021] HCA 5. This option will take your earlier jurisdictional selection and apply it to your party name. 
 - Other (Manual Entry): used for publicly owned corporatised entities or anything that does not fit with the other options. They can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters.

3. Single Party Application
Sometimes certain individuals or governments make applications to courts to resolve points of law. More frequently, single party applications appear in the High Court after Governments make special leave applications to resolve conflicts of judgement on certain points of law i.e. evidence law, seeking that the High Court rule whose state law prevails.  Alternatively, applicants can seek that a law is ruled upon or judgement regarding guardianship/capacity. xCitation presumes that all ex rel, Ex parte, and Re matters are in some way a 'single party application'; such as *Re Palmer; George v McIntyre*(1902) 2 SR (NSW) 200 has Palmer as a 'single party application' and 'George v McIntyre' would be first concurrent and second concurrent party respectively. 

If respond yes to single party application, you will not be asked to enter details for the second party. 

**NOTE:** As Attorney-General/s bring Ex rel applications, these are sought through setting the Attorney-General as the first party and are not available through the Single Party Application. 

The matter cited would indicate if the matter requires an affix of either 'Ex parte' or 'Re'. 

4. Entering the Party Name
If the party name has not been entered earlier, you will now be prompted to enter the party name. Names can contain spaces, apostrophes, dashes and letters and numbers and can contain up to 80 characters.

## Other Parties
If you did not indicate that the action was a single party application, you will be asked if need to add a second party. If you respond yes, you will be asked to repeat the process set out above. 

xCitation also allows the inputting of concurrent judgements. Note that if you select single party application when entering a first concurrent party, you won't be able to enter a fourth party. 

## Case Number
Occasionally judgements will have numerous judgements around the same facts. Sometimes these occur as the judge makes preliminary rulings on particular matters so as to progress the main part of the matter. Case numbers can be entered up to 20 and will be inserted into the citation prior to the year. *Bahr v Nocolay [No2]*(1988) 164 CLR 604.

## Volume
Some Law Reports order by year and some by volume. If the legal source cited does not include a volume, xCitation will wrap square brackets around the year to indicate it to be the organising key. If a volume is entered, the year will be wrapped in round brackets.

 ## Law Report Name
Law Report is the authority from which the law is being referenced.  The relevant abbreviation should be entered. The abbreviation can frequently be found at the top of the page. Law Reports can contain spaces and hyphens and up to 30 characters.

 ## Starting Page
If the work is hard copy the starting page will be the first page of the judgement being cited. xCitation supports entry of multiple page references and hyphens, spaces, commas, square brackets and the pilcrow (¶) if the user pastes it into the window. It supports input of up to 20 characters.  As this is mandatory, the user should enter a pinpoint reference if the judgement has no pages listed, rather than entering in them into the next prompt.

 ## Pinpoint References
If the user hasn't put these in during the last prompt, these should be inserted if possible.  This field supports hyphens, spaces, commas, square brackets. It supports input of up to 20 characters.

## Output
The reference is then outputted for the user on the screen and placed into the text file "output.txt".  Please note due to technical limitations that italicisation needs to be manually added to citations for all words prior to the year.






## Requirements
Ruby 2.7.1

## Dependencies
This program uses two Ruby gems;
1. JSON 2.5. (used for storage of data)



## Installation
All files should be stored in the same directory. Run xcitation.rb
## Use




# Testing Procedures
[Testing Page 1] (/docs/Xcitiation testing.pdf)
[Testing Page 2] (/docs/Xcitiation testing2.pdf)
