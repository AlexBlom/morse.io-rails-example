#README

This README provides a quick example of building contextual
Gmail/Outlook apps with morse.io.
See [https://morse.io/developers](https://morse.io/developers) for full documentation.

At a high level, morse.io makes it fast to build context-driven email apps which appear next to Gmail & Outlook. You simply create a morse.io App, set an Application Url (probably to the url of this rails app - where we direct your requests) and resolve certain events.

##Application Url Structure, Events and Params

An event refers to user installing / uninstalling your app, or an instance where it is being rendered next to an inbox.There is an assumption your application has implemented each route and has support for each event.

*Base url for all requests:*

```
  https://ApplicationUrl/MorseUserEmail/MorseInstallId
```

The main event is the /show, which occurs when your app is rendered
next to email (via the morse.io sidebar and an iframe).

Additional parameters are available in this request to identify active contacts on the email, allowing you to scope your views based on email context.

For current event & available parameter documentation, see [https://morse.io/developers/docs/events](https://morse.io/developers/docs/events).

##Where to look

Given this repository is demonstrative, no actual models have been stubbed.

The modified files are:
- config/routes.rb
- app/controllers/email_app_controller.rb
- app/views/email_apps/

##Further support
See [https://morse.io/developers](https://morse.io/developers).
