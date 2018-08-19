# Exam 70-486 Prep Doc

## Design the application architecture (15-20%)

### Plan the application layers

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
      - defined in an assembly level attribute
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

#### Plan data access

- [Working with data in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/data/?view=aspnetcore-2.1) 2017-10-13
- [Getting Started with Entity Framework 6 Code First using MVC 5](Getting Started with Entity Framework 6 Code First using MVC 5) 2015-10-21
- [Create the Data Access Layer](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/create_the_data_access_layer) 2014-09-07
- [ASP.NET Data Access - Recommended Resources](https://docs.microsoft.com/en-us/aspnet/whitepapers/aspnet-data-access-content-map) 2014-04-03
- [PluralSight](https://app.pluralsight.com/player?course=aspdotnet-mvc5-fundamentals&author=scott-allen&name=aspdotnet-mvc5-fundamentals-m6-ef6&clip=0&mode=live) 2013-11-05

#### plan for separation of concerns, appropriate use of models, views, controllers, components, and service dependency injection

#### choose between client-side and server-side processing

#### design for scalability

#### choose between ASP.NET Core and ASP.NET

#### choose when to use .NET standard libraries

## The Shoulders of Others

- [Developing ASP.NET MVC Web Applications(70-486)](https://github.com/bishopsmove/Certification-Study-Guides/tree/master/Microsoft/MCSD/70-486.MVC) from 2016-09-15
- [Failed the Turing Test](http://failedturing.blogspot.com/search/label/70-486) from 2016-05 and earlier
- [NOTES FOR THE 70-486 ASP.NET MVC CERTIFICATION](https://www.barbarianmeetscoding.com/wiki/asp-net-mvc/asp-net-mvc-certification/) from 2015-05-12
- [Study Notes for 70-486 - Developing ASP.NET MVC 4 Web Applications](http://blog.adnanmasood.com/2013/05/20/study-notes-for-70-486-developing-asp-net-mvc-4-web-applications/)
