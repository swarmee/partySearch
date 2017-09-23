{
  "_source": false,
  "query": {
    "nested": {
      "path": "role.party",
      "query": {
        "bool": {
          "should": [
            {
              "nested": {
                "path": "role.party.name",
                "query": {
                  "bool": {
                    "must": [
                      {
                        "match": {
                          "role.party.name.fullName": "Jujubes"
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
                            "query": "HWY",
                            "operator": "and"
                          }
                        }
                      }
                    ]
                  }
                }
              }
            },
             {
              "nested": {
                "path": "role.party.identification",
                "query": {
                  "bool": {
                    "must": [
                      {
                        "match": {
                          "role.party.identification.identifier": {
                            "query": "OPah@swarmee.net",
                            "operator": "and"
                          }
                        }
                      }
                    ]
                  }
                }
              }
            }
          ], "minimum_should_match": 2
        }
      },
      "inner_hits": {}
    }
  }
}
