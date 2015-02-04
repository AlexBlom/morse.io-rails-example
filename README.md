#Build email apps with morse.io

This code base provides a basic working example email integration to
[https://morse.io](morse.io) with Rails 4. morse.io is used to build
Gmail & Outlook apps that are context aware in <1hr.

See [https://morse.io/developers](https://morse.io/developers) for full documentation.

##Overview

When a user loads Gmail or Outlook, the sidebar is inserted to the right of the inbox and emails apps are rendered within the sidebar. Users can install as many email apps as they like, and apps can be public (available to all) or private (invite/organization only).

Email apps are iframes, pointed to your Application Url (see settings). Your end server must resolve 3 events, a show screen, an edit screen, and respond to an uninstall prompt. The show event contains information identifying the contact, allowing you to show a context-relevant view.

![sample gmail app placement](https://morse.io/assets/app-placement-5da7561b62eac93cc558c1c22bafbad0.png "Sample Gmail app placement")

When creating an application you set a https application url.
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

##Getting Started
1 - Read more about developing morse.io email apps
[https://morse.io/developers](link)

2 - Create a new morse.io app
[https://morse.io/developers/apps/new](link)]

3 - Clone this repository

4 - Modify app/controllers/email_app_controller.rb to set your
application secret

##Where to look

The modified files are:
- config/routes.rb
- app/controllers/email_app_controller.rb

##Further support
See [https://morse.io/developers](https://morse.io/developers).
