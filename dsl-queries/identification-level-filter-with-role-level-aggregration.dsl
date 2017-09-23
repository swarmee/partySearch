POST /real-estate-sales/_search
{
  "aggs": {
    "1": {
      "nested": {
        "path": "role.party.identification"
      },
      "aggs": {
        "2": {
          "filter": {
            "term": {
              "role.party.identification.country.keyword": "CN"
            }
          },
          "aggs": {
            "3": {
              "reverse_nested": {
                "path": "role"
              },
              "aggs": {
                "2": {
                  "terms": {
                    "shard_size": 200,
                    "size": 10,
                    "order": {
                      "_count": "desc"
                    },
                    "field": "role.type.keyword"
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "size": 0
}
