
### Create Search Template
POST _scripts/partySearch
{"template" : "{\"query\": {\"bool\": {\"should\": [ {\"nested\": {\"path\": \"role.party.name\" , \"query\": {\"bool\": {\"should\": [    {     \"match\": {   \"_type\": \"nomatch\"   }    } {{#name}} ,    {       \"match\": {     \"role.party.name.fullName\": {      \"query\": \"{{.}}\",      \"operator\": \"and\"   }    }  } {{/name}} ] , \"minimum_should_match\": 1 } } } } ]} }}"
}

### Render Search Template
GET _render/template
{
  "id": "partySearch",
  "params": {
    "name": [
      "CHOCOLATE",
      "DATES"
    ]
  }
}

### Run Search Template
GET real-estate-sales/_search/template
{
  "id": "partySearch",
  "params": {
    "name": [
      "CHOCOLATE",
      "DATES"
    ]
  }
}
