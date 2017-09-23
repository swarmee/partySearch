####
#### Must Populate Full Names
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
          "terms": {
            "field": "role.party.name.fullName.keyword",
            "order": {
              "_count": "desc"
            }
          }
        }
      }
    }
  }, "size": 0
}
