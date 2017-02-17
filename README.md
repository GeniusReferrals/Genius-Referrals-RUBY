# Getting started

## How to Build

This client library is a Ruby gem which can be compiled and used in your Ruby and Ruby on Rails project. This library requires a few gems from the RubyGems repository.

1. Open the command line interface or the terminal and navigate to the folder containing the source code.
2. Run ``` gem build genius_referrals.gemspec ``` to build the gem.
3. Once built, the gem can be installed on the current work environment using ``` gem install genius_referrals-1.0.0.gem ```

![Building Gem](https://apidocs.io/illustration/ruby?step=buildSDK&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=Genius%20Referrals-Ruby&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

## How to Use

The following section explains how to use the GeniusReferrals Ruby Gem in a new Rails project using RubyMine&trade;. The basic workflow presented here is also applicable if you prefer using a different editor or IDE.

### 1. Starting a new project

Close any existing projects in RubyMine&trade; by selecting ``` File -> Close Project ```. Next, click on ``` Create New Project ``` to create a new project from scratch.

![Create a new project in RubyMine](https://apidocs.io/illustration/ruby?step=createNewProject0&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

Next, provide ``` TestApp ``` as the project name, choose ``` Rails Application ``` as the project type, and click ``` OK ```.

![Create a new Rails Application in RubyMine - step 1](https://apidocs.io/illustration/ruby?step=createNewProject1&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

In the next dialog make sure that correct *Ruby SDK* is being used (minimum 2.0.0) and click ``` OK ```.

![Create a new Rails Application in RubyMine - step 2](https://apidocs.io/illustration/ruby?step=createNewProject2&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

This will create a new Rails Application project with an existing set of files and folder.

### 2. Add reference of the gem

In order to use the GeniusReferrals gem in the new project we must add a gem reference. Locate the ```Gemfile``` in the *Project Explorer* window under the ``` TestApp ``` project node. The file contains references to all gems being used in the project. Here, add the reference to the library gem by adding the following line: ``` gem 'genius_referrals', '~> 1.0.0' ```

![Add references of the Gemfile](https://apidocs.io/illustration/ruby?step=addReference&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

### 3. Adding a new Rails Controller

Once the ``` TestApp ``` project is created, a folder named ``` controllers ``` will be visible in the *Project Explorer* under the following path: ``` TestApp > app > controllers ```. Right click on this folder and select ``` New -> Run Rails Generator... ```.

![Run Rails Generator on Controllers Folder](https://apidocs.io/illustration/ruby?step=addCode0&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

Selecting the said option will popup a small window where the generator names are displayed. Here, select the ``` controller ``` template.

![Create a new Controller](https://apidocs.io/illustration/ruby?step=addCode1&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

Next, a popup window will ask you for a Controller name and included Actions. For controller name provide ``` Hello ``` and include an action named ``` Index ``` and click ``` OK ```.

![Add a new Controller](https://apidocs.io/illustration/ruby?step=addCode2&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

A new controller class anmed ``` HelloController ``` will be created in a file named ``` hello_controller.rb ``` containing a method named ``` Index ```. In this method, add code for initialization and a sample for its usage.

![Initialize the library](https://apidocs.io/illustration/ruby?step=addCode3&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0)

## How to Test

You can test the generated SDK and the server with automatically generated test
cases as follows:

  1. From terminal/cmd navigate to the root directory of the SDK.
  2. Invoke: `bundle exec rake`

## Initialization

### Authentication
In order to setup authentication and initialization of the API client, you need the following information.

| Parameter | Description |
|-----------|-------------|
| content_type | The content type |
| x_auth_token | Your API Token, you can get your token here https://www.geniusreferrals.com/en/settings/api-access |



API client can be initialized as following.

```ruby
# Configuration parameters and credentials
content_type = "application/json"; # The content type
x_auth_token = "3b9d11374b602fb47b987dff90f1c5940a1f377f"; # Your API Token, you can get your token here https://www.geniusreferrals.com/en/settings/api-access

client = GeniusReferrals::GeniusReferralsClient.new(content_type, x_auth_token)
```

The added initlization code can be debugged by putting a breakpoint in the ``` Index ``` method and running the project in debug mode by selecting ``` Run -> Debug 'Development: TestApp' ```.

![Debug the TestApp](https://apidocs.io/illustration/ruby?step=addCode4&workspaceFolder=Genius%20Referrals-Ruby&workspaceName=GeniusReferrals&projectName=genius_referrals&gemName=genius_referrals&gemVer=1.0.0&initLine=client%2520%253D%2520GeniusReferralsClient.new%2528%2527content_type%2527%252C%2520%2527x_auth_token%2527%2529)

## Class Reference

### <a name="list_of_controllers"></a>List of Controllers

* [RootsController](#roots_controller)
* [AuthenticationsController](#authentications_controller)
* [AdvocatesController](#advocates_controller)
* [AccountsController](#accounts_controller)
* [ReportsController](#reports_controller)
* [ReferralsController](#referrals_controller)
* [RedemptionRequestsController](#redemption_requests_controller)
* [BonusesController](#bonuses_controller)
* [CampaignsController](#campaigns_controller)

### <a name="roots_controller"></a>![Class: ](https://apidocs.io/img/class.png ".RootsController") RootsController

#### Get singleton instance

The singleton instance of the ``` RootsController ``` class can be accessed from the API Client.

```ruby
roots = client.roots
```

#### <a name="get_root"></a>![Method: ](https://apidocs.io/img/method.png ".RootsController.get_root") get_root

> The root of the API


```ruby
def get_root; end
```

#### Example Usage

```ruby

result = roots.get_root()

```


[Back to List of Controllers](#list_of_controllers)

### <a name="authentications_controller"></a>![Class: ](https://apidocs.io/img/class.png ".AuthenticationsController") AuthenticationsController

#### Get singleton instance

The singleton instance of the ``` AuthenticationsController ``` class can be accessed from the API Client.

```ruby
authentications = client.authentications
```

#### <a name="get_authentications"></a>![Method: ](https://apidocs.io/img/method.png ".AuthenticationsController.get_authentications") get_authentications

> Allow clients to test authentication on Genius Referrals platform.


```ruby
def get_authentications; end
```

#### Example Usage

```ruby

result = authentications.get_authentications()

```


[Back to List of Controllers](#list_of_controllers)

### <a name="advocates_controller"></a>![Class: ](https://apidocs.io/img/class.png ".AdvocatesController") AdvocatesController

#### Get singleton instance

The singleton instance of the ``` AdvocatesController ``` class can be accessed from the API Client.

```ruby
advocates = client.advocates
```

#### <a name="delete_advocate"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.delete_advocate") delete_advocate

> Delete an advocate


```ruby
def delete_advocate(account_slug, 
                        advocate_token); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'

advocates.delete_advocate(account_slug, advocate_token)

```


#### <a name="put_advocate"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.put_advocate") put_advocate

> Update an advocate.


```ruby
def put_advocate(account_slug, 
                     advocate_token, 
                     advocate_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| advocate_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
advocate_form = AdvocateForm.new

advocates.put_advocate(account_slug, advocate_token, advocate_form)

```


#### <a name="post_advocate"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.post_advocate") post_advocate

> Create a new advocate.


```ruby
def post_advocate(account_slug, 
                      advocate_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_form = AdvocateForm.new

result = advocates.post_advocate(account_slug, advocate_form)

```


#### <a name="get_advocate"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.get_advocate") get_advocate

> Get an advocate by a given token.


```ruby
def get_advocate(account_slug, 
                     advocate_token); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'

result = advocates.get_advocate(account_slug, advocate_token)

```


#### <a name="delete_advocates"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.delete_advocates") delete_advocates

> Delete all advocates


```ruby
def delete_advocates(account_slug); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |


#### Example Usage

```ruby
account_slug = 'account_slug'

advocates.delete_advocates(account_slug)

```


#### <a name="get_advocates"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.get_advocates") get_advocates

> Get the list of advocates


```ruby
def get_advocates(account_slug, 
                      page = 1, 
                      limit = 10, 
                      filter = nil, 
                      sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| page |  ``` Optional ```  ``` DefaultValue ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  ``` DefaultValue ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: name, lastname, email, advocate_token, bonus_exchange_method_slug, campaign_slug, can_refer, is_referral, from, to, created. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: name, lastname, email, created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort='last_name\|first_name\|-hire_date' |


#### Example Usage

```ruby
account_slug = 'account_slug'
page = 1
limit = 10
filter = 'filter'
sort = 'sort'

result = advocates.get_advocates(account_slug, page, limit, filter, sort)

```


#### <a name="patch_advocate"></a>![Method: ](https://apidocs.io/img/method.png ".AdvocatesController.patch_advocate") patch_advocate

> Update partial elements of an advocate.


```ruby
def patch_advocate(account_slug, 
                       advocate_token, 
                       advocate_patch_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| advocate_patch_form |  ``` Required ```  ``` Collection ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
advocate_patch_form = [AdvocatePatchForm.new]

result = advocates.patch_advocate(account_slug, advocate_token, advocate_patch_form)

```


[Back to List of Controllers](#list_of_controllers)

### <a name="accounts_controller"></a>![Class: ](https://apidocs.io/img/class.png ".AccountsController") AccountsController

#### Get singleton instance

The singleton instance of the ``` AccountsController ``` class can be accessed from the API Client.

```ruby
accounts = client.accounts
```

#### <a name="get_account"></a>![Method: ](https://apidocs.io/img/method.png ".AccountsController.get_account") get_account

> Get an account by a given slug.


```ruby
def get_account(account_slug); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |


#### Example Usage

```ruby
account_slug = 'account_slug'

result = accounts.get_account(account_slug)

```


#### <a name="get_accounts"></a>![Method: ](https://apidocs.io/img/method.png ".AccountsController.get_accounts") get_accounts

> Get the list of accounts.


```ruby
def get_accounts(page = nil, 
                     limit = nil, 
                     filter = nil, 
                     sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| page |  ``` Optional ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: name. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: name, created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort=last_name\|first_name\|-hire_date |


#### Example Usage

```ruby
page = 242
limit = 242
filter = 'filter'
sort = 'sort'

result = accounts.get_accounts(page, limit, filter, sort)

```


[Back to List of Controllers](#list_of_controllers)

### <a name="reports_controller"></a>![Class: ](https://apidocs.io/img/class.png ".ReportsController") ReportsController

#### Get singleton instance

The singleton instance of the ``` ReportsController ``` class can be accessed from the API Client.

```ruby
reports = client.reports
```

#### <a name="get_referrals_summary_per_origin"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_referrals_summary_per_origin") get_referrals_summary_per_origin

> Get referrals summary per referral origin.


```ruby
def get_referrals_summary_per_origin(advocate_token); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| advocate_token |  ``` Required ```  | The advocate's token |


#### Example Usage

```ruby
advocate_token = 'advocate_token'

result = reports.get_referrals_summary_per_origin(advocate_token)

```


#### <a name="get_bonuses_summary_per_origin"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_bonuses_summary_per_origin") get_bonuses_summary_per_origin

> Get bonuses summary per referral origin.


```ruby
def get_bonuses_summary_per_origin(advocate_token); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| advocate_token |  ``` Required ```  | The advocate's token |


#### Example Usage

```ruby
advocate_token = 'advocate_token'

result = reports.get_bonuses_summary_per_origin(advocate_token)

```


#### <a name="get_top_advocates"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_top_advocates") get_top_advocates

> Get top 10 advocates.


```ruby
def get_top_advocates(account_slug = nil, 
                          campaign_slug = nil, 
                          limit = nil, 
                          from = nil, 
                          to = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Optional ```  | The account identifier |
| campaign_slug |  ``` Optional ```  | The campaign identifier |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10) |
| from |  ``` Optional ```  | The datetime were the range of the search starts |
| to |  ``` Optional ```  | The datetime were the range of the search stops |


#### Example Usage

```ruby
account_slug = 'account_slug'
campaign_slug = 'campaign_slug'
limit = 242
from = DateTime.now
to = DateTime.now

result = reports.get_top_advocates(account_slug, campaign_slug, limit, from, to)

```


#### <a name="get_share_daily_participation"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_share_daily_participation") get_share_daily_participation

> Get share daily participation.


```ruby
def get_share_daily_participation(account_slug = nil, 
                                      campaign_slug = nil, 
                                      advocate_token = nil, 
                                      from = nil, 
                                      to = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Optional ```  | The account identifier |
| campaign_slug |  ``` Optional ```  | The campaign identifier |
| advocate_token |  ``` Optional ```  | The advocate's token |
| from |  ``` Optional ```  | The datetime were the range of the search starts |
| to |  ``` Optional ```  | The datetime were the range of the search stops |


#### Example Usage

```ruby
account_slug = 'account_slug'
campaign_slug = 'campaign_slug'
advocate_token = 'advocate_token'
from = DateTime.now
to = DateTime.now

result = reports.get_share_daily_participation(account_slug, campaign_slug, advocate_token, from, to)

```


#### <a name="get_referral_daily_participation"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_referral_daily_participation") get_referral_daily_participation

> Get referral daily participation.


```ruby
def get_referral_daily_participation(account_slug = nil, 
                                         campaign_slug = nil, 
                                         advocate_token = nil, 
                                         from = nil, 
                                         to = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Optional ```  | The account identifier |
| campaign_slug |  ``` Optional ```  | The campaign identifier |
| advocate_token |  ``` Optional ```  | The advocate's token |
| from |  ``` Optional ```  | The datetime were the range of the search starts |
| to |  ``` Optional ```  | The datetime were the range of the search stops |


#### Example Usage

```ruby
account_slug = 'account_slug'
campaign_slug = 'campaign_slug'
advocate_token = 'advocate_token'
from = DateTime.now
to = DateTime.now

result = reports.get_referral_daily_participation(account_slug, campaign_slug, advocate_token, from, to)

```


#### <a name="get_click_daily_participation"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_click_daily_participation") get_click_daily_participation

> Get click daily participation.


```ruby
def get_click_daily_participation(account_slug = nil, 
                                      campaign_slug = nil, 
                                      advocate_token = nil, 
                                      from = nil, 
                                      to = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Optional ```  | The account identifier |
| campaign_slug |  ``` Optional ```  | The campaign identifier |
| advocate_token |  ``` Optional ```  | The advocate's token |
| from |  ``` Optional ```  | The datetime were the range of the search starts |
| to |  ``` Optional ```  | The datetime were the range of the search stops |


#### Example Usage

```ruby
account_slug = 'account_slug'
campaign_slug = 'campaign_slug'
advocate_token = 'advocate_token'
from = DateTime.now
to = DateTime.now

result = reports.get_click_daily_participation(account_slug, campaign_slug, advocate_token, from, to)

```


#### <a name="get_bonuses_daily_given"></a>![Method: ](https://apidocs.io/img/method.png ".ReportsController.get_bonuses_daily_given") get_bonuses_daily_given

> Get bonuses daily given.


```ruby
def get_bonuses_daily_given(account_slug = nil, 
                                campaign_slug = nil, 
                                advocate_token = nil, 
                                from = nil, 
                                to = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Optional ```  | The account identifier |
| campaign_slug |  ``` Optional ```  | The campaign identifier |
| advocate_token |  ``` Optional ```  | The advocate identifier |
| from |  ``` Optional ```  | The datetime were the range of the search starts |
| to |  ``` Optional ```  | The datetime were the range of the search stops |


#### Example Usage

```ruby
account_slug = 'account_slug'
campaign_slug = 'campaign_slug'
advocate_token = 'advocate_token'
from = DateTime.now
to = DateTime.now

result = reports.get_bonuses_daily_given(account_slug, campaign_slug, advocate_token, from, to)

```


[Back to List of Controllers](#list_of_controllers)

### <a name="referrals_controller"></a>![Class: ](https://apidocs.io/img/class.png ".ReferralsController") ReferralsController

#### Get singleton instance

The singleton instance of the ``` ReferralsController ``` class can be accessed from the API Client.

```ruby
referrals = client.referrals
```

#### <a name="get_referral_origin"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.get_referral_origin") get_referral_origin

> Get a referral origin by a given slug.


```ruby
def get_referral_origin(referral_origin_slug); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| referral_origin_slug |  ``` Required ```  | The referral origin identifier |


#### Example Usage

```ruby
referral_origin_slug = 'referral_origin_slug'

result = referrals.get_referral_origin(referral_origin_slug)

```


#### <a name="get_referral_origins"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.get_referral_origins") get_referral_origins

> Get referral origins. This is needed when creating (POST) a new referral, as referral_origin_slug refers to one of this origins.


```ruby
def get_referral_origins; end
```

#### Example Usage

```ruby

result = referrals.get_referral_origins()

```


#### <a name="get_referral"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.get_referral") get_referral

> Get a referral by a given id.


```ruby
def get_referral(account_slug, 
                     advocate_token, 
                     referral_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| referral_id |  ``` Required ```  | The referral id |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
referral_id = 'referral_id'

result = referrals.get_referral(account_slug, advocate_token, referral_id)

```


#### <a name="delete_referral"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.delete_referral") delete_referral

> Delete a referral.


```ruby
def delete_referral(account_slug, 
                        advocate_token, 
                        referral_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| referral_id |  ``` Required ```  | The referral identifier |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
referral_id = 'referral_id'

referrals.delete_referral(account_slug, advocate_token, referral_id)

```


#### <a name="post_referrals"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.post_referrals") post_referrals

> Create a new referral.


```ruby
def post_referrals(account_slug, 
                       advocate_token, 
                       referral_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| referral_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
referral_form = ReferralForm.new

result = referrals.post_referrals(account_slug, advocate_token, referral_form)

```


#### <a name="put_referral"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.put_referral") put_referral

> Update a referral.


```ruby
def put_referral(account_slug, 
                     advocate_token, 
                     referral_id, 
                     referral_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| referral_id |  ``` Required ```  | The referral id |
| referral_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
referral_id = 'referral_id'
referral_form = ReferralForm.new

referrals.put_referral(account_slug, advocate_token, referral_id, referral_form)

```


#### <a name="get_referrals"></a>![Method: ](https://apidocs.io/img/method.png ".ReferralsController.get_referrals") get_referrals

> Get the list of referrals for a given advocate.


```ruby
def get_referrals(account_slug, 
                      advocate_token, 
                      page = nil, 
                      limit = nil, 
                      filter = nil, 
                      sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The advocate's token |
| page |  ``` Optional ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: url, referral_origin_slug, created. Use the following delimiters to build your filters params. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort='last_name\|first_name\|-hire_date' |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
page = 201
limit = 201
filter = 'filter'
sort = 'sort'

result = referrals.get_referrals(account_slug, advocate_token, page, limit, filter, sort)

```


[Back to List of Controllers](#list_of_controllers)

### <a name="redemption_requests_controller"></a>![Class: ](https://apidocs.io/img/class.png ".RedemptionRequestsController") RedemptionRequestsController

#### Get singleton instance

The singleton instance of the ``` RedemptionRequestsController ``` class can be accessed from the API Client.

```ruby
redemptionRequests = client.redemption_requests
```

#### <a name="get_redemption_request_status"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.get_redemption_request_status") get_redemption_request_status

> Get a redemption request status.


```ruby
def get_redemption_request_status(redemption_request_status_slug); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| redemption_request_status_slug |  ``` Required ```  | The redemption request status identifier |


#### Example Usage

```ruby
redemption_request_status_slug = 'redemption_request_status_slug'

result = redemptionRequests.get_redemption_request_status(redemption_request_status_slug)

```


#### <a name="get_redemption_request_statuses"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.get_redemption_request_statuses") get_redemption_request_statuses

> Get redemption request statuses.


```ruby
def get_redemption_request_statuses; end
```

#### Example Usage

```ruby

result = redemptionRequests.get_redemption_request_statuses()

```


#### <a name="get_redemption_request_action"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.get_redemption_request_action") get_redemption_request_action

> Get a redemption request action.


```ruby
def get_redemption_request_action(redemption_request_action_slug); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| redemption_request_action_slug |  ``` Required ```  | The redemption request action identifier |


#### Example Usage

```ruby
redemption_request_action_slug = 'redemption_request_action_slug'

result = redemptionRequests.get_redemption_request_action(redemption_request_action_slug)

```


#### <a name="get_redemption_request_actions"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.get_redemption_request_actions") get_redemption_request_actions

> Get redemption request actions.


```ruby
def get_redemption_request_actions; end
```

#### Example Usage

```ruby

result = redemptionRequests.get_redemption_request_actions()

```


#### <a name="patch_redemption_request"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.patch_redemption_request") patch_redemption_request

> Redeem a redemption request. After the redemption request is created it needs to be redeemed. This will deduct the amount of the advocate unclaimed balance and move the request to the completed state.


```ruby
def patch_redemption_request(account_slug, 
                                 redemption_request_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| redemption_request_id |  ``` Required ```  | The redemption request id |


#### Example Usage

```ruby
account_slug = 'account_slug'
redemption_request_id = 201

redemptionRequests.patch_redemption_request(account_slug, redemption_request_id)

```


#### <a name="post_redemption_request"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.post_redemption_request") post_redemption_request

> Create a redemption request.


```ruby
def post_redemption_request(account_slug, 
                                redemption_request_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| redemption_request_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
redemption_request_form = RedemptionRequestForm.new

result = redemptionRequests.post_redemption_request(account_slug, redemption_request_form)

```


#### <a name="get_redemption_request"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.get_redemption_request") get_redemption_request

> Get a redemption request by a given id.


```ruby
def get_redemption_request(account_slug, 
                               redemption_request_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| redemption_request_id |  ``` Required ```  | The redemption request identifier |


#### Example Usage

```ruby
account_slug = 'account_slug'
redemption_request_id = 'redemption_request_id'

result = redemptionRequests.get_redemption_request(account_slug, redemption_request_id)

```


#### <a name="get_redemption_requests"></a>![Method: ](https://apidocs.io/img/method.png ".RedemptionRequestsController.get_redemption_requests") get_redemption_requests

> Get the list of redemption requests.


```ruby
def get_redemption_requests(account_slug, 
                                page = nil, 
                                limit = nil, 
                                filter = nil, 
                                sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| page |  ``` Optional ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: redemption_request_id, name, lastname, email, request_status_slug, request_action_slug, from, to, created. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: name, lastname, email, created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort='last_name\|first_name\|-hire_date' |


#### Example Usage

```ruby
account_slug = 'account_slug'
page = 'page'
limit = 'limit'
filter = 'filter'
sort = 'sort'

result = redemptionRequests.get_redemption_requests(account_slug, page, limit, filter, sort)

```


[Back to List of Controllers](#list_of_controllers)

### <a name="bonuses_controller"></a>![Class: ](https://apidocs.io/img/class.png ".BonusesController") BonusesController

#### Get singleton instance

The singleton instance of the ``` BonusesController ``` class can be accessed from the API Client.

```ruby
bonuses = client.bonuses
```

#### <a name="get_bonuses"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.get_bonuses") get_bonuses

> Get the list of bonuses for a given account.


```ruby
def get_bonuses(account_slug, 
                    page = nil, 
                    limit = nil, 
                    filter = nil, 
                    sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| page |  ``` Optional ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: name, lastname, email, campaign_slug, from, to, created. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: name, lastname, email, created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort='last_name\|first_name\|-hire_date' |


#### Example Usage

```ruby
account_slug = 'account_slug'
page = 201
limit = 201
filter = 'filter'
sort = 'sort'

result = bonuses.get_bonuses(account_slug, page, limit, filter, sort)

```


#### <a name="post_bonuses"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.post_bonuses") post_bonuses

> Make an attempt to give a bonus for to the advocate's referrer. The system processes the given advocate (referral) and creates a bonus for the advocate's referrer if is needed. All restrictions set on the campaigns for this account will be check out before giving the bonus to the advocate's referrer.


```ruby
def post_bonuses(account_slug, 
                     bonuses_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| bonuses_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
bonuses_form = BonusesForm.new

result = bonuses.post_bonuses(account_slug, bonuses_form)

```


#### <a name="get_bonuses_checkup"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.get_bonuses_checkup") get_bonuses_checkup

> Check if there is a bonus to be given to the advocate. Allows the clients to check if there is a bonus to be given, it simulates the behaivor of a POST request to /accounts/{account_slug}/bonuses resource. This resource is idempotent.


```ruby
def get_bonuses_checkup(account_slug, 
                            advocate_token, 
                            reference, 
                            payment_amount); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| advocate_token |  ``` Required ```  | The referral's token. Usually the one that completed the purchase, or trigger an event. |
| reference |  ``` Required ```  | The reference number for this request. Usually the order_id, payment_id, or timestamp. |
| payment_amount |  ``` Required ```  | The payment amount the referrals has made. Required for a percentage based campaign. |


#### Example Usage

```ruby
account_slug = 'account_slug'
advocate_token = 'advocate_token'
reference = 'reference'
payment_amount = 201.244745685833

result = bonuses.get_bonuses_checkup(account_slug, advocate_token, reference, payment_amount)

```


#### <a name="post_bonuses_force"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.post_bonuses_force") post_bonuses_force

> Force the system to give a bonus to an advocate. The system will not take into account the restriccions specified on the campaigns.


```ruby
def post_bonuses_force(account_slug, 
                           bonus_form); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| bonus_form |  ``` Required ```  | The body of the request |


#### Example Usage

```ruby
account_slug = 'account_slug'
bonus_form = BonusesForm1.new

result = bonuses.post_bonuses_force(account_slug, bonus_form)

```


#### <a name="get_bonuses_trace"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.get_bonuses_trace") get_bonuses_trace

> Get a bonus request trace.


```ruby
def get_bonuses_trace(account_slug, 
                          trace_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| trace_id |  ``` Required ```  | The trace id |


#### Example Usage

```ruby
account_slug = 'account_slug'
trace_id = 201

result = bonuses.get_bonuses_trace(account_slug, trace_id)

```


#### <a name="delete_bonus"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.delete_bonus") delete_bonus

> Delete a bonus


```ruby
def delete_bonus(account_slug, 
                     bonus_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| bonus_id |  ``` Required ```  | The bonus id |


#### Example Usage

```ruby
account_slug = 'account_slug'
bonus_id = 201

bonuses.delete_bonus(account_slug, bonus_id)

```


#### <a name="get_bonus"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.get_bonus") get_bonus

> Get a bonus by a given id.


```ruby
def get_bonus(account_slug, 
                  bonus_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| bonus_id |  ``` Required ```  | The bonus id |


#### Example Usage

```ruby
account_slug = 'account_slug'
bonus_id = 201

result = bonuses.get_bonus(account_slug, bonus_id)

```


#### <a name="get_bonuses_traces"></a>![Method: ](https://apidocs.io/img/method.png ".BonusesController.get_bonuses_traces") get_bonuses_traces

> Get the list of bonuses traces (audit trail). Every time the system tries to give a bonus the an advocate a new trace is created.


```ruby
def get_bonuses_traces(account_slug, 
                           page = nil, 
                           limit = nil, 
                           filter = nil, 
                           sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| page |  ``` Optional ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: reference, result, bonus_amount, advocate_token, advocate_referrer_token, campaign_slug, from, to, created. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: created. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort='last_name\|first_name\|-hire_date' |


#### Example Usage

```ruby
account_slug = 'account_slug'
page = 201
limit = 201
filter = 'filter'
sort = 'sort'

result = bonuses.get_bonuses_traces(account_slug, page, limit, filter, sort)

```


[Back to List of Controllers](#list_of_controllers)

### <a name="campaigns_controller"></a>![Class: ](https://apidocs.io/img/class.png ".CampaignsController") CampaignsController

#### Get singleton instance

The singleton instance of the ``` CampaignsController ``` class can be accessed from the API Client.

```ruby
campaigns = client.campaigns
```

#### <a name="get_campaign"></a>![Method: ](https://apidocs.io/img/method.png ".CampaignsController.get_campaign") get_campaign

> Get a campaign by a given slug.


```ruby
def get_campaign(account_slug, 
                     campaign_slug); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| campaign_slug |  ``` Required ```  | The campaign identifier |


#### Example Usage

```ruby
account_slug = 'account_slug'
campaign_slug = 'campaign_slug'

result = campaigns.get_campaign(account_slug, campaign_slug)

```


#### <a name="get_campaigns"></a>![Method: ](https://apidocs.io/img/method.png ".CampaignsController.get_campaigns") get_campaigns

> Get the list of campaings for a given account.


```ruby
def get_campaigns(account_slug, 
                      page = nil, 
                      limit = nil, 
                      filter = nil, 
                      sort = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| account_slug |  ``` Required ```  | The account identifier |
| page |  ``` Optional ```  | Page number, e.g. 1 would start at the first result, and 10 would start at the tenth result. |
| limit |  ``` Optional ```  | Maximum number of results to return in the response. Default (10), threshold (100) |
| filter |  ``` Optional ```  | Allowed fields: name, description, start_date, end_date, is_active (true\|false), created. Use the following delimiters to build your filters params. The vertical bar ('\|') to separate individual filter phrases and a double colon ('::') to separate the names and values. The delimiter of the double colon (':') separates the property name from the comparison value, enabling the comparison value to contain spaces. Example: www.example.com/users?filter='name::todd\|city::denver\|title::grand poobah' |
| sort |  ``` Optional ```  | Allowed fields: campaign_slug, created, start_date, end_date, is_active. Use sort query-string parameter that contains a delimited set of property names. For each property name, sort in ascending order, and for each property prefixed with a dash ('-') sort in descending order. Separate each property name with a vertical bar ('\|'), which is consistent with the separation of the name\|value pairs in filtering, above. For example, if we want to retrieve users in order of their last name (ascending), first name (ascending) and hire date (descending), the request might look like this www.example.com/users?sort='last_name\|first_name\|-hire_date' |


#### Example Usage

```ruby
account_slug = 'account_slug'
page = 37
limit = 37
filter = 'filter'
sort = 'sort'

result = campaigns.get_campaigns(account_slug, page, limit, filter, sort)

```


[Back to List of Controllers](#list_of_controllers)



