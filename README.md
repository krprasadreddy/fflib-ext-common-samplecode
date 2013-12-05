fflib-ext-common-samplecode
===========================

@author Matt Bingham <mbingham@tunzy.com>

This sample code demonstrates a Salesforce-integrated Sencha application which uses our JavaScript Remoting proxy.

Play with the live example at https://fflib-ext-common-developer-edition.na11.force.com/

![screenshot](https://c.na11.content.force.com/servlet/servlet.ImageServer?id=015G0000001YXpr&oid=00DG0000000iEkX&lastMod=1386175684000)

The [proxy](https://github.com/financialforcedev/fflib-ext-common/blob/master/src/data/proxy/VFRemote.js) centralizes the smarts, limiting the model configuration to:

```
proxy: {
    type: 'vfremote',
    api: {read: $RemoteAction.AccountsController.readAccounts}
}
```

The [service](https://github.com/financialforcedev/fflib-ext-common-samplecode/blob/master/src/classes/AccountsController.cls) is very skinny and just returns SObjects:

```
@RemoteAction static public List<Account> readAccounts(Id parentId) {
    return [SELECT Id, Name FROM Account WHERE ParentId = :parentId];
}
```

We carefully align the Sencha client with the Salesforce service so that there is:
- no need for client-specific wrapper objects in the service,
- no need for server-side marshalling of edge cases (eg root node),
- no need for error handling other than that provided by the Visualforce Remoting Manager,

Use [Sencha Architect 3](www.sencha.com/products/architect/download/) to build the project, then run `ant sencha` with [Sencha Cmd 4](http://www.sencha.com/products/sencha-cmd/download) installed.
