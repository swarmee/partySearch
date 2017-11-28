{
  "aggs": {
    "1": {
      "nested": {
        "path": "role.party"
      },
      "aggs": {
        "partySearch": {
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
            "Name": {
              "nested": {
                "path": "role.party.name"
              },
              "aggs": {
                "nameDetails": {
                  "terms": {
                    "field": "role.party.name.fullName.keyword",
                    "missing": "missing"
                  },
                  "aggs": {
                    "3": {
                      "reverse_nested": {},
                      "aggs": {
                        "transactionType": {
                          "terms": {
                            "field": "transactionType.keyword",
                            "missing": "missing"
                          },
                          "aggs": {
                            "totalSales": {
                              "sum": {
                                "field": "salePrice"
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
            "address": {
              "nested": {
                "path": "role.party.address"
              },
              "aggs": {
                "addressDetails": {
                  "terms": {
                    "field": "role.party.address.streetAddress.keyword",
                    "missing": "missing"
                  },
                  "aggs": {
                    "3": {
                      "reverse_nested": {},
                      "aggs": {
                        "transactionType": {
                          "terms": {
                            "field": "transactionType.keyword",
                            "missing": "missing"
                          },
                          "aggs": {
                            "totalSales": {
                              "sum": {
                                "field": "salePrice"
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
            "account": {
              "nested": {
                "path": "role.party.account"
              },
              "aggs": {
                "accountDetails": {
                  "terms": {
                    "field": "role.party.account.number",
                    "missing": 0
                  },
                  "aggs": {
                    "3": {
                      "reverse_nested": {},
                      "aggs": {
                        "transactionType": {
                          "terms": {
                            "field": "transactionType.keyword",
                            "missing": "missing"
                          },
                          "aggs": {
                            "totalSales": {
                              "sum": {
                                "field": "salePrice"
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
            "identification": {
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
                    "3": {
                      "reverse_nested": {},
                      "aggs": {
                        "transactionType": {
                          "terms": {
                            "field": "transactionType.keyword",
                            "missing": "missing"
                          },
                          "aggs": {
                            "totalSales": {
                              "sum": {
                                "field": "salePrice"
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
          }
        }
      }
    }
  },
  "size": 0
}
