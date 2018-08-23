### Introduction
[![WibmoPay PG SDK (Wibmo Pay)](https://img.shields.io/badge/sdk-Wibmo%20Pay-brightgreen.svg?style=flat-square)](https://github.com/mypoolin/mypoolin-sdk/wiki/Mypoolin-Payment-Gateway)

This is the documentation for integrating WibmoPay payment gateway on your iOS app.
#### Features
+ UPI
+ Cards
+ Wallets
   - Paytm
   - Mobikwik

# Integration
## **WibmoPay PG Integration Steps in Swift-Xcode**
### Step 1. 
Add this to your project **podfile** `pod WibmoPay`.Minimum deployment target version for WibmoPay SDK is `9.0` and swift version `4.1` and WibmoPay SDK version is `0.1.10`.
### Step 2. 
Go to terminals and go to project path and type `pod install`,By doing so WibmoPay SDK code is download to your project and you can invoke SDK methods as follow.
### Step 3.
Added the `import WibmoPay`, Create a struct like below in your project controller(controller - where you would like to start calling SDK methods).
create struct xxxx : MerchantTxnProtocol{} ,then you would be asked to add Protocol methods and adding so your struct would look like as below.
```java
struct MerchantDetails: MerchantTxnProtocol {

    var merchantName: String
    
    var merchantKey: String
    
    var merchantCallbackUrl: String
    
    var merchantTxnAmount: String
    
    var merchantMessage: String
    
    var merchantTxnId: String
    
    var merchantPaymentOption: String
    
    var payerName: String
    
    var payerMobile: String
    
    var payerEmailId: String
    
    var buildEnv: BuildEnvironment  
}
```
### Step 4.
---
## Request Code [SWIFT]
| Request Parameters| Type | Mandatory |
|:---|:---:|:---:|
| `"merchantName"`|String | Yes
| `"merchantAmount"`|String | Yes
| `"merchantTxnId"`|String | Yes
| `"merchantKey"`|String | Yes
| `"payerName"`|String | No
| `"payerMobileNo"`|String | No
| `"merchantMessage"`|String | No
| `"payerEmailId"`|String | No
| `"merchantPaymentOption"`|String | No
| `"callbackurl"`|String | Yes
---
### Step 5.
#### Merchant Details are passed to SDK as below.
```java
  let merchantDetails = MerchantDetails(merchantName: <YOUR-MERCHANT-ID>, merchantKey: <YOUR-MERCHANT-KEY>), merchantCallbackUrl: <YOUR-MERCHANT-CALLBACKURL>, merchantTxnAmount: <AMOUNT>, merchantMessage: <MESSAGE>, merchantTxnId: <UNIQUE-TRANSACTION-ID>, merchantPaymentOption: <PAYMENTOPTION>, payerName: <Name>, payerMobile: <MOBILE>, payerEmailId: <EMIAL ID>, buildEnv: <ENVINORMENT>).
```
### Example:
```java
let merchantDetails = MerchantDetails(merchantName: "test", merchantKey: "1f5abc6e46114094b7abdbbee19a5cb9", merchantCallbackUrl: "https://testpgupi.mypoolin.com/callback", merchantTxnAmount: "1", merchantMessage: "Test", merchantTxnId: merchantTxnId, merchantPaymentOption: "paytm,mobikwik,upi,cards", payerName: "Mypoolin", payerMobile: "9900456789", payerEmailId: "mypoolin@gmail.com", buildEnv:.staging)
```
#### Note:
- `buildEnv` can either be .staging or .production depending on your choice, based on the `buildEnv` base URL is set accordingly.

## Callback URL
The merchants are required to submit a redirection url to report the completion of the order. You can share your desired redirection url with our team on email - [`admin@wibmopay.com`](mailto:admin@wibmopay.com) or [`help@wibmopay.com`](mailto:help@wibmopay.com) and we will configure it for you.

The returning checksum is calculated by using `username|order_id|merchant_txn_id|status|secret` and then creating a hash with `sha512` algorithm.
#### Example callback url can be as follow 
- PRODUCTION callback URL `https://pgupi.mypoolin.com/callback`.
- TEST/STAGING URL `https://testpgupi.mypoolin.com/callback`.
- Merchant CUSTOM callback url should be - `https://<YOUR-DOMAIN-CALLBACK-URL>` (NOTE: if setting then it Should be notified to the integration/Business team [help@wibmopay.com]).

### Step 6.
#### Upadte merchant parameters and invoke transaction call as shown below
```java
  WibmoPaySdk.sdkManager.merchantDetails = merchantDetails
  WibmoPaySdk.sdkManager.performTransactionFor(fromController: self) { (response, error) in
            if let result = response {
                print(result.status) // example printing status
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
```
 `performTransactionFor` call will internally do the following:
- check Internet(if not connected `Error` is thrown back to merchant app and merchant app can handle it accordingly).
- Generates checkSum using the request parameter.

## Response
| Response Parameters| Type | Mandatory |
|:---|:---:|:---:|
| `"merchant_name"` | String| yes
| `"order_id"` |String| yes
| `"merchant_txn_id"` |String| yes
| `"status"` |String| yes
| `"payment_mode"` |String| yes
| `"checksum"` |String| yes
| `"amount"` |String| yes
| `"commission"` |String| yes
| `"channel"` |String| yes

Response will be received to the controller class where your initiated the SDK methods.

## `Status` Code is as follow:
| STATUS CODES| Status| Description|
|:---|:---:|:---:|
|COMPLETED| Success| Success
|PENDING | |
|ABORTED | |
|FAILED  | |(for cases where there is error in creation)
|RETRIED | | (for cases where same merchant_txn_id is passed)
|DECLINED | |
|SETTLED | |

### Sample code for Response Handling: 
We have added Completion Handler for receiving response and error from the SDK, Once transaction is completed control comes back to app and Merchant Response and Error is received to `performTransactionFor` method as shown below and Response and error can be handled by merchant accordingly, Below is the sample code to print the erorr and response:
```java
 WibmoPaySdk.sdkManager.performTransactionFor(fromController: self) { (response, error) in
            if let result = response {
                print(result.status) // example: we are printing status from the response.
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
```
### Note.
Follow the below steps if any error/issues related to archiving
-  Go to root project and go to `Build Phase` and click on `+` symbol and select `New Run Script Phase` and the copy paste the below script inside `run script` before releasing the app to app store.
- link to find the script:
`http://ikennd.ac/blog/2015/02/stripping-unwanted-architectures-from-dynamic-libraries-in-xcode/`

#### For Integration reference a sample `WibmoPaydemo` app is pushed to GitHub with `wibmoPay` SDK integrated.
