{
  "_source": false,
  "query": {
    "nested": {
      "path": "role.party",
      "query": {
        "bool": {
          "must": [
            {
              "nested": {
                "path": "role.party.name",
                "query": {
                  "bool": {
                    "must": [
                      {
                        "match": {
                          "role.party.name.fullName": "Dates"
                        }
                      }
                    ]
                  }
                }
              }
            },
            {
              "nested": {
                "path": "role.party.address",
                "query": {
                  "bool": {
                    "must": [
                      {
                        "match": {
                          "role.party.address.streetAddress": {
                            "query": "Ogden CL",
                            "operator": "and"
                          }
                        }
                      }
                    ]
                  }
                }
              }
            }
          ]
        }
      },
      "inner_hits": {}
    }
  }
}
