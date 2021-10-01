# @user_selections = { 
#     party_number: 0,
      
#     party_1: "",
#     party_suffix_1: "",
#     company_suffix_1: "",
#     administration_status_1: "",
#     co_suffix_1: "",
#     govt_abbreviation_1: "",
#     case_suffix_1: "",
#     exparte_1: "",
#     state_short_1: "",
#     state_long_1: "",
#     is_company_1: 0,
#     is_government_1: 0,

#     party_2: "",
#     party_suffix_2: "",
#     company_suffix_2: "",
#     administration_status_2: "",
#     co_suffix_2: "",
#     govt_abbreviation_2: "",
#     case_suffix_2: "",
#     state_short_2: "",
#     state_long_2: "",
#     is_company_2: 0,
#     is_government_2: 0,
    

#     party_3: "",
#     party_suffix_3: "",
#     company_suffix_3: "",
#     administration_status_3: "",
#     co_suffix_3: "",
#     govt_abbreviation_3: "",
#     case_suffix_3: "",
#     is_company_3: 0,
#     is_government_3: 0,
#     exparte_3: "",
#     state_short_3: "",
#     state_long_3: "",

#     party_4: "",
#     party_suffix_4: "",
#     company_suffix_4: "",
#     administration_status_4: "",
#     co_suffix_4: "",
#     govt_abbreviation_4: "",
#     case_suffix_4: "",
#     is_company_4: 0,
#     is_government_4: 0,
#     state_short_4: "",
#     state_long_4: "",

#     party_co: "",
#     party_ship_1: "",
#     party_ship_2: "",
    
#     judicial_officer_number: "",
#     judicial_officer_1: "",
#     judicial_officer_2: "",

#     year_queries: "",
#     year_string: "",
    
#     law_report: "",
#     starting_page: "",
#     vol: "",
#     pinpoint: "",
#     pilcrow: "",

    
    
# }

# @prompt = {bool_question: "\n1. Yes\n2. No",}

# @party_number = {user: 0}

# @common_jursdiction_names_authorised
# { 
# HCA:    ["CLR"],
# FCA:    ["FCR"],
# ACT:    ["ACTLR"],
# NSW:    ["SR(NSW)", "NSWR", "NSWLR"], # 1901 -1959 = 1; 1960 - 1970 = 2; > 1970 = 3
# VIC:    ["VLR", "VR"], # 1875 - 1956 = 1; > 1956 = 2
# QLD:    ["QSR", "Qd R"], # 1902-1957 = 1; > 1957 = 2
# SA:     ["SALR", "SASR"], #1899-1920 = 1; > 1920 = 2
# TAS:    ["Tas LR", "Tas SR", "Tas R"], # 1904-1940 = 1; 1941 - 1978 = 2; > 1978 = 3
# WA:     ["WALR", "WAR"], # 1898-1958 = 1; >1958 = 2
# NT:     ["NTR", "NTLR"], # 1979- 1990 = 1; > 1990 = 2
# }

# @common_jursdiction_names_not_authorised
# {
# ALR:    ["ALR", "Argus Law Reports"],["ALR", "Australian Argus Law Reports"],["ALR", "Australian Law Reports"], #1895-1950 = 1; 1950 - 1973 = 2; > 1973 = 3
# ALJR:   ["ALJR", "Australian Law Journal Reports"],
# FAM:    ["Fam LR" "Family Law Reports"]
# }

@company_types = ["Limited (Ltd)", "Proprietary (Pty)", "Proprietary Limited (Pty Ltd)", "Incorporated (Inc)", "No Liability (NL)", "None of the above, or foreign company"]

@admin_types = ["in liquidation", "in provisional liquidation", "administrator appointed", "manager appointed", "reciever appointed"]

@states = ["Victoria", "NSW", "Queensland", "Tasmania", "South Australia", "Northern Territory", "Australian Capital Territory", "Western Australia", "Other"]
@states_abreviated = ["Vic", "NSW", "Qld", "Tas", "SA", "NT", "ACT", "WA", "NI"]

@aus_ter = ["Cocos Islands", "Ashmore and Cartier Islands", "Australian Antarctic Territory", "Christmas Island", "Coral Sea Islands/Willis Island", "Heard Island and McDonald Islands", "Norfolk Island", "Jervis Bay Territory"]

@government_entity = ["Government Department", "Government Minister", "Government Officer", "The Monarch", "The Government itself", "Other (Manual Entry)"]

@case_affix = ["Ex parte", "Re"]

