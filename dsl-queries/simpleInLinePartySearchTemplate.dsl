GET _render/template
{
    "source": "{\"aggs\": {\"partySearch\": {\"nested\": {\"path\": \"role.party\"},    \"aggs\": {\"partyFilter\": {\"filter\": {\"bool\":{  {{#toJson}}must{{/toJson}} ,  {{#toJson}}should{{/toJson}} , {{#toJson}}must_not{{/toJson}} }}}}}}}",
    "params": {
        "must":     "\"must\":      [ {\"match\": {\"role.party.name.fullName\": {\"query\": \"CHOCOLATE\", \"operator\": \"and\"}}}]",
        "should":   "\"should\":    []",
        "must_not": "\"must_not\":  [ {\"match\": {\"role.party.name.fullName\": {\"query\": \"MR\", \"operator\": \"and\"}}}]"
    }
}


GET _render/template
{
    "source": "{\"aggs\": {\"partySearch\": {\"nested\": {\"path\": \"role.party\"},    \"aggs\": {\"partyFilter\": {\"filter\": {\"bool\":{ \"must\":   {{#toJson}}must_name{{/toJson}} , \"should\":   {{#toJson}}should_name{{/toJson}} ,  \"must_not\": {{#toJson}}must_not_name{{/toJson}} }},\"aggs\": {\"1\": {\"nested\": {\"path\": \"role.party.name\"  },                \"aggs\": {\"nameDetails\": {\"terms\": {\"field\": \"role.party.name.fullName.keyword\", \"missing\": \"missing\"}}}  }  }}       }}}, \"size\": 0}",
    "params": {
        "must_name":     "[ {\"nested\": { \"path\": \"role.party.name\",\"query\":{\"match\": {\"role.party.name.fullName\": {\"query\": \"Daniel\", \"operator\": \"AND\"}}}}}]",
        "should_name":   "[]",
        "must_not_name": "[ {\"nested\": { \"path\": \"role.party.name\",\"query\":{\"match\": {\"role.party.name.fullName\": {\"query\": \"smith Durian Mangos\", \"operator\": \"OR\"}}}}}]"
    }
}
