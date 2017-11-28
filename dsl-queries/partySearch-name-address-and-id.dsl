{
  "aggs": {
    "1": {
      "nested": {
        "path": "role.party"
      },
      "aggs": {
        "partyFilter": {
          "filter": {
            "bool": {
              "minimum_should_match": 2,
              "should": [
                {
                  "nested": {
                    "path": "role.party.name",
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "role.party.name.fullName": {
                                "query": "jack",
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
                    "path": "role.party.address",
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "role.party.address.streetAddress": {
                                "query": "Plums",
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
                    "path": "role.party.address",
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "role.party.address.streetAddress": {
                                "query": "Lychees Street",
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
                    "path": "role.party.account",
                    "query": {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "role.party.account.number": {
                                "query": 35537919,
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
          "aggs": {
            "1": {
              "nested": {
                "path": "role.party.name"
              },
              "aggs": {
                "nameDetails": {
                  "terms": {
                    "field": "role.party.name.fullName.keyword",
                    "missing": "missing"
                  }
                }
              }
            },
            
            "3": {
              "nested": {
                "path": "role.party.address"
              },
              "aggs": {
                "streetAddress": {
                  "terms": {
                    "field": "role.party.address.streetAddress.keyword",
                    "missing": "missing"
                  }
                }
              }
            },
            "5": {
              "nested": {
                "path": "role.party.account"
              },
              "aggs": {
                "accountNumber": {
                  "terms": {
                    "field": "role.party.account.number",
                    "missing": 0
                  }
                }
              }
            },
            "7": {
              "nested": {
                "path": "role.party.identification"
              },
              "aggs": {
                "identificationType": {
                  "terms": {
                    "field": "role.party.identification.type.keyword",
                    "missing": "missing"
                  },
                  "aggs": {
                    "identificationNumber": {
                      "terms": {
                        "field": "role.party.identification.identifier.keyword",
                        "missing": "missing"
                      }
                    }
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