@company_types = ["Limited (Ltd)", "Proprietary (Pty)", "Proprietary Limited (Pty Ltd)", "Incorporated (Inc)", "No Liability (NL)", "None of the above, or foreign company"]
@admin_types = ["in liquidation", "in provisional liquidation", "administrator appointed", "manager appointed", "reciever appointed"]
@states = ["Victoria", "NSW", "Queensland", "Tasmania", "South Australia", "Northern Territory", "Australian Capital Territory", "Western Australia", "Other"]
@states_abreviated = ["Vic", "NSW", "Qld", "Tas", "SA", "NT", "ACT", "WA", "NI"]
@aus_ter = ["Cocos Islands", "Ashmore and Cartier Islands", "Australian Antarctic Territory", "Christmas Island", "Coral Sea Islands/Willis Island", "Heard Island and McDonald Islands", "Norfolk Island", "Jervis Bay Territory"]
@government_entity = ["Government Department", "Government Minister", "Government Officer", "The Monarch", "The Government itself", "Other (Manual Entry)"]
@case_affix = ["Ex parte", "Re"]    



#unreported judgement identifiers for sorting
#"High Court of Australia HCA 1998– High Court of Australia — Special Leave Dispositions HCASL 2008– Federal Court of Australia FCA 1999– Federal Court of Australia — Full Court FCA 1999–2001 FCAFC 2002– Family Court of Australia FamCA 1998– Family Court of Australia — Full Court FamCA 1998–2007 FamCAFC 2008– Supreme Court of the Australian Capital Territory (including Full Court) ACTSC 1998– Australian Capital Territory Court of Appeal ACTCA 2002– Supreme Court of New South Wales NSWSC 1999– New South Wales Court of Appeal NSWCA 1999– New South Wales Court of Criminal Appeal NSWCCA 1999– Supreme Court of the Northern Territory (including Full Court)  NTSC 1999– Northern Territory Court of Appeal NTCA 2000– Northern Territory Court of Criminal Appeal NTCCA 2000– Supreme Court of Queensland QSC 1998– Queensland Court of Appeal QCA 1998– Supreme Court of South Australia (including Full Court until end of 2009) SASC 1999– Supreme Court of South Australia — Full Court SASCFC 2010– Supreme Court of Tasmania (including Full Court until end of 2009) TASSC 1999– Tasmanian Court of Criminal Appeal TASCCA 2010– Supreme Court of Tasmania — Full Court TASFC 2010– Supreme Court of Victoria VSC 1998– Victorian Court of Appeal VSCA 1998– Supreme Court of Western Australia WASC 1999–  Western Australian Court of Appeal (including Full Court until end 2004) WASCA 1999– "

# @judicial_officer_types = ["Acting Judicial Officer", "Chief Judicial Officer", "Magistrate/Master", "Judge/s", "Senior Judicial Officer", "Administrative Judicial Officer/s", "Other"]

# @acting = ["Acting Chief Justice", "Acting Justice of Appeal",  "Acting Justices of Appeal", "Acting Justice",  "Acting Justices", ]
#     @acting_abreviations = ["ACJ", "AJA", "AJJA", "AJ", "AJJ"]
# @chief = ["Chief Judge Administrator", "Chief Judge at Common Law",  "Chief Judge in Equity", "Chief Judge of the Commercial Division",  "Chief Justice" ]
#     @chief_abreviations = ["CJA", "CJ at CL", "CJ in Eq", "CJ Comm D","CJ"]
# @other_judicial_officer = ["Chief Justice/District Court Judge", "Associate Justice", "Auxiliary Judge" "President","Vice-President", ]
#     @other_judicial_officer_abreviations = ["DCJ", "AsJ", "AUJ", "P", "V-P"]
# @magistrates = ["Federal Magistrate", "Magistrate", "Master"]
#     @magistrates_abreviations = ["FM","Magistrate", "Master"]
# @judge = ["Judge", "Judicial Registrar", "Justice of Appeal",  "Justices of Appeal", "Justice", "Justices"]
#     @judge_abreviations = ["Judge","JR", "JA",  "JJA", "J", "JJ"]
# @senior = ["Senior Judge Administrator", "Senior Judge","Senior Judges", "Senior Puisne Judge"]
#     @senior_abreviations = ["SJA",  "SJ", "SJJ",  "SPJ"]
# @admin_judicial_officers = ["President","Vice-President",  "Member",  "Senior Member",  "Commissioner", "Acting President", ]
#     @admin_judicial_officers_abreviations = ["P", "V-P","Member","Senior Member","Commissioner","AP"]