# Kate Beaumont - T1A3 Terminal Project
Project: xCitiation
# Repository
[https://github.com/katecoderacademy/T1A3/](https://github.com/katecoderacademy/T1A3/)


# Statement of Purpose and Scope
The *Australian Guide to Legal Citiation*, the offical document scoping how to cite in Australia, has 30+ pages of rules that address citing legal judgements. These rules relate disproportionally to companies, governments, and prosecutions.
When citing a case, the citation within the judgement could be copy and pasted. This comes with the following issues;
1.	It may not be in the appropriate AGLC shortened form, or some of the elements aren’t in the appropriate form;
2.	Parts of the judgement may not be expressed in the appropriate form (identification of the appropriate monarch when the Crown is the second party);
3.	There are more appropriate sources of the judgement (an Authorised Law Report);
4.	Specific case types require unique means of citation (a suit against a vessel directly/in personam only cites the ship and not who is suing the ship) 
While it is possible to carefully read and apply the 30+ pages of rules, this can make citation very time consuming. 
xCitation aims to streamline entering the most common citations. These include;
1.	Criminal prosecutions involving the Director of Public Prosecutions, or the Crown, which also identifies the monarch at the time (required to be identified of the Crown is the second party);
2.	Matters involving an Attorney-General, or when a Government is a party;
3.	Matters where a Company is a party, providing the appropriate contractions for suffixes, including when a party is under external management.
xCitation is designed to assist a range of users, including 
1.	Law students, 
2.	Legal professionals, and 
3.	other students who are required to do legal citations.
It is designed to take some of the guesswork out of certain types of citations, and educate regarding how to do citation outside of the app and export almost user-ready citations.
xCitation seeks to prompt the user for input through a combination of Boolean options, numeric options and string options, and through this process 
1.	streamline the process of citing for Australian companies and governments;
2.	provide shortcuts for common parties such as the Director of Public Prosecutions, the Crown and governments;
3.	automatically apply appropriate brackets to years depending on whether a the Volume or Year is the index;
4.	provide input of up to two concurrent matters being heard under a single citation. 
The citations are shown on screen and exported to a separate file. 
Help is offered through an external help file. 

# Features
## Definitions
-	String Prompt: a prompt accepting the input of characters, depending on the parameters of the input. All inputs are limited to 80 characters or less, some have restrictions on the types of symbols that can be used. 
-	Boolean Prompt: a prompt accepting the input of either 1 (meaning yes) or 2 (meaning no). These prompts do not accept any other input.
-	Numeric Prompt: a prompt accepting a numerical input limited to a single digit within a range that does not exceed the number of options listed on screen. 
-	$: Denotes a number determined by the JSON hash “party_number” as required by the app.

## Outline of Features
1. The user will enter a menu asking if they wish to enter a citation. Pressing 1 starts the citation process. 2 will quit the program. 3 will display some information regarding the program as well as limitations. This prompt includes the same error handling as Boolean Prompt save for there being 3 numbers as acceptable inputs - 1, 2 and 3.

1. The user will encounter a String Prompt. If the year is < 1000 or > this year + 1, the prompt will say that the year is wrong and ask the user to hit enter to try and enter another year.

2. The user encounters a Boolean Prompt asking whether the entity they're entering is a company. If they answer 2, proceed to step 3. If they answer 1, they are then taken to a Numerical Prompt for a number between 1 to 6. If they answer between 1 - 5 then the app will fill in the 'company_suffix_$' field itself. If they select 6, the user will receive a String Prompt limited to 12 characters, dashes, full stops and spaces.
Once they have selected their company suffix, user receives a Boolean Prompt if the company is under external management. If they answer 1, they are then provided with a Numerical Prompt to chose between one of 5 administration arrangements. All of these will write an AGLC approved suffix to 'administration_status' to show the party's external administration arrangement. Once they have chosen the administration type or pressed 2 at the previous Boolean Prompt, they will receive a Boolean Prompt as to if the company has the name of the structure "and Company" eg. "Charlie and Company". If the user answers 1 then the AGLC suffix will be added to the 'co_suffix_$' field.

3. The user encounters a Boolean prompt asking if the party is a government. If they answer no, they will proceed to step 4. If they answer yes, the program will check if the year they specified is before 1901. If the year is >1900, the user is asked to manually enter the party's title. If false, the program will provide a Numerical Prompt. If the user answers 1, it will record the 'govt_abbreviation_$' as Commonwealth. If the user answers 3, it will provide a string prompt with a limit to alpha characters, spaces, dashes, round brackets and 80 characters. If the user answers 2, the user will then be asked to select from a Numerical Prompt of States/Territories or other. If the user selects a state, the state abbreviation will be recorded in 'govt_abbreviation_$". If the user choses other, they will be asked to chose from a list of territories. Most territories will map their answer to a jurisdiction that has judicial authority over the state and push that value to 'govt_abbreviation_$', except Norfolk Island which will record 'NI'. The values of 1 and 2 at the earlier prompt are then checked again, and if true, the app will provide a Numercial Prompt of Australian and State/Territory governmment entites to chose from which accepts numbers up to 7. If the user choses 1, they are provide a String Prompt to enter the government department name, accepting alphanumeric characters, spaces, dashes, round and square brackets up to 80 characters. If the user choses 2, the user will be given a Boolean Prompt as to whether the relevant minister is the Attorney-General. If 1, the user will recieve another Boolean Prompt asking if the action was a relator action (ie on behalf of someone without capacity to sue). If 1, the 'party_$' will be filled with the title and relevant state as well as the relator action suffix. If 2, the Attorney General will be filled but without the suffix. If the minister is not an Attorney-General, the user recieves a String Prompt asking to enter the Minister's full title including relevant departments. This string takes 80 characters including dashes, spaces, open and closed brackets (both types). This will then populate the "party_$" field. If the user chose 3 to the Numercial Prompt of Australian and State/Territory governmment entites, they will be provided a Boolean Prompt if the party is the "Director of Public Prosecutions". If 1, the app will then check whether the government is Norfolk Island and year is < 2016. If so, it provides a String Prompt to enter the title of the prosecuting offical and the app will then populate "party_$". This can be up to 80 characters, with spaces, dashes, open and closed brackets. If not, the app will then populate "party_$" with "Director of Public Prosecutions". If user answers 2 to the question about Director of Public Prosecutions, they are then prompted to enter the name of the government official who brought the action, up to 80 characters, with spaces, dashes, open and closed brackets. This will populate to "party_$". If the user choses 4 for Crown Prosecution to the Australian and State/Territory governmment entites, the app will query if the current Party is party 1 or party 3. If the party is party 1 or 3, "party_$" is set to R. If it is neither, it will query the year. If the year > 1952, it will set "party_$" to "The Queen". If the year is < 1901 and > 1952, the app will set "party_$" to "The King". Whilst there is other functional code that can query years all the way back until 1714, this is currently bypassed and the user would have had to enter the Monarch's title manually (as the program won't allow government parties < 1901). If the year happens to be 1952, the user recieves a Boolean Prompt as to whether the month of the judgement was January 1952. If 1, then "party_$" is set to "the King", and otherwise set to "the Queen". This format is in line with the AGLC requirements. If the user choses 5 for The Government itself to the Australian and State/Territory governmment entites, it will populate the 'party_$' field by quierying the content of the 'govt_abbreviation_$' field. If the user choses 6 to the Australian and State/Territory government entities, the user receives a String Prompt limited to alphanumeric characters, spaces, dashes, square and round brackets, and 80 characters in length.

4. If the "party_$" string is not already populated, the user will receive a Boolean Prompt asking if the proceeding is a single party procedure. If 1, they are served a Boolean Prompt whether the matter requires a procedural phrase affix. If they answer 1, they will be provided with a Boolean prompt to select from one of the two options of affix.

5. Once they have selected an affix, or they answered 2 to the question of 'single party proceeding', a String Prompt to enter the name of the party, which can take alphanumeric characters, spaces, dashes, apostrophes and be up to 80 characters.

6. The app will then check if the user has answered 1 'single party proceedure'. If false, it will add a party seperator character, then start prompting for steps 2-3 and 5 again for party 2.

7. If the single party procedure for party_1 was 1, prompts for party_2 will not be triggered.

8. The app will then serve a Boolean prompt as to whether the first party from the concurrent judgement is required. If 1, it will go through steps 2-5.

9. The app will then serve a Boolean prompt as to whether a second party from the concurrent judgement is required. If true, it will go through steps 2-3 and 5.

10. The app will then serve a Boolean prompt asking if there were more than one decision on the matter. If 1 is answered, the user is then provided a Numerical Prompt to enter a number between 1 and 20. This is then inserted into the 'case_number' field.

11. If the user answered 2 or once the user provides a number, the user is served a Boolean Prompt asking if a Volume is required. If the user answers 1, they are then provided a Numeric Prompt to enter a number between 1 and 1000. If 2, the user skips this step. The year of the case is also wrapped in the appropriate brackets and stored in a string field.

12. The user is then served a String prompt asking about the name of the Law Report. The string can be alphabetic, include spaces and dashes and cannot be longer than 30 characters.

13. The user is served a String Prompt asking for the starting page of the judgement. The string prompt can accept spaces, digits, dashes, square and round brackets, commas and pilcrows and a length of 20 characters.

14. The user is served a Boolean Prompt asking if a pinpoint reference is required. If 1 then the user will be served a String Prompt accepting digits, spaces, dashes, square brackets, and commas and with a length of 20 characters.

15. Once this is entered the program takes all the data, converts all the stored hash values into a string, splits the string into an array and then joins back to remove all excessive whitespace but to retain a single space between each element. This citation is output to the screen and to a file called 'output.txt'.

16. The user is then asked if they want to enter another citation. If 1, the JSON file is cleared, and the user is prompted through the steps above again. If 2 the program will quit.

# Diagram of Control Flow

![Law Report](./docs/law-report.png)

![Year](./docs/year.png)

![Party Names](./docs/party_names.png)

# Implementation Plan

[Wrike Link (not publicly accessible without an account](https://www.wrike.com/open.htm?id=765082856)

[Wrike list of tasks printed in PDF](./docs/wrike-tasks.pdf)

![wrike screenshot](./docs/wrikescreenshot.png)


1.	Initially, the program requires a proof of concept as to inputs and outputs; that it will take inputs of party names, the year, the citation, and then output it into useful data that is also output to a text file. 
2.	Next, the party structures need to be created, focusing on the company and government. This is because they would be the most used and useful routines as they cover on the majority of litigation.
3.	A year routine needs to be created. 
4.	Next, the Law Report routines need to be created. 
5.	Finally, it needs to be considered if a restructuring of the code needs to occur and ensuring that all of the above routines can be accessed and run. 

# Presentation

[PDF Of Presentation](./docs/wrike-tasks.pdf)

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

## Requirements for xCitation

1.	Ruby 2.7.2. 
(run on a system with a 64 bit Operating System with at least 4GB of ram and sufficient space for the operating system swap file and 10MB free for outputting citations)
2.	JSON 2.5
Gemlock has been included to streamline the process of installing of the required gem, “JSON”. 

## Installing xCitation

To install xCitiation, unzip it to a directory and run
*CODE* ruby xcitation.rb /*code*

## Main Menu

When xCitation is first run, a menu will appear. 
Hit 1 to begin citing law. Hit 2 to quit. Hit 3 to read some background on the program.

## Year

xCitation will first ask for a year of the matter.
Years can be between 1000 and the current year. Years must be a number.

## Party

After entering the year, xCitation will ask a series of questions relating to the party to be entered. 
**NOTE:** The AGLC states that if one group of parties are suing another group of parties, then only the *first-named* is listed on the citation. You must identify who the first party is from the judgement.  xCitation also offers including details from concurrent judgements. However, this is when two distinct matters are heard concurrently if the court holds it complies with all of its obligations under law. E.g. *A-G (Vic) ex rel Dale v Commonwealth* (1945) 71 CLR 237 – which would be entered into xCitation with party 1 as the Attorney-General of Victoria, party 3 as 'Dale' and party 4 as 'the Commonwealth'.

1. Is the party a company? 
If the company ends in Pty, Ltd, Pty Ltd, NL, or Inc, then the party is probably a company. 
a) Structure Suffixes
If a party is nominated as a company, you will be presented with a list of common company structure affixes (such as those listed above) plus the option for a manual entry for a foreign affix. The manual entry option allows  up to 12 characters, and can include letters, full stops and hyphens. Note this is merely for a suffix and not for entering the entire company name.
b) External Management
The next series of questions relate to whether the company is under external management.
External management of a company usually occurs in Australia when a company is potentially insolvent. It could take the form of calling in an administrator to try to trade the business out of insolvency, to other professionals such as receivers, managers, or liquidators whose job it is usually to convert whatever assets are left into a return for the investors, or to try to claw back money and/or pursue former officers for money. 
The best way to determine the status of the company is to search by company number on the Australian Securities and Investments Commission (ASIC) website to see what form of notices are present. When citing older judgements, it should be clear from the judgement whether any of the external management arrangements apply.
c) '& Company' suffix
If a company's name is 'Johnson and Company," the AGLC set out that the name be shorted to "Johnson & Co". If a party has this structure of name, select 1, and do not add anything after "and Company" starts when you are later asked to enter a name.

2. Is the party a government?
If a party is set to be a company, then xCitation will not ask if it is a government party. Governments include foreign governments.
**NOTE:** Government entities before Federation in 1901 are manual entry only. 

Corporatised entities that are owned by government but not directly controlled (ie Australia Post and the Australian Broadcasting Corporation) but their would be input by way of manual entry.  'Government' is a best fit for a department, minister, or other entity that has its powers as a result of its association with the relevant government.

a) State/Territory Government
If the party is a department, minister, or other entity that has powers as a result of its association with the relevant government, select this option.  There is a submenu for smaller Territories. 
b) Commonwealth
This will note the party as the Commonwealth.
c) Foreign Government
This is manual entry, limited to spaces, dashes, letters and round brackets and up to 80 characters.

a) State, Territory and Commonwealth Options
States, Territories and the Commonwealth will be presented with a number of options in terms of government entities.

 - Government Department: An organisation within government. 'the' should be omitted.
 - Government Minister:  A government minister. Their title should be manually entered without any proceeding 'the' in its shortened form and  can contain spaces, dashes, letters, numbers and both forms of brackets. They can contain up to 80 characters.
 - Government Officer:  When a government officer such as a secretary of a government department are sued, this provides a manual option to enter that officer. It should be entered by way of 'title' ,  'Department'.  (with a comma separating the names). e.g *Montenegro v Secretary, Department of Education* [2020] FCAFC 210. They can contain spaces, dashes, letters, numbers and both forms of brackets and to 80 characters. A Director of Public Prosecution is a further example. 
 - The Monarch/Crown:  When a crown prosecution is filed, it is frequently filed in the name of the monarch by way of 'Crown Prosecution'. The AGLC requires identification of the Monarch when the Crown is the second named party. xCitation can determine the Monarch back through until 1714 (although assisted inputting of prosecutions prior to 1901 is currently unsupported).
 - The Government itself: When government becomes the party as a government sues an individual, another government, or is sued. e.g *Palmer v Western Australia*[2021] HCA 5. This option will take the earlier jurisdictional selection and apply it to the party name. 
 - Other (Manual Entry): used for publicly owned corporatised entities or anything that does not fit with the other options. They can contain spaces, dashes, letters, numbers and both forms of brackets and contain up to 80 characters.

3. Single Party Application
Sometimes certain individuals or governments make applications to courts to resolve points of law. More frequently, single party applications appear in the High Court after Governments make special leave applications to resolve conflicts of judgement on certain points of law i.e. evidence law, seeking that the High Court rule whose state law prevails.  Alternatively, applicants can seek that a law is ruled upon or judgement regarding guardianship/capacity. xCitation presumes that all ex rel, Ex parte, and Re matters are in some way a 'single party application'; such as *Re Palmer; George v McIntyre*(1902) 2 SR (NSW) 200 has Palmer as a 'single party application' and 'George v McIntyre' would be first concurrent and second concurrent party respectively. 

If a single party application is selected, there will be no prompts to enter details for the second party. 

**NOTE:** As Attorney-General/s bring Ex rel applications, these are sought through setting the Attorney-General as the first party and are not available through the Single Party Application. 

The matter cited would indicate if the matter requires an affix of either 'Ex parte' or 'Re'. 

4. Entering the Party Name
If the party name has not been entered earlier, it will now be requested. Names can contain spaces, apostrophes, dashes and letters and numbers and can contain up to 80 characters.

## Other Parties

If the matter was not designated as a single party application, xCitation will ask if if a second party is needed. If 1 is entered, the process above (excluding the input of the year and the single party application) will be repeated. 

xCitation also allows the inputting of concurrent judgements. Note that if you select single party application when entering a first concurrent party, you won't be able to enter a fourth party. 

## Case Number

Occasionally judgements will have numerous judgements around the same facts. Sometimes these occur as the judge makes preliminary rulings on particular matters so as to progress the main part of the matter. Case numbers can be entered up to 20 and will be inserted into the citation prior to the year. *Bahr v Nocolay [No2]*(1988) 164 CLR 604.

## Volume

Some Law Reports order by year and some by volume. If the legal source cited does not include a volume, xCitation will wrap square brackets around the year to indicate it to be the organising key. If a volume is entered, the year will be wrapped in round brackets.

 ## Law Report Name

Law Report is the authority from which the law is being referenced.  The relevant abbreviation should be entered. The abbreviation can frequently be found at the top of the page. Law Reports can contain spaces and hyphens and up to 30 characters.

 ## Starting Page

If the work is hard copy the starting page will be the first page of the judgement being cited. xCitation supports entry of multiple page references and hyphens, spaces, commas, square brackets and the pilcrow (¶) if the user pastes it into the window. It supports input of up to 20 characters.  
**NOTE:** As this field is mandatory, a pinpoint reference should be entered here if the judgement has no pages listed, rather than entering in them into the next prompt.

 ## Pinpoint References

If the user hasn't put these in during the last prompt, these should be inserted if possible.  This field supports hyphens, spaces, commas, square brackets. It supports input of up to 20 characters.

## Output

The reference is then outputted for the user on the screen and placed into the text file "output.txt".  Please note due to technical limitations that italicisation needs to be manually added to citations for all words prior to the year.

# Testing Procedures

[Testing](./docs/testing.pdf)


# References

Aimonetti, M., 2021. *Ruby: the differences between dup & clone (Example)*. [online] Coderwall. Available at: <https://coderwall.com/p/1zflyg/ruby-the-differences-between-dup-clone> [Accessed 7 October 2021]. ![Citation 1](./docs/cit1.png)
Martínez, D., 2020. *Ruby: How to read/write JSON File | Hacker Noon.* [online] Hackernoon.com. Available at: <https://hackernoon.com/ruby-how-to-readwrite-json-file-a23h3vxa> [Accessed 7 October 2021]. ![Citation 2](./docs/cit2.png)
Melbourne University Law School. n.d. *The Australian Guide to Legal Citiation.* [online] Available at: <https://law.unimelb.edu.au/mulr/aglc/about> [Accessed 7 October 2021]. ![Citation 3](./docs/cit3.png)
Rietta, F., 2015. *Get the Current Year in the Ruby programming language.* [online] Rietta.com. Available at: <https://rietta.com/blog/ruby-current-year/> [Accessed 7 October 2021]. ![Citation 4](./docs/cit4.png)
Simic, D., 2013. *Checking if a variable is not nil and not zero in ruby.* [online] Stack Overflow. Available at: <https://stackoverflow.com/questions/252203/checking-if-a-variable-is-not-nil-and-not-zero-in-ruby/20012233> [Accessed 7 October 2021]. ![Citation 5](./docs/cit5.png)
Wikipedia. n.d. *Judiciary of Australia.* [online] Available at: <https://en.wikipedia.org/wiki/Judiciary_of_Australia> [Accessed 7 October 2021]. ![citation 6](./docs/cit6.png)
Wikipedia. n.d. *List of British monarchs.* [online] Available at: <https://en.wikipedia.org/wiki/List_of_British_monarchs> [Accessed 7 October 2021]. ![Citation 7](./docs/cit7.png)
Wikipedia. n.d. *List of early landmark court cases.* [online] Available at: <https://en.wikipedia.org/wiki/List_of_early_landmark_court_cases> [Accessed 7 October 2021]. ![Citation 8](./docs/cit8.png)
