# Exam 70-486 Prep Doc

The Microsoft Exam [page](https://www.microsoft.com/en-us/learning/exam-70-486.aspx).

## Design the application architecture (15-20%)

        Plan the application layers
            Plan data access; plan for separation of concerns, appropriate use of models, views, controllers, components, and service dependency injection; choose between client-side and server-side processing; design for scalability; choose between ASP.NET Core and ASP.NET; choose when to use .NET standard libraries

### Data Access

- [Working with data in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/data/?view=aspnetcore-2.1) 2017-10-13
- [Getting Started with Entity Framework 6 Code First using MVC 5](Getting Started with Entity Framework 6 Code First using MVC 5) 2015-10-21
- [Create the Data Access Layer](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/create_the_data_access_layer) 2014-09-07
- [ASP.NET Data Access - Recommended Resources](https://docs.microsoft.com/en-us/aspnet/whitepapers/aspnet-data-access-content-map) 2014-04-03
- [PluralSight](https://app.pluralsight.com/player?course=aspdotnet-mvc5-fundamentals&author=scott-allen&name=aspdotnet-mvc5-fundamentals-m6-ef6&clip=0&mode=live) 2013-11-05

        Design a distributed application
            Design a hybrid application; plan for session management in a distributed environment; plan web farms; run Microsoft Azure services on-premises with Azure Pack; enable deferred processing through Azure features including queues, scheduled and on-demand jobs, Azure Functions, and Azure Web Jobs
        Design and implement the Azure Web Apps life cycle
            Identify and implement Start, Run, and Stop events; code against application events in applications; configure startup tasks, including IIS, app pool configuration, and third-party tools
        Configure state management
            Choose a state management mechanism including in-process, out of process, and Redis-based state management; plan for scalability; use cookies or local storage to maintain state; apply configuration settings in web.config files; implement sessionless state including query strings; configure middleware to enable session and application state in ASP.NET Core
        Design a caching strategy
            Implement page output caching and data caching; create cache profiles; implement HTTP caching; implement Azure Redis caching; plan a content delivery network (CDN) strategy, for example, Azure CDN
        Design and implement a Web Socket strategy
            Read and write string and binary data asynchronously; choose a connection loss strategy; decide when to use Web Sockets; implement SignalR; enable web socket features in an Azure Web App instance
        Design a configuration management solution
            Manage configuration sources, including XML, JSON, and INI files; manage environment variables; implement Option objects; implement multiple environments using files and hierarchical structure; manage sensitive configuration; react to runtime configuration changes; implement a custom configuration source; secure configuration by using Azure Key Vault; use the Secret Manager tool in development to keep secrets out of your code for configuration values
        Interact with the host environment
            Work with file system using file providers; work with environment variables; determine hosting environment capabilities; implement native components, including PInvoke and native dependencies for hosts including Linux and Windows; use ASP.NET hosting on an Open Web Interface for .NET (OWIN)-based server
        Compose an application by using the framework pipeline
            Add custom request processing modules to the pipeline; add, remove, and configure services used in the application; design and implement middleware; design for kestrel, Http.sys web server and IIS; design and implement startup filters

Develop the User Experience (15-20%)

        Plan for search engine optimization and accessibility
            Use analytical tools to parse HTML; provide an xml sitemap and robots.txt file to improve scraping; write semantic markup for accessibility, for example, screen readers; use rich snippets to increase content visibility
        Plan and implement globalization and localization
            Plan a localization strategy; create and apply resources to UI including JavaScript resources; set cultures; implement server side localization and globalization
        Design and implement MVC controllers and actions
            Apply authorization attributes, filters including global, authentication, and overriddable filters; choose and implement custom HTTP status codes and responses; implement action results; implement MVC areas; implement Dependency Injection for services in controllers
        Design and implement routes
            Define a route to handle a URL pattern; apply route constraints; ignore URL patterns; add custom route parameters; define areas; define routes that interoperate with Single Page Application frameworks such as Angular
        Control application behavior by using MVC extensibility points
            Create custom middleware and inject it into the pipeline; implement MVC filters and controller factories; control application behavior by using action results, model binders, and route handlers; inject services into a view
        Design and implement serialization and model binding
            Serialize models and data using supported serialization formats, including JSON, XML, protobuf, and WCF/SOAP; implement model and property binding, including custom binding and model validation; implement web socket communication in MVC; implement file uploading and multipart data; use AutoRest to build clients

> Starting off with the Plural Sight intro to MVC 5 [PluralSight](https://app.pluralsight.com/paths/skills/mvc5). The first _review_ gives a general rundown on the state of the various technologies that will be covered in the exam.  There is no discussion on technology choice.

- Microsoft web technology options (based on HTTP Handler)
  - Standard
    - ASP.NET Web Forms
    - ASP.NET MVC (6)
    - ASP.NET HTML
  - Core
    - ASP.NET MVC (6)
    - ASP.NET HTML
- ASP.NET MVC (5) Request Lifecycle
  - _Event handlers are defined in the `Global.asax` file as `Application[_eventName_]` for example: `Application_BeginRequest`_
  - HttpHandler, only one handler per request lifecycle, it is reusable
    - which handler to invoke is determined by the `ResolveRequestHandler` event
    - the handler is invoked by the `RequestHandlerExecute`
    - create by implementing `IHttpHandler` and add to the route table
    - handlers generate the response which is returned as a result of the request
  - HttpModule, multiple modules that may be used repeatedly at different points
    - modules can modify the request
    - create by implementing `IHttpModule`
  - Controllers, created byt the request handler via a _controller factory_
    - users normally derive from `Controller` and not `IController`
    - called by a handler invoke controller
    - injection is handled during the constructor
    - the controller factory can be extended, again derive from `DefaultControllerFactory` over `IControllerFactory`
    - dependency resolver
      - `IDependencyResolver`
    - action methods
      - only public, non-static and non-override methods can be actions
      - action invoker
        - called from the controller to wire up the pre- and post- action events
      - action selector
        - uses action selectors (post, get, name, custom, etc.)
        - create a custom selector with `ActionMethodSelectorAttribute`
      - filters
        - filters can be applied at the action, controller or application level
          - executed from application to controller to action
        - authentication
        - authorization
        - action filter
          - can execute both before and after action is executed, but before result is generated
          - `OnActionExecuting` event is pre-
          - `OnActionExecuted` event is post-
        - result filter
        - exception filter
      - model binding
        - can derive custom binding methods
      - `OnExecuting` event filters
      - action invoked (user code)
      - `OnExecuted` event filters
    - action result
      - has filters like the action
      - either generates a view or it does not
      - result types (these inherit from `ActionResult`)
        - `ContentResult`
        - `JsonResult`
        - `EmptyResult`
        - `ViewResult`
          - uses a view engine 
            - razor
            - legacy
          - can have multiple view engines in a single application
        - `FileResult`
        - `RedirectResult`
      - custion result types can inherit from `ActionResult`
  - `BeginRequest`
  - `AuthenticateRequest`
  - `AuthorizeRequest`
  - `ResolveRequestHandler`
    - selects route
  - `MapRequestHandler`
  - `AcquireRequestState`
  - `RequestHandlerExecute`
    - Routing
      - URL Routing Module
      - MVC Route Handler
      - MVC HttpHandler
    - Controller
      - Controller factory
        - Controller Resolution
      - DI
    - Action Execution
      - Model Binding
      - Action Filters (Action Executing)
      - Action (User Code)
      - Action Filters (Action Executed)
      - Action Result
    - Result Execution (as view request)
      - Result Filter (Result Executing)
        - Invoke Action Result
      - [Render View]
      - Result Filter (Result Executed)
  - `UpdateRequestCache`
  - `LogRequest`
  - `EndRequest`
- ASP.NET MVC(5) Application Lifecycle
  - `MVCApplication:HttpApplication`
    - Pre-Application-Start
      - not frequently used
      - register custom modules
      - defined in an assembly level attribute (easiest to place directly in the file that defines the _class.method_ .)
        - `[assembly:PreApplicationStartMethod(System.TypeOf(MvcApplication),"MyRegistrationMethodName")]`
    - `ApplicationStart`
      - Global registrations
        - Areas
        - Filters
        - Routes
          - create route handlers and add them to the route collection
        - Bundles (scripts, css)
    - `ApplicationEnd`
      - yeah right, not really a used event

### Security

- none
  - just that, noe
- individual user
  - web forms
  - or 3rd party (OpenID, OAuth - facebook, google, etc)
- organizational
  - federated security
  - Azure Active Directory - AAD
- windows
  - intranet
  - Active Directory - AD

Decorate actions or controllers with the `[Authorize]` attribute to force authentication.  The opposite attribute is the `[AllowAnonymous]` attribute.

- [Developing ASP.NET MVC Web Applications(70-486)](https://github.com/bishopsmove/Certification-Study-Guides/tree/master/Microsoft/MCSD/70-486.MVC) from 2016-09-15
- [Failed the Turing Test](http://failedturing.blogspot.com/search/label/70-486) from 2016-05 and earlier
- [NOTES FOR THE 70-486 ASP.NET MVC CERTIFICATION](https://www.barbarianmeetscoding.com/wiki/asp-net-mvc/asp-net-mvc-certification/) from 2015-05-12
- [Study Notes for 70-486 - Developing ASP.NET MVC 4 Web Applications](http://blog.adnanmasood.com/2013/05/20/study-notes-for-70-486-developing-asp-net-mvc-4-web-applications/)
