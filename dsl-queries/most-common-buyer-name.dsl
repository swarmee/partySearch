{
  "aggs": {
    "1": {
      "nested": {
        "path": "role"
      },
      "aggs": {
        "2": {
          "filter": {
            "match": {
              "role.type": "buyer"
            }
          },
          "aggs": {
            "3": {
              "nested": {
                "path": "role.party.name"
              },
              "aggs": {
                "4": {
                  "terms": {
                    "field": "role.party.name.fullName.keyword",
                    "order": {
                      "_count": "desc"
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }, "size": 0
}
