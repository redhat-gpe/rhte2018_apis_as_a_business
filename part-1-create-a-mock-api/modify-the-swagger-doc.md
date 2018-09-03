* Go to [http://apicurio.REPLACE\_SUFFIX](http://apicurio.REPLACE_SUFFIX)
* Click on the **Register** link.

![](images/apicurio-register.png)

* Complete the form with the following values:  
  | Parameter | Value |
  | :--- | :--- |
  | **First Name** | Username |
  | **Last Name** | Lastname |
  | **Email** | [user@mail.com](mailto:user@mail.com) |
  | **Password** | password |
  | **Confirm Password** | password |

* Click on the **Register **button.

![](images/apicurio-register2.png)

* Click on the** Import API** button.  
  [![](https://github.com/pszuster/3scaleTD_gitbook/raw/master/images/Selection_342.png)](https://github.com/pszuster/3scaleTD_gitbook/blob/master/images/Selection_342.png)

* Enter the URL copied in the previous step.

* Click on the **Import API** button.

![](images/apicurio-importAPI.png)

* Click on the **Edit API** button.

![](images/apicurio-editAPI.png)

* Click on the **Add** button in the **Definitions **section**.**

* Enter **Driver** and click on the **Add** button.

![](images/apicurio-addDefinition.png)

* Add the following properties:

| Property name | Type |
| :--- | :--- |
| driverID | String |
| firstName | String |
| lastName | String |
| fines | Integer |
| validLicense | Boolean |

![](images/apicurio-DriverProps.png)

* Click on the **/Driver/:id** path.
* Click on the **GET** operation.

![](images/apicurio-DriverGetOP.png)

* Click on the **Edit** button next to the **200 OK** Response, in the **Responses **section.

![](images/apicurio-EditResponse.png)

* Select **Driver** as the **Type.**

* Click on the **OK** button.

![](images/apicurio-DriverPropsResponse.png)

* Click on **Driver** in the breadcrumb.

* Click on the three dots in the **Driver **API, and select **Download \(JSON\)**.

![](images/apicurio-SaveJSON.png)

* Save the file to your disk.



