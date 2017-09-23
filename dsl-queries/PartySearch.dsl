## A New Post
POST _scripts/partySearch
{"template" : "{  \"aggs\": {    \"1\": {       \"nested\": {         \"path\": \"role.party\"       },       \"aggs\": {         \"nameFilter\": {           \"filter\": {             \"bool\": {              \"should\": [ {\"nested\": {\"path\": \"role.party.name\" , \"query\": {\"bool\": {\"should\": [    {     \"match\": {   \"_type\": \"nomatch\"   }    } {{#name}} ,    {       \"match\": {     \"role.party.name.fullName\": {      \"query\": \"{{.}}\",      \"operator\": \"and\"   }    }  } {{/name}} ] , \"minimum_should_match\": 1 } } } } ,  {\"nested\": {\"path\": \"role.party.address\" , \"query\": {\"bool\": {\"should\": [    {     \"match\": {   \"_type\": \"nomatch\"   }    } {{#address}} ,    {       \"match\": {     \"role.party.address.streetAddress\": {      \"query\": \"{{.}}\",      \"operator\": \"and\"   }    }  } {{/address}} ] , \"minimum_should_match\": 1 } } } }              ] , \"minimum_should_match\" : {{token_matches}}{{^token_matches}}1{{/token_matches}}}          },          \"aggs\": {            \"1\": {              \"nested\": {                \"path\": \"role.party.name\"               },            \"aggs\": {                \"nameDetails\": {                  \"terms\": {                    \"field\": \"role.party.name.fullName.keyword\",                    \"missing\": \"missing\"                   }                }              }            },\"2\": {              \"nested\": {                \"path\": \"role.party.address\"               },            \"aggs\": {                \"nameDetails\": {                  \"terms\": {                    \"field\": \"role.party.address.streetAddress.keyword\",                    \"missing\": \"missing\"                   }                }              }            }          }        }      }}},\"size\": 0}"
}


GET _render/template
{
  "id": "partySearch",
  "params": {
    "name": [
      "CHOCOLATE",
      "DATES"
    ],
    "address": [
      "CHOCOLATE",
      "DATES",
      "Apples"
    ],
    "token_matches": 2
  }
}

GET real-estate-sales/_search

GET real-estate-sales/_search/template
{
  "id": "partySearch",
  "params": {
    "name": [
      "CHOCOLATE",
      "DATES"
    ],
    "address": [
      "pears AVE"
    ],
    "token_matches": 2
  }
}
