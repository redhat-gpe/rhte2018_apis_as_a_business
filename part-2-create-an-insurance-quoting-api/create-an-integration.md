## **Create an Integration**

* Click on the **Integrations **tab.
* Click on the **Create Integration** button.
* Select **Webhook** as the **Start Connection**.

![](/images/ignite-IntegrationWebhook.png)

* Select the only available action.

* Change the **Webhook Token **to "**QuoteAPI".**

* Click on the **Next button.**

![](/images/ignite-CreateWebHookToken.png)

* Select **JSON Instance** as **Type.**

* Paste the contents of the **Labs\quoteRequest.json** file into the **Definition** field.

* Enter **QuoteRequest** as **Data Type Name**.

* Click on the **Done** button.

![](/images/ignite-DefineWebhookDatashape.png)

* Select **DataShape** as the **Finish** **Connection**.

* Select the only available action.

* Select **JSON Instance** as **Type.**

* Enter the following in the **Definition** field:

```
{ "price": 123 }
```

* Enter **QuoteResponse** as **Data Type Name**.

* Click on the **Done **button**.**

![](/images/ignite-CreateDataShapeDefinitio.png)

* Hover over the **plus** sign and click on** Add a Step**.
* Select ** Set Body JS.**
* Enter the following as **Body:**

```
'{"parameters":{"id": "' + JSON.parse(exchange.in.getBody(java.lang.String.class)).driver.id + '"}}'
```

* Click on the **Done **button.

![](/images/ignite-Integration-SetBodyJS.png)

* Click on the **Add a connection** after the **Set Body JS** step.
* Select **Driver API**.
* Select **Retrieve a Driver resource.**

![](/images/ignite-Integration-DriverAPI.png)

* Add a connection after **Driver API**.

* Select **RHDM-InsuranceQuoting.**

* Select the only available action.

* Click on orange circle with a warning icon inside on the top of the **RHDM-InsuranceQuoting** connection.

* Click on the **Add a data mapping step** link.

![](/images/ignite-Integration-RHDMDataMapping.png)

* Create the following constants:

| Value | Type |
| :--- | :--- |
| quoting | String |
| quote1 | String |
| 0 | Integer |
| true | Boolean |
| ksession | String |

* Perform the following mappings:

| Source | Target |
| :--- | :--- |
| Contants -&gt; quoting | parameters -&gt; id |
| Contants -&gt; ksession | body -&gt; lookup |
| Contants -&gt; quote1 | body -&gt; commands -&gt; insert -&gt; out-identifier |
| Contants -&gt; true | body -&gt; commands -&gt; insert -&gt; return-object |
| Contants -&gt; 0 | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; price |

* It should look like this:

![](/images/ignite-integration-RHDMDataMapper.png)

* Perform the following mappings:

| Source | Target |
| :--- | :--- |
| QuoteRequest -&gt; driver -&gt; age | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; driver -&gt; age |
| QuoteRequest -&gt; driver -&gt; firstName | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; driver -&gt; firstName |
| QuoteRequest -&gt; driver -&gt; lastName | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; driver -&gt; lastName |
| QuoteRequest -&gt; driver -&gt; validLicense | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; driver -&gt; validLicense |
| QuoteRequest -&gt; vehicle -&gt; licensePlate | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; vehicle -&gt; licensePlate |
| QuoteRequest -&gt; vehicle -&gt; maker | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; vehicle -&gt; maker |
| QuoteRequest -&gt; vehicle -&gt; mileage | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; vehicle -&gt; mileage |
| QuoteRequest -&gt; vehicle -&gt; model | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; vehicle -&gt; model |
| QuoteRequest -&gt; vehicle -&gt; modelYear | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; vehicle -&gt; modelYear |
| Response -&gt; fines | body -&gt; commands -&gt; insert -&gt; object -&gt; com.redhat.insurancequoting.Quote -&gt; driver -&gt; fines |

* Click on the **Done** button.

![](/images/ignite-Integration-RHDMDataMapping2.png)

* Click on orange circle with a warning icon inside on the top of the **DataShape** connection.

* Click on the **Add a data mapping step** link.

![](/images/ignite-Integration-DataShapeDataMapping1.png)

* Perform the following mapping:  
  \| Source \| Target \|  
  \| :--- \| :--- \|  
  \| Response -&gt; result -&gt; execution-results -&gt; results -&gt; value -&gt; com.redhat.insurancequoting.Quote -&gt; price \| QuoteResponse -&gt; price \|

* Click on the **Done **button.

![](/images/ignite-IntegrationDataShapeDataMapping3.png)

* Add a step **before** the **RHDM-InsuranceQuoting** connection.

![](/images/ignite-IntegrationAddRemoveHeaderStep.png)

* Select **Script**.

* Select **Javascript** as the **Language**.

* Enter the following code as **Script:**

```
var obj = JSON.parse(body);
var fire = {"fire-all-rules": {}};
obj.body.commands.push(fire);
exchange.out.headers['Content-Type'] = 'application/json';
exchange.out.headers['Accept'] = 'application/json';
exchange.out.body =JSON.stringify(obj);
```

* Click on the **Done** button.

* Click on the **Publish **button.

* Enter "**InsuranceQuoting**" as the **Integration Name.**

* Wait for the integration to be deployed \(~5min\).

* Open a terminal

* Execute the following commands:

```
oc login https://master.REPLACE_SUFFIX:8443
oc project ignite
oc expose dc i-insurancequoting --port 8080
oc expose service i-insurancequoting
```





