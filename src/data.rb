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
# - () ,

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