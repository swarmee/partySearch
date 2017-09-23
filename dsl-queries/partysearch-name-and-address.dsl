{
  "aggs": {
    "1": {
      "nested": {
        "path": "role.party"
      },
      "aggs": {
        "nameFilter": {
          "filter": {
            "bool": {
              "minimum_should_match" : 2,
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
                                "query": "us bank",
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
                                "query": "Street",
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
                  },
                  "aggs": {
                    "3": {
                      "reverse_nested": {},
                      "aggs": {
                        "totalSales": {
                          "terms": {
                            "field": "transactionType.keyword",
                            "missing": "missing"
                          },
                          "aggs": {
                            "identification": {
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
            "2": {
              "nested": {
                "path": "role.party.address"
              },
              "aggs": {
                "addressCountry": {
                  "terms": {
                    "field": "role.party.address.country.keyword",
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
                "addressCountry": {
                  "terms": {
                    "field": "role.party.address.streetAddress.keyword",
                    "missing": "missing"
                  },
                  "aggs": {
                    "3": {
                      "reverse_nested": {},
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
            },
            "4": {
              "nested": {
                "path": "role.party.account"
              },
              "aggs": {
                "addressCountry": {
                  "terms": {
                    "field": "role.party.account.branchId",
                    "missing": 0
                  }
                }
              }
            },
            "5": {
              "nested": {
                "path": "role.party.account"
              },
              "aggs": {
                "addressCountry": {
                  "terms": {
                    "field": "role.party.account.number",
                    "missing": 0
                  },
                  "aggs": {
                    "3": {
                      "reverse_nested": {},
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
            },
            "7": {
              "nested": {
                "path": "role.party.identification"
              },
              "aggs": {
                "addressCountry": {
                  "terms": {
                    "field": "role.party.identification.type.keyword",
                    "missing": "missing"
                  },
                  "aggs": {
                    "identification": {
                      "terms": {
                        "field": "role.party.identification.identifier.keyword",
                        "missing": "missing"
                      },
                      "aggs": {
                        "3": {
                          "reverse_nested": {},
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
