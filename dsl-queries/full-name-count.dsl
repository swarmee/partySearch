####
#### Count of Full Names
####
POST /real-estate-sales/_search
{
  "aggs": {
    "1": {
      "nested": {
        "path": "role.party.name"
      },
      "aggs": {
        "2": {
          "value_count": {
            "field": "role.party.name.fullName.keyword"
          }
        }
      }
    }
  }, "size": 0
}
