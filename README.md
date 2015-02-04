#README

This code base provides a basic working example email integration to
[https://morse.io"](morse.io) with Rails 4. morse.io is used to build
Gmail & Outlook apps that are context aware in <1hr.

See [https://morse.io/developers](https://morse.io/developers) for full documentation.

##Getting Started
1 - Read more about developing morse.io email apps
[https://morse.io/developers](link)

2 - Create a new morse.io app
[https://morse.io/developers/apps/new](link)]

3 - Clone this repository

4 - Modify app/controllers/email_app_controller.rb to set your
application secret

##Overview

morse.io apps are really just canvas applications rendered through an
iframe. When creating an application you set a https application url.
morse.io will then communicate with your apps via events.

An event refers to a user uninstalling, installing, attempting to edit
or having your app rendered next to an email within the Gmail / Outlook
inbox (/show).

In the event of a show action, paramaters to identify the active contact
(contact_name & contact_email). Use this to scope contextually relevant
information to your app.

*Base url for all requests:*

```
  https://ApplicationUrl/MorseUserEmail/MorseInstallId
```

For current event & available parameter documentation, see [https://morse.io/developers/docs/events](https://morse.io/developers/docs/events).

##Where to look

The modified files are:
- config/routes.rb
- app/controllers/email_app_controller.rb

##Further support
See [https://morse.io/developers](https://morse.io/developers).
