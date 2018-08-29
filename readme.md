# Exam 70-486 Prep Doc

The Microsoft Exam [page](https://www.microsoft.com/en-us/learning/exam-70-486.aspx).

Found this _Dino Esposito_ book on [Safari](https://www.safaribooksonline.com/library/view/programming-aspnet-core/9781509304448/).  Looks like a good weekend read.

- 3 - 10, good coverage and useful
- 11 - 13, skim but not really relevant to exam
- 14 - 15, generally useful
- 16, not so much

Starting off with the Plural Sight intro to MVC 5 [PluralSight](https://app.pluralsight.com/paths/skills/mvc5). The first _review_ gives a general rundown on the state of the various technologies that will be covered in the exam.  There is no discussion on technology choice.

> The the Plural Sight content is general at best, the advanced courses dive into very narrow channels that are not necessarily useful on the exam.

There is a Microsoft Virtual Academy (MVA) on [MVC4](https://mva.microsoft.com/en-US/training-courses/introduction-to-aspnet-mvc-8322?l=Omf358Zy_1604984382&v=kipiFY17H2&WT.mc_id=mva_sms_kipi_us-en) which covers the core Microsoft pieces with a little more diligence then the Plural Sight.

> This is MVC4! and extremely introductory, also the player keeps resetting itself x1.0 time after the page is paused.

Off to round up a resource on *routes*:  

An independent page is the best I can find on [ASP.NET 5 Deep Dive: Routing](http://stephenwalther.com/archive/2015/02/07/asp-net-5-deep-dive-routing).  Starting here and doing a couple of exercises.

> This quickly goes south as the article starts building _alternate_ routing strategies that do not really reflect the _Microsoft_ framework.

From the ASP.NET site: [Routing to controller actions in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/routing?view=aspnetcore-2.1).  If I have time I'll review this.

[debuging web applicaiton](https://docs.microsoft.com/en-us/visualstudio/debugger/how-to-enable-debugging-for-aspnet-applications?view=vs-2017)

- [Working with data in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/data/?view=aspnetcore-2.1) 2017-10-13
- [Getting Started with Entity Framework 6 Code First using MVC 5](Getting Started with Entity Framework 6 Code First using MVC 5) 2015-10-21
- [Create the Data Access Layer](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/create_the_data_access_layer) 2014-09-07
- [ASP.NET Data Access - Recommended Resources](https://docs.microsoft.com/en-us/aspnet/whitepapers/aspnet-data-access-content-map) 2014-04-03
- [PluralSight](https://app.pluralsight.com/player?course=aspdotnet-mvc5-fundamentals&author=scott-allen&name=aspdotnet-mvc5-fundamentals-m6-ef6&clip=0&mode=live) 2013-11

- [from MS](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/choose-aspnet-framework?view=aspnetcore-2.1)
- [and](https://docs.microsoft.com/en-us/dotnet/standard/choosing-core-framework-server?view=aspnetcore-2.1)
- in _core_ attribute routing is on by default, in _framework_ it must be explicitly enabled
- _core_ allows for controllers that are do not inherit from `Controller`, they must be decorated with `[Controller]`.
- `ViewData` is a dictionary, `ViewBag` is a `DynamicObject`.
- the *Razor* view engine treats `<text>literal value</test>` not as markup to render but as literal string, it this case the literal string "literal", it this case the literal string "literal".
- **tag helpers** are ASP.NET core only.

- Microsoft web technology options (based on HTTP Handler)
  - Standard
    - ASP.NET Web Forms
    - ASP.NET MVC (6)
    - ASP.NET HTML
  - Core
    - ASP.NET MVC (6)
    - ASP.NET HTML

## ASP.NET MVC (5) Request Lifecycle

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

## ASP.NET MVC(5) Application Lifecycle

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

## Security

- none
  - just that, none
- individual user
  - web forms
  - or 3rd party (OpenID, OAuth - facebook, google, etc)
- organizational
  - federated security
  - Azure Active Directory - AAD
- windows
  - intranet
  - Active Directory - AD

[MVC Security - ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/security/?view=aspnetcore-2.1)

### Client Certificates

### Claims Based

Decorate actions or controllers with the `[Authorize]` attribute to force authentication.  The opposite attribute is the `[AllowAnonymous]` attribute.

## Routing

I started off here, [ASP.NET 5 Deep Dive: Routing](http://stephenwalther.com/archive/2015/02/07/asp-net-5-deep-dive-routing), but this site immediately starts subclassing the `RouteBase` and that's not likely on the exam.  I went back to the horses mouth: [RouteCollection](https://docs.microsoft.com/en-us/dotnet/api/system.web.routing.routecollection?view=netframework-4.7.2) and [Route](https://docs.microsoft.com/en-us/dotnet/api/system.web.routing.route?view=netframework-4.7.2).  Routes are stored in the `RouteCollection`, which is a `Collection<T> where T:RouteBase`.  THre `RouteCollection` itself is part of the `RouteTable`.  The only out of the box derived class of `RouteBase` is `Route`.  The constructors of the `Route` class are the important thing here.

There is a lot of old content on the web regarding routes and configuring routes.  

In _core_ the routes are added to the `UseMVC` middleware:

```csharp
// these next two are equivalent
app.UseMvc(routes =>
{
    routes.MapRoute(
        name: "default",
        template: "{controller=Home}/{action=Index}/{id?}");
});

routes.MapRoute(
    name: "default_route",
    template: "{controller}/{action}/{id?}",
    defaults: new { controller = "Home", action = "Index" });
```

The missing pieces: `datatokens` and `constraints`.

The following link is a good low level dive into [Routing in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/routing?view=aspnetcore-2.1), it explains the parts of the `MapRoute` extension method.

This article has some good content on attributes and is more general the the first, [Routing to controller actions in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/routing?view=aspnetcore-2.1).  It covers off the basic syntax and using attributes in paths.

In _framework_ the routes are added to from the application start event calling the configure:

```csharp
routes.MapRoute(
    name: "Default",
    url: "{controller}/{action}/{id}",
    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
);
```

What is common here is the `RouteCollection.MapRoute` method.

## CSS Selectors

See the [sampler](css/StyleSampler.html).

## Localization

## The Shoulders of Others

- [Developing ASP.NET MVC Web Applications(70-486)](https://github.com/bishopsmove/Certification-Study-Guides/tree/master/Microsoft/MCSD/70-486.MVC) from 2016-09-15
- [Failed the Turing Test](http://failedturing.blogspot.com/search/label/70-486) from 2016-05 and earlier
- [NOTES FOR THE 70-486 ASP.NET MVC CERTIFICATION]
- (https://www.barbarianmeetscoding.com/wiki/asp-net-mvc/asp-net-mvc-certification/) from 2015-05-12
- [Study Notes for 70-486 - Developing ASP.NET MVC 4 Web Applications](http://blog.adnanmasood.com/2013/05/20/study-notes-for-70-486-developing-asp-net-mvc-4-web-applications/)
