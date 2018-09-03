## Deploy the sample web application

* Go to htps://master.REPLACE\_SUFFIX:8443
* Login as ...
* Click on **Select from Project.**
* Select **openshift** project.
* Select the **quoting-app** template.
* Click **Next**.
* Click **Next.**
* Select **Create Project.**
* Enter "**quoting-app**" as the **Project Name**
* Enter "**Quoting WebApp" **as the** Project Display Name.**
* Open a new browser tab and go to 3scale admin console: [https://3scale-admin.3scale.REPLACE\_SUFFX](https://3scale-admin.3scale.REPLACE_SUFFX)
* Login as admin/admin
* Click on the **Applications** tab.
* Click on the **QuoteApp** application.
* You will copy the ClientID and ClientSecret from this screen.

* Go back to the Openshift admin console.

* Enter the following paramteres:

| Parameter | Value |
| :--- | :--- |
| **Application Hostname** | quoting.REPLACE\_SUFFIX |
| **Quotes API URL** | [https://3scale.3scale.REPLACE\_SUFFIX/swagger/spec/quotes.json](https://3scale.3scale.REPLACE_SUFFIX/swagger/spec/quotes.json) |
| **Quotes API Client Secret** | &lt;Paste Client ID from 3scale&gt; |
| **Quotes API ClientID** | &lt;Paste Client Secret from 3scale&gt; |
| **RH Single Sign-On URL** | [http://sso-unsecured.REPLACE\_SUFFIX/auth](http://sso-unsecured.REPLACE_SUFFIX/auth) |

* Click on the **Create** button.



