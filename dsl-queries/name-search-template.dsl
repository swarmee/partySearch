GET _scripts/nameSearch

DELETE _scripts/nameSearch

GET real-estate-sales/_search
{"aggs":{"nameSearch":{"nested":{"path":"role.party.name"},"aggs":{"nameFilter":{"filter":{"bool":{"must":[{"match":{"role.party.name.fullName":{"query":"Arthur","operator":"and"}}}]}},"aggs":{"nameDetails":{"terms":{"field":"role.party.name.fullName.keyword","size":50},"aggs":{"3":{"reverse_nested":{},"aggs":{"eventSummary":{"terms":{"field":"transactionType.keyword","size":10},"aggs":{"eventSummary":{"sum":{"field":"salePrice"}}}}}}}}}}}}},"size":0}

POST _scripts/nameSearch
{"script":{"lang":"mustache","source":{"aggs":{"nameSearch":{"nested":{"path":"role.party.name"},"aggs":{"nameFilter":{"filter":{"bool":{"must":[{"match":{"role.party.name.fullName":{"query":"{{nameSearched}}","operator":"and"}}}]}},"aggs":{"nameDetails":{"terms":{"field":"role.party.name.fullName.keyword","size":50},"aggs":{"3":{"reverse_nested":{},"aggs":{"eventSummary":{"terms":{"field":"transactionType.keyword","size":10},"aggs":{"eventSummary":{"sum":{"field":"salePrice"}}}}}}}}}}}}},"size":0}}}

GET /_render/template
{"id":"nameSearch","params":{"nameSearched":"arthur"}}

GET real-estate-sales/_search/template
{"id":"nameSearch","params":{"nameSearched":"arthur"}}
