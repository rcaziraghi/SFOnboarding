var countryCode = "";

if ($.context.response.country=="ACE_USA") {

        countryCode = "USA";
}

else if  ($.context.response.country=="ACE_IND"){

        countryCode = "IND";
}

$.context.response.countryCode = countryCode