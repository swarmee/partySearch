{
  "aggs": {
    "1": {
      "nested": {
        "path": "role.party.name"
      },
      "aggs": {
        "4": {
          "terms": {
            "field": "role.party.name.firstName.keyword",
            "size": 5, 
            "shard_size": 15, 
            "order": {
              "_count": "desc"
            }
          }
        }
      }
    }
  },
  "size": 0
}
