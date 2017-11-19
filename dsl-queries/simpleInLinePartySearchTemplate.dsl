GET _render/template
{
    "source": "{\"aggs\": {\"partySearch\": {\"nested\": {\"path\": \"role.party\"},    \"aggs\": {\"partyFilter\": {\"filter\": {\"bool\":{  {{#toJson}}must{{/toJson}} ,  {{#toJson}}should{{/toJson}} , {{#toJson}}must_not{{/toJson}} }}}}}}}",
    "params": {
        "must":     "\"must\":      [ {\"match\": {\"role.party.name.fullName\": {\"query\": \"CHOCOLATE\", \"operator\": \"and\"}}}]",
        "should":   "\"should\":    []",
        "must_not": "\"must_not\":  [ {\"match\": {\"role.party.name.fullName\": {\"query\": \"MR\", \"operator\": \"and\"}}}]"
    }
}
