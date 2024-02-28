#import "template.typ": project
#import "abbreviations.typ": abbreviations
#import "@preview/acrostiche:0.3.1": *
#import "elements.typ" : code-snippet


#show figure.caption: set text(size: 10pt, style: "italic")

#let candidates = (
  (
  name: "Florian Piberger",
  class: "5AHINF",
  task: "Frontend, Backend, Documentation, Database",
  supervisors : ((
    name: "Dietmar Winkler",
    title: "Dipl.-Ing (FH)",
    level: "Primary",
    ),
    (
    name: "Markus Falkensteiner",
    title: "Prof. Dipl.-Ing (FH)",
    level: "Secondary",
    ),
    ),
  ),
)

#show: project.with(
  title: "Quap - a simple quiz app",
  subTitle: "Design, development and implementation of a quiz and learning app",
  number: "5AHINF-2023/24-DA12",
  authors: candidates,
  authorsLastName: candidates.map(candidate => candidate.name.split().last()),
)

#abbreviations

#print-index(title: "List of abbreviations")

#pagebreak()

= Theoretical Foundations
This chapter delves into various applications, programming languages, frameworks, and related technologies pertinent to this work. Each component receives a thorough examination, covering its functionalities, potential use cases, unique features, benefits, drawbacks, and any existing limitations. By illuminating these strengths and weaknesses, I aim to equip readers with a comprehensive understanding of these technologies and their significance to the overall project. This section is meant as a reference point for the rest of the documentation. An explanation of what was achieved can be found in the #link(<implementation>)[Implementation] section.
== Software used
Many programs and other software were used in order to complete the must-goals. The following section will cover them in detail. To qualify as a program, a piece of software has to be executable.
=== Development
This section outlines the software used for the development of the application. The specific products were chosen for their support of the used languages as well as their ability to be installed and run on the Windows #acr("OS"). The personal preferences of the developer also played a large influence in the decision process.
==== Visual Studio
Visual Studio is an #acr("IDE") developed by the Redmond, WA-based technology company Microsoft. @eb-microsoft It allows the developer to write code in multiple languages including C\# and C++. It also provides tools for building and executing the written code such as compilers and tools to improve the developer experience, the most notable of which being a Debugger and several code completion tools. A debugger allows the developer to diagnose problems with the code by setting breakpoints, where the program is paused and the values of variables are shown. It also provides functionality to inform the developer when a variable changes. Visual Studio is available in 3 Versions:

- Community: #acr("FOSS") version with minimal proprietary additions; targeted towards students
- Professional: paid version; targeted towards small teams
- Enterprise: targeted towards large cooperations
The Community version was used for this project. @ms-visualstudio

In this project, Visual Studio was primarily used for the Backend of the application.
==== Visual Studio Code
#acr("VsCode") is a code editor developed by Microsoft with a #acr("FOSS") core, that also contains proprietary components such as telemetry. Although it is not a full-fledged #acr("IDE"), as its core does not contain tools typically found in an #acr("IDE"), such as debuggers and code completion utilities, it is still a very powerful tool thanks to its expansive and well-supported extension eco-system. It is thanks to said extensions, that #acr("VsCode") has become very popular in the field of Web Development, as many developers are dependent on #acr("VsCode") extensions when working with popular frameworks and libraries. When some commonly utilized technologies are used, no extensions are needed, since Microsoft has included tooling for web technologies out of the box such as a basic debugger and code highlighting for the popular programming languages JavaScript and Python @ms-vscode as well as EMMET, an extension providing productivity-enhancing abbreviations and snippets for #acr("HTML") and #acr("CSS"). @ms-emmet

In this project, Visual Studio was primarily used when developing the Frontend of the application.
==== Docker Desktop/Docker
Docker Desktop is a #acr("GUI") application for Windows and macOs used to manage Docker Containers. It is available in both a #acr("FOSS") community edition and a paid commercial version. It allows the developer to create and maintain Docker Images as well as Kubernetes Clusters.

Docker itself is a system that gives developers the ability to quickly deploy software. It might be easier to think of it as a way to package an application, including all dependencies and configuration files into a self-contained and reusable package. Said package is referred to as a Container. Docker is often used in combination with a #acr("CI/CD") pipeline, where code is automatically tested, built, and in the case of Continuous Deployment published.

Images are the core of Docker. Images contain instructions on how to build Containers. Therefore, it is possible to think of them as "Blueprints" for creating Containers. The instructions are defined in a Dockerfile containing information about the Container #acr("OS"), startup commands, and software dependencies. Containers themselves are instances of Docker images. As Containers are isolated and self-contained, it is possible to run multiple instances of them at the same time. This helps improve the stability and security of the deployed application.

Even if a developer does not containerize their software, as is the case with this project, Docker can still be a useful tool, because many common dependencies such as databases are available as docker images, which removes the need to install them on the development machine itself. @misc-dockerdesktop
=== Other Software
This section outlines software that was used for various miscellaneous tasks other than than software development.
==== Mozilla Firefox
Mozilla Firefox is a #acr("FOSS") Web Browser developed by the Mozilla Corporation. It began development in 1998 as a fork of the then open-source Netscape Navigator Browser, which had at one point been the most popular Web Browser in the early days of the internet. It had, however, lost a great bit of popularity at the time it was made open-source. Firefox in turn became a very popular browser in the 2000s, but it has seen declining usage for the last couple of years as the Chrome Browser, developed by Google, has taken the lead. Firefox now hovers around 3 to 10% market share depending on the region.

Firefox was used in this project to test and interact with the Frontend interface. It was preferred over Chrome or Browsers based on it, because it not only offers a greater amount of privacy but also better developer tools, especially when viewing #acr("CSS") properties of #acr("HTML") elements. @eb-firefox
==== Swagger #acr("UI")
Swagger #acr("UI") is an interface built upon the OpenAPI Specification for documenting an #acr("API") by using either a YAML or #acr("JSON") document to describe the available endpoints and the models used for data transfer. It was originally known as the Swagger Specification. Swagger itself includes a set of tools, which aid the developer in the design, development, and documentation of #acr("API")s.

Swagger #acr("UI") is one of these tools. It helps the developer keep an overview of the #acr("API") by generating a #acr("GUI") out of the YAML/#acr("JSON") document displaying all endpoints. It then allows for the testing of the endpoints by providing fields for each parameter, where test data can be entered and buttons to submit the #acr("API") calls. @misc-swagger
==== Typst
Typst is a newly developed #acr("FOSS") markup system primarily targeted toward academic use. It is intended as a replacement for LaTeX. Typst is heavily inspired by Markdown as it includes built-in syntax for commonly used text elements like bold/italic text, unordered/ordered lists, and headings. The system is entirely built with Rust, a modern type-safe high-performance programming language resulting in fast compile times compared to LaTeX.

Another major difference between Typst and older solutions is that it is not separated into a distinct markup and scripting language but is instead one language containing both capabilities. Its scripting side includes implementations of conditionals, loops, and data types including Strings, Integers, Floats, Arrays, and Dictionaries, all of which are commonly found in other programming languages making Typst very intuitive for programmers, while not being too complicated for regular users. Additionally, it supports many formats for storing bibliographies, including Hayagriva YAML and BibLaTeX files. Typst documents can be exported as #acr("PDF") and #acr("HTML") files.

The markup and scripting components of Typst are very closely linked and they can both be embedded within each other. Declared variables are also shared between the two, making it very easy to for example create a list of names, programmatically modify it, and output the result in the space of a couple of lines in one file. The same procedure would require the use of multiple separate files in comparable systems. Typst also allows the user to programmatically change the properties of text elements anywhere in the document by using so-called Set Rules. The following two examples show how to add numberings to headings and how to justify the text of paragraphs:
```typ
  set heading(numbering: "1.")
  
  set par(
    justify: true
  )
```
When used in text, programmatic elements have to be marked by writing a "\#" in front of them. @typst Typst provides both a #acr("CLI") tool and a #acr("WYSIWYG") web-based editor for writing documents.

Typst allows for the creation of document-independent templates and packages. Even though Typst is still very new, there is already a thriving community of developers and general users creating said components and sharing them for free with the rest of the user base.

Typst itself is run as a startup and is headquartered in Berlin, Germany. The founders are Martin Haug and Laurenz Mädje. @typst2
==== JabRef
JabRef is a bibliography management tool that allows the user to collect, categorize, organize, and keep track of sources. It supports searching many online repositories, the most well-known of which is Google Scholar. Additionally, it includes the functionality to extract metadata from #acr("PDF") files. Collections of sources are stored as .bib BibLaTeX files, allowing them to be imported into the most common writing systems used in academia.

Sources can be categorized into several predefined categories including articles, books, thesis, and websites, each one of which requires the user to enter different information. The categories can also be edited by adding custom fields. @misc-jabref For example, this project required the addition of the date when a website was accessed.
==== Git/GitHub
Git is a so-called #acr("VCS"). A #acr("VCS") is an essential tool in software development. It is used to track changes made to a codebase, organize said codebase, and manage the collaboration between multiple developers in teams or open-source communities. Git was developed by Linus Torvalds, the creator of the popular #acr("FOSS") #acr("OS") Linux in 2005 to be a fully free and open version control standard. He created it due to the capabilities of the BitKeeper #acr("VCS"), which had been used in the development of Linux, being reduced for non-paying customers.

There are a couple of concepts essential to the understanding of Git:

- *Repository*: Repositories represent the fundamental component of Git. They are used to store the code of a project or part of a project. Changes to files are also tracked on the repository level. On the technical level, it is a special database storing project revisions and history. Unlike in other similar solutions, a Git repos not only contains file data but also data about itself such as metadata and user configuration. That information is located in a ".git" directory, which is configured to be hidden. Git uses two different key structures to store data: the object store (efficiently copied during cloning) and the index (temporary and modifiable).

- *Branch*: To further segregate code changes and to avoid conflicts, where multiple developers, who are working on different features, end up overriding the work of their colleagues, Git provides the ability to create an unlimited number of branches on a repository. Upon a branch's creation, all changes made to code only affect the branch itself and are not reflected in the rest of the repository. A branch is created as follows: ```sh
git checkout -b branchName
or
git checkout branchName
or 
git branch branchName
``` The default branch that is initialized when creating a repository has traditionally been called "Master". Due to negative historical denotations, the term "Main" is preferred nowadays.

- *Commit*: A commit is a snapshot of the current state of selected files in a repository. They are used by Git to record changes made to files over time. A single commit does not record the state of all files. Instead, Git looks for changes made to files by comparing the newly committed state to the previously stored one. Git then processes the changes found. All unchanged files and directories remain unaffected by the commit. A commit is the only way for a developer to change the files stored in the repository. Developers are also granted the freedom to choose which files are included in a commit. Each commit must have a descriptive message explaining the changes. Before creating a commit, files are typically staged using the `git add` command, creating a temporary list of changes to be included.

- *Merge*: If a developer is done working on a specific branch, they can integrate its changes into another branch, combining the commit history of both branches and bringing their changes together. This process is referred to as merging two (or more) branches. A branch is merged as follows: ```sh
git merge branchName
``` One problem that can occur when merging branches is Merge Conflicts. They occur when changes have been made to the same file in multiple branches. A developer or a team leader then has to manually inspect affected files and decide which version to keep and which to discard. One way to achieve this is to use the `git diff` command. This command is used to display changes between files. Other tools and strategies are also available to simplify conflict resolution. @book-git

While it is possible to store a repository solely on a local computer, especially when working alone, it is way more common to host a repository on a server. Large organizations may have their private git servers, but there are also hosting sites, which allow users to manage repositories. The most popular option is the Microsoft-owned GitHub, which is used to host this project. In addition to simply hosting repositories, GitHub also allows users to host simple Websites and to track issues on repositories in addition to basic project management tools like a Kanban Board and #acr("CI/CD") with GitHub Actions. @misc-githubfeatures
== Backend
In addition to the many programs used for completing this project, several technologies were also used as building blocks of the application. This section will cover all used in the Backend or the server of the project.
=== Programming Languages
Following section outlines which Programming Languages were used in the Backend.
==== C\#
C\#, or as it is pronounced "C sharp" is a general-purpose programming language developed at Microsoft by a team headed by the Danish software engineer Anders Heijlsberg. He was previously responsible for creating the Turbo Pascal and Delphi languages. At Microsoft, he also works on TypeScript, which will be explained later on in this document.

The language is written object-oriented, meaning that the core of each C\# application is Classes, independent entities containing both variables and business logic. It also provides type safety, which in combination with the language's automatic memory management and garbage collector makes C\# very user-friendly and reliable. Its syntax is often compared to that of the very popular language Java. Microsoft originally developed the language only for their own Windows #acr("OS"), but it has since been made available for macOS and Linux as well. @misc-csharp It is part of the larger .NET Framework used to create many different kinds of applications. The original .NET Framework is only supported on Windows. A cross-platform version called .NET Core is also available. The most recent .NET Core revision as of February 2024 is .NET Core 8. @ms-dotnet
=== Frameworks/Libraries
In addition to C\# as the main programming language of the Backend, several Frameworks, Libraries and Packages were also used in cases where additional features were required. 
==== Asp.NET Core <asp.netcore>
Asp.NET is #acr("FOSS"), cross-platform, and lightweight Framework built as an addition to the previously mentioned .NET Core Framework. It enables developers to create high-performing Web Applications with the C\# language. It is based upon the older Asp.NET Framework, which opposed to its newer counterpart is only available for Windows, as it is based on the regular .NET Framework. Asp.NET still receives updates. They are, however, small in nature. Asp.NET Core is a total rewrite of the previously existing functionality.

Asp.NET Core provides the ability to create both #acr("MVC") and Web #acr("API") applications. #acr("MVC") describes a popular architectural pattern, where the application logic is split into three distinct parts:

- *Models*: Represents the data and manages how data is stored, retrieved, and manipulated.

- *Views*: The #acr("GUI") page(s) the user interacts with. They are used to display the data provided by the Models and provide interactive elements to mutate said data.

- *Controller*: A Controller acts as the middleman between the View and the Model and facilitates the transfer of data across the application.

Web #acr("API")s on the other hand merely provide endpoints, to which other applications can send and request data. They do not include graphical interfaces themselves. It is however possible to also define endpoints on #acr("MVC") Controllers so that other applications also have access to the data. @misc-asp.netcore

This project uses a Web #acr("API") without any #acr("MVC") Components.
===== Entity Framework Core
Asp.NET Core also provides an #acr("ORM") called Entity Framework Core. An #acr("ORM") is an abstraction layer between the application and the database. It is used to perform #acr("CRUD") operations, without having to write database queries by hand. They typically provide interfaces to interact with database tables as if they were regular objects. One thing of note is that the term is reserved for relational databases only. Non-relational solutions use different terms (for example Object Document Mapper in MongoDb). Entity Framework Core supports SQLServer out of the box, although there are third-party packages, which add support for further databases. @misc-orm
==== AutoMapper <automapper>
To convert between a Model and a #acr("DTO"), it is normally required to manually assign the values as follows:
```c#
model.name = dto.name;
model.date = dto.date;
model.price = dto.price;
```
Doing this can not only lead to a lot of filler code, but it may also be impossible with larger objects. #acr("DTO")s themselves will be thoroughly explained later in this document. AutoMapper is a library that allows the developer to define maps between certain models/#acr("DTO")s. It will then try to automatically match corresponding fields. Should this fail, the developer is able to manually create maps as well. Maps are not bidirectional, so each one has to be created twice. AutoMapper includes an easy way of doing this by simply defining the map a second time and adding `.ReverseMap()` at the end of one of them. @misc-automapper
==== SignalR <signalR>
In a traditional Web #acr("API"), clients can only send requests to the server, to which the server may then respond. This system works well for certain use cases, but for others, for example, chats or games, it is too limited. Instead, these applications may benefit from the use of another technology, namely WebSockets. They differ from traditional #acr("HTTP") endpoints by establishing a persistent connection between clients and servers with two-way communication channels. The technical term for communication of that sort is "Full-Duplex Communication". Messages transmitted over WebSockets are also delivered or received in real time. Although their usefulness is without doubt, WebSockets also possess certain limitations, which a developer has to keep in mind when using them:

- *Poor Security:* WebSocket messages are by default not transported securely. This may lead to unauthorized access to systems and data breaches.

- *Browser Compatibility:* Some older Browsers may not support WebSockets. Some Browsers also require other metadata or security certifications when using them.

- *Complexity:* Compared to #acr("HTTP") endpoints, WebSockets are more difficult to use and implement for the developer. The developer also has to maintain the connection and manage clients, which adds even more difficulty.

As a solution to said problems, Microsoft released the SignalR library for .NET and .NET Core. It enables developers to work with WebSockets easily. At the core of SignalR are so-called Hubs. There, functions can be created, which correspond to a certain task performed by the application. Within them, business logic is defined and Model data is interacted with. Should the changes to the application state performed in a function require updates in the clients, messages can be sent to either all clients, groups of clients, or specific clients. SignalR is also very easily combined with Microsoft Identity to associate specific clients with logged-in users.

In the clients, for example, a website, SignalR is also available as a package. Once installed, event listeners can be defined, which waits for a specific message from the server. Each message requires its own listener. Additionally, clients can also call the previously discussed functions on the server by invoking them with their name and, if needed, adding data needed in the Backend.

SignalR also allows for the creation of a custom function that is executed on a client establishing a connection by overriding the `Hub.OnConnected()` or `Hub.OnConnectedAsync()` methods. It is also possible to invoke functions on the Hub on the same ASP.NET application by using a HubContext. Lastly, it has to be mentioned that SignalR also supports other real-time communication technologies other than WebSockets. They are, however, excluded in this documentation, since they are not used. An example of one of them would be Server Side Events. @book-signalr 
==== Bcrypt.NET <bcrpyt>
Bcrypt.NET is a .NET library implementing the popular Bcrypt password-hashing function. @misc-bcryptnet

Bcrypt was designed by Niels Provos and David Mazières in 1999 and is based on the 1993 developed Blowfish Cipher, itself created by American cryptographer Bruce Schneider. Although there are newer ciphers and algorithms out there, Blowfish even has a successor called Twofish, Bcrypt is still considered secure and widely used thanks to its availability on many platforms.

It does not only just hash passwords, it also salts them. Salting adds additional security compared to just hashing, where passwords are merely encrypted using a predefined algorithm. One downside of doing things this way is that hackers retain the ability to use so-called Rainbow Tables, which are created by first gathering a list of commonly used passwords, most of them regular words without major alterations. Frequently used tricks such as replacing the letters "O" and "E" with the numbers 0 and 3 respectively are also taken into consideration. This list is then run through an algorithm to get a list of hashed passwords. Salting mitigates this issue like so: When passwords are hashed, in addition to simply applying the algorithm a random string of numbers and characters is used as a second argument to the hashing function. This string is referred to as the Salt. It is used inside of the hashing function to modify the resulting hashed password so that encrypting the same password with multiple Salts results in different outputs rendering Rainbow Tables useless.

In addition to Salts and to distinguish itself from competing solutions, Bcrypt is also significantly slower than other algorithms, making regular encryption and decryption still possible, but rendering Rainbow Tables time-consuming to produce, even without the use of Salts. @misc-bcrypt
=== PostgreSQL <postgres>
The database used for this project is PostgreSQL, a #acr("FOSS") relational database. Similar to other relational databases like MySQL and SQLServer, it stores data in tables divided into rows and columns. Another shared characteristic is that most relational databases use #acr("SQL") to write queries performing #acr("CRUD") operations on stored data. What differentiates PostgreSQL from other solutions is that it is a so-called Object Relational Database, meaning that it supports concepts like custom data types and inheritance typically found in #acr("OOP"). It also allows multiple transactions to be run at the same time, by assigning a snapshot of the database to each one and for reusable queries. @misc-postgres

This project makes use of some of these features since it uses Enums to store certain data, which are not available on other relational #acr("DBMS"). Further details about said implementation will be covered in the Backend part of the implementation section later in this documentation. One downside of using PostgreSQL with Entity Framework Core is that it requires the installation of a third-party package called `Npgsql` to be supported.
=== Concepts
The following concepts are vital to understanding the implementation of the Backend.
==== REST
#acr("REST") #acr("API")s are #acr("API")s, that use #acr("HTTP") technology. The term #acr("REST") itself merely describes a set of guidelines, which are recommended when designing #acr("HTTP")-based #acr("API")s. They were laid out by Roy Fielding, who co-founded the Apache #acr("HTTP") Server Project, in his Ph.D. thesis written in the year 2000. #acr("API")s that utilize these guidelines are called "RESTful".

Having well-designed #acr("API")s is essential to the modern web, where developers not only work with their own #acr("API")s but also with several others hosted on other servers in the web. Therefore, it is important, that all #acr("API")s are designed similarly. The core of #acr("REST") is defined by its #acr("URI") format:

`URI = scheme://authority/path[?query][#fragment]`

- *Scheme* usually denotes the protocol used (for example #acr("HTTP") or #acr("FTP"))

- *Authority* is the place, where the server is hosted (#acr("IP") Address or Domain name)

- *Path* is used to separate and organize data/pages on the server. Subsequent paths separated by slashes always indicate a hierarchical relationship

- *Query* is optional and is for example used for data entered by a user (Search parameters, ...)

- *Fragment* usually links to a specific part of data/a page (for example a heading)

Although there are several other smaller rules, six concepts build the core of #acr("REST") together with the #acr("URI") format. Some of these have already been alluded to previously:

+ *Client-Server:* There should always be a separation of concerns between clients (the applications processing the data) and the server (the application providing the data). Their interactions must be defined through standardized requests and responses, ensuring independence and scalability.

+ *Uniform Interface:* Resources are identified using URIs and accessed through a standard set of #acr("HTTP") methods (GET, POST, PUT, DELETE). This consistency makes API usage intuitive and predictable for developers.

+ *Layered System:* This rule specifies, that it is possible for there to be middlemen, such as proxies between the client and the server as long as they are not visible to the client. They may, however, still block certain data from reaching the client. Examples would be Website-blockers on a school network.

+ *Cache:* Data should always be cachable anywhere along the network path. The responsibility to declare data as cachable is a server's job. Caching is essential to the modern web, as it massively decreases the time and cost of data transfers.

+ *Stateless:* Each separate request must include all information the server needs to be processed independently. A server should not be relied upon to have any knowledge about each client and data associated with them and it should also not store said knowledge. This improves scalability and prevents issues with server-side session management.

+ *Code-On-Demand:* Servers may transfer executable code to the client temporarily It also has to be ensured, that the server has to make sure, that the client can execute said code. An example would be JavaScript files. @book-rest
==== DTOs
In software development, a #acr("DTO") is like a specialized messenger carrying only the data needed between different parts of an application. In their implementation, #acr("DTO")s look very similar to regular models. The major difference is that they are not meant to represent data stored on the database, but instead data that is sent and received. A #acr("DTO") is usually associated with a model and includes all fields from said model needed for a certain data transfer. They are a good way to obfuscate data and are categorized as a Design Pattern. @misc-dto

An example for a use-case of a #acr("DTO") from this project is that when information about a specific question of a quiz is transferred to a client, any data containing information about wether or not an option is correct or not is omitted to prevent students from cheating.
==== Repository Pattern
The Repository pattern in ASP.NET is a design pattern, where so-called Repositories are created, that act as a middleman between Entity Framework Core and the #acr("API") Controllers. All functions performing #acr("CRUD") operations are defined in the Repositories, so that a Controller never has to work with the database directly. The Repository pattern brings several advantages:

- *Separation of Concerns:* The repository keeps business logic decoupled from the intricate details of data access, leading to cleaner and more maintainable code. This is especially important for larger teams, where many developers work on a single codebase.

- *Reusability:* A single repository can serve multiple parts of the application, reducing code duplication and promoting consistency.

- *Flexibility:* If you need to switch data sources, you only need to modify the repository implementation, keeping the rest of the application intact. @misc-repo
== Frontend
This section will cover all technologies used in the implementation of the Frontend part of the application. The Frontend encompasses all parts of the program that a user interacts with. For example, all #acr("GUI")s are part of the Frontend.
=== Programming Languages
Following Programming Languages were used in the Frontend.
==== JavaScript
When working on websites, developers have a limited number of technologies they can use, as most Web Browsers only support a small number fraction of what is theoretically available. Generally, only three languages are used to create websites: #acr("HTML") for the markup of the general layout of the page, #acr("CSS") for styling elements of a page, and JavaScript to add interactivity to a page.

Of the three, JavaScript is the only one that can be understood to be a Programming Language, although it is often referred to as a scripting language as well. In addition to common features such as Loops, Variables, and #acr("OOP"), it also supports a wide variety of features specifically designed to enhance its usefulness to Web Development, as it was designed for that task. For example, it is possible to programmatically interact with elements of a #acr("HTML") page by selecting them with `document.querySelector()`. It is then treated as a variable, which can be used to dynamically adjust the #acr("CSS") properties of the element to modify its content. The built-in #acr("API"), that provides those features is referred to as the #acr("DOM") #acr("API"). The name comes from the fact that a #acr("HTML") document is represented as a logical tree, with each node of said tree representing an element of a page and each underlying node representing its children. @misc-js
==== TypeScript
As useful as JavaScript is to Web Development, it is also widely considered to be quite flawed. One major aspect, that is often criticized is its lack of a proper typing system. JavaScript uses so-called dynamic typing, which means that a developer does not have to specify a data type when creating a variable. This alone is not the main reason why this aspect of the language is often panned, as it is also found in other, very popular and widely praised options such as Python. The real reason is that JavaScript is very inconstant in its type-checking behavior. For example the expression `"5" == 5` checking if the right value is the same as the left one returns true, even though the values compared are a string and a number. This is the case because in JavaScript the common "==" operator does not take into consideration the type of the values. Instead, the developer is forced to use the "===" operator. JavaScript also has so-called truthy and falsy values, where non-boolean expressions such as an empty string are interpreted as false and a non-empty string as true.

All these particularities make it very easy to make mistakes when writing JavaScript, which is often quite difficult to debug. This also makes JavaScript very unsuitable for larger projects, which is why TypeScript was developed.

TypeScript is a superset of JavaScript, which means that all valid JavaScript code is also valid TypeScript code. TypeScript main addition is static typing, meaning that it makes it possible to define the data type of a variable, although it is not strictly necessary, because TypeScript automatically tries to figure out the type of a variable on creation if initialized with a value. It also offers advanced type-checking capabilities and an improved class system. TypeScript also allows for the creation of advanced types for situations such as when an #acr("API") request returns data consisting of multiple values, which should be stored together. This is achieved by using the `type` keyword. It is very similar to an interface, although it cannot directly inherit other types and it also supports many advanced typing features not found on interfaces. @misc-ts

This project uses TypeScript as opposed to regular JavaScript.
=== Frameworks/Libraries
Common web technologies are very useful for smaller applications. As the complexity of an application grows, it becomes increasingly difficult to manage the codebase, which is why several Frameworks and Libraries were used to simplify the development process.
==== React
When creating larger web applications, it is very common to use the same elements more than once. For example, a website could have the feature to enable a dark mode with a toggle on every page. if developed traditionally, this toggle would have to be manually implemented on each page, which for a small element such as this might not seem like much work. However, as the the application scale and the complexity increases, this approach becomes unsustainable. Imagine being tasked to implement the same complex navigation bar on multiple pages. This redundancy not only wastes development time but also creates inconsistencies and makes maintenance of the codebase harder.

There are, however, many Libraries and Frameworks that aim to solve this problem by allowing the developer to create reusable blocks called Components. The most popular solutions are Angular and React, the latter of which is used in this project. Components are self-contained, customizable, and readily interchangeable.

In the previous example, the dark mode toggle becomes a Component that, after it has been implemented once, can be used anywhere. In the case of the navigation bar, where the specific links may change, it is also possible to define the content as Props, values that can be passed to a component similarly to arguments of functions. React utilizes a virtual #acr("DOM"), which is an in-memory representation of the actual #acr("DOM") mentioned in the section about JavaScript. It allows  React to efficiently identify and update only the necessary parts of the UI when data changes, leading to faster and smoother user experiences. Components also make it very easy to maintain code down the line. Imagine updating the toggle behavior – you do it in one place, and the change automatically reflects across all instances.

React supports both JavaScript and TypeScript. It also allows the developer to write #acr("HTML") markup directly in the JavaScript/TypeScript file using #acr("JSX"). @misc-react
==== Vite
One problem that occurs when working with Libraries such as React is that Web Browsers do not natively support them as they only know how to work with #acr("HTML"), #acr("CSS"), and JavaScript, which means that code written in React first has to compiled to technologies understood by Browsers. This step also requires including or bundling in all dependencies required. The traditional tool of choice for this task was WebPack, but in recent years, another option, namely Vite has increased in popularity.

The main advantage of Vite is that it is much faster than WebPack. Vite achieves this by supporting ES Modules, the official module system for JavaScript. This increases efficiency because code no longer has to be bundled into a single file, which greatly reduces complexity. This makes it also possible for Vite to only update the modules for certain parts of the application since code is bundled into multiple different files. This is particularly useful for development, as it decreases reload times when making small changes to code. Vite is also able to determine if certain parts of code are really necessary to the application and then remove said code from the bundle, reducing its file size. @misc-vite
==== Chakra-UI
When working with React or another Component-based Framework/Library, it soon becomes evident, that many different components occur on almost every page. A perfect example of such an element would be a Button or even something more complicated such as a Card or a Dialog/Modal. Additionally, as every Frontend developer knows, it usually takes quite a long time to decide on how the page should look and even longer to subsequently define all the necessary #acr("CSS") rules.

Luckily, several packages and extensions aim to reduce the time it takes to implement standard Components and to style them. Their way of doing so varies greatly, but Chakra-UI, the solution used in this project, approaches this problem by providing the developer with several predefined and styled Components. These range from commonly used elements like the ones mentioned above to more abstract ones like one Component that is a container with the #acr("CSS") flexbox display property. Chakra-UI also allows for basic styling of its Components by passing Props and it provides the functionality to easily make the website responsive (usable on smaller screens) and accessible. @misc-chakra The following shows a Button that is inside of a Container with flexbox:
```tsx
<Flex justify="center" gap="2px" direction="row">
  <Button colorScheme="green" p="1px">Save</Button>
</Flex>
```
As is shown in the example given, it is very easy to work with Chakra-UI. Specific Props will not be explained here or in the following documentation of the implementation with a few exceptions.

Chakra-UI is installed using the #acr("NPM"). It is then required to wrap the main Component in a ChakraProvider Component. Afterwords, Chakra-UI can be used anywhere in the application. @misc-chakra
==== React Router <reactRouter>
When working on more complex projects, React alone is often not enough, since it lacks any features to declare multiple routes with different pages. There is, however, a library that adds such support called React Router. It offers several different kinds of routers. This project uses a BrowserRouter, where the current location is stored in the Browser's address bar. A BrowserRouter allows the developer to define routes and children routes by adding a path and a Component for the page like this:
```ts
const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    loader: quizLoader,
  },
  {
    path: "/editquiz/:quizId,
    element: <CreateEditQuiz />,
    loader: loader,
    action: addQuestionAction,
    children: [
      {
        path: "question/:questionId",
        element: <ShowQuestion />,
        loader: questionLoader,
      }},
```
The main Component then has to be wrapped in a Router Component in order for the routes to work.

In addition to simple routing, React Router also supports more advanced features such as loaders and actions, as shown in the example above. Loaders allow the developer to define functions that automatically get executed when the component loads. This is used to load data from an external data source (#acr("API")). Actions on the other hand are more complicated. They emulate the standard #acr("HTML") feature, where, when a form is submitted, a #acr("HTTP") request is made. Actions intercept said request and relay the form data to a specifically defined function on a route. There, the data is processed and sent to a Backend Server. If there is only one action defined per route, said action is automatically executed on a form submit. Otherwise, the route of the action desired has to be defined on the Form.

React Router also allows for the creation of Links to redirect to another page. Redirecting is also possible as a return value of an action or via a React Hook called `useNavigate()`. @misc-reactrouter Hooks will be explained in the next section.
=== Concepts
The following concepts are vital to understanding the implementation of the Frontend.
==== React Component Types
React offers the ability to create two different types of Components: *Class* Components and *Functional* Components. Class Components are the older way, available since React was first released. They are essentially JavaScript Objects/Classes. They allow for the use of Lifecycle Methods, which perform actions at specific stages of the component's lifecycle (creation, update, deletion). They also allow for the management of the component state. This means that it is possible to store data specific to the component instance and to modify that data at any time. Functional Components, on the other hand, rely on functions for their implementation. When displayed, Functional Components act like a standard function and are executed once. They return  #acr("JSX") markup. Due to that behavior, they do not support Lifecycle Methods and dynamic state management. This made them by far the less popular option for a long time until Hooks were introduced. Hooks add the previously missing features to Functional Components. The by far most used Hook is the useState Hook. It allows for state management. It is initialized with a value and a setter function. Once the setter function is called, the entire Component gets rerendered with the updated data.
```tsx
const [name, setName] = useState<string>("Simon")
```
In this example, the name is initialized with the value "Simon". The specification of the type is required only when working with TypeScript.

Functional Components are generally preferred nowadays since they require less Boilerplate code and are more performant. They also receive more support than Class Components, which are considered outdated at this point. Another reason for the popularity of Functional Components is that Classes behave very irregularly in JavaScript, which can lead to many bugs. Functions, on the other hand, are considered more reliable. @misc-reactcomponents 

#pagebreak()

= Implementation <implementation>
This chapter of the diploma thesis will cover the practical implementation of the project. It is divided into several chapters, where information about the architecture and code is separated into sections loosely based on the must-goals. It will also contain graphics and images, which aim to provide an even better look at the finished product.
== Architecture
Even though the application is run locally, it still relies heavily on technologies commonly found in web development. A major deciding force for employing going this route was that the project is very similar to web applications in not only its concept (all available solutions, which were used as inspirations for this project are web-based) but also its general composition. The reason for this similarity is found in the fact that the application has to be accessible from not only a tutor's PC but from a student's device as well.

This sameness also extends to its general architectural Design, which like web applications is divided into a Frontend and a Backend. The former includes all Clients and #acr("GUI")s accessed by students and tutors, and the latter contains a Server, which is responsible for storing and managing Quiz/Game data and for providing access to said data via multiple methods, which are outlined in @architecture-general:
#figure(image("images/architecture/General.jpg"), caption: [General Architecture Overview], kind: "image", supplement: "Figure")<architecture-general>
As seen in the @architecture-general, communication occurs both via #acr("HTTP"), where data is requested by the Client and then subsequently provided/mutated/stored by the Server, as well as bidirectional #link(<signalR>)[SignalR] WebSocket connections.
=== Backend
#figure(image("images/architecture/Server.jpg"), caption: [Backend Architecture Design], kind: "image", supplement: "Figure")<architecture-backend>
*Logo Reference:*

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  figure(image("images/logos/postgres.png", height: 1.5cm), caption: [#link(<postgres>)[Postgres]@image-postgers], supplement: "Figure", kind: "image"),
  figure(image("images/logos/automapper.png", height: 1.5cm), caption: [#link(<automapper>)[AutoMapper]@image-automapper], supplement: "Figure", kind: "image"),
  figure(image("images/logos/signalr.png", height: 1.5cm), caption: [#link(<signalR>)[SignalR]@image-signalr], supplement: "Figure", kind: "image"),
  figure(image("images/logos/bcrypt.png", height: 1.5cm), caption: [#link(<bcrpyt>)[Bcrypt.NET]@image-bcrypt], supplement: "Figure", kind: "image"),
  )

@architecture-backend shows the general composition of the Backend Server application. It is developed in #link(<asp.netcore>)[Asp.NET Core] and thus written with the C\# programming language. It contains all Models, DTOs, Repositories, and Controllers needed for managing the persistent storage of Quizzes and Games in addition to basic user verification capabilities. All of these components will be explained in detail in their own sections. Information is stored in a PostgreSQL database, which is run as a Docker Container. It is initialized using a `docker-compose.yaml` file:
#code-snippet(caption: "Postgres Docker Compose")[
  ```yaml
services:
  postgres:
    container_name: quap
    image: postgres:latest
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pwd
    ports:
      - 5432:5432
```
]

The difference between a `docker-compose.yaml` and a `dockerfile` is that the former is used to run and configure Docker Containers, while the latter is used to do the same for Docker Images. @misc-dockercompose. This is also evident from the code segment provided above, where an already created image providing the latest version of PostgreSQL is specified. The only thing left to configure is the username and password for the database. Here, they are still hard-coded, as the must-goals do not require a more complex solution, but it would be better for larger projects to obfuscate that information. This, however, is outside the scope of this project.

The DbContext shown in @architecture-backend is a class that utilizes Entity Framework Core. It is used to configure what to store in the database and how to do so. Further detail will follow in sections describing various Models. At the core of the #link(<asp.netcore>)[Asp.NET Core] project is the `Program.cs` file, which is used for configuration.
=== Frontend
#figure(image("images/architecture/Client.jpg"), caption: [Frontend Architecture Design], kind: "image", supplement: "Figure")<architecture-frontend>
*Logo Reference:*
#figure(image("images/logos/reactrouter.png", height: 1.5cm), caption: [#link(<reactRouter>)[React Router]@image-reactrouter], supplement: "Figure", kind: "image")

The Frontend of the project is a complex React application. It is divided into two main sections, which are different in both their implementation and use case. The first one is the Game Pages, which contain all the functionality needed for playing a game. They are shown in their own section in @architecture-frontend. This part of the application mainly uses SignalR connections to communicate with the Server. The other section is the Quiz Management interfaces, entirely used by the tutor. Here, they are able to create new Quizzes, edit existing ones, or delete Quizzes, which are no longer used. These functions are separated into two pages:

- *Root Page:* Default page of the client. Displays all Quizzes and lets the tutor edit, create, delete, or start games with quizzes.

- *Edit Quiz Page*: This page is navigated when editing a Quiz. Here, individual Questions and Options are visible and editable.

Deleting and editing Quizzes requires the tutor to enter a password for verification. This segment of the Frontend relies on #acr("HTTP") endpoints for interactions with the Backend, making significant use of React Router Loaders and Actions to manage data. All code needed to perform Requests to the #acr("HTTP") #acr("API") is located in the `endpoints.ts` file, from where it is imported into other parts of the application. All routes needed are defined in the Main Component.
== Quiz Management
A major part of the planned project was a tutor's ability to manage Quizzes. This includes the creation, editing, and deleting of Quizzes and their containing Questions and Options. The aim was to create user-friendly interfaces to perform these tasks and for the Quizzes to be stored perpetually.
=== Backend
In the Server, this section includes a RESTful #acr("API") providing several endpoints for managing Quizzes.
==== Models/DTOs
In order to properly store data, the Creation of multiple Models is required. A model is a class used as a reference by Entity Framework Core to create SQL queries to Initialize tables. Each Model represents one of these tables. This section includes three Models: Quiz, Question, and Option. Of those three, Option is the lowest in their shared hierarchical order as it is part of a Question, which in turn is part of a Quiz. The Option Model includes distinct fields that represent different essential data. The Model itself is created as a regular C\# class:
#code-snippet(caption: "Option Model")[
  ```cs
  public class Option
	{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public Guid OId { get; set; }
    public string OptionText { get; set; } = String.Empty;
    public bool IsCorrect { get; set; } = false;
    public DateTime CreationDate { get; set; } 
    = DateTime.Now.ToUniversalTime();

    public Guid QuestionId { get; set; }
    public Question Question { get; set; }
	}
  ```
]
The annotation `[Key]` is used to define the ID of an Option as the primary key and the line below tells Entity Framework Core to automatically generate a random ID when creating a new entry in the database. The CreationDate is needed for sorting Options. Note that an Option also includes a reference to the Question containing it. This is done by adding fields for the Question ID and the Question itself. This is not strictly necessary when all a developer wants to do is use a model in another model as part of a composition dependency. It is however necessary for Entity Framework Core to properly assign foreign keys in the created database tables. Including both is considered a best practice, although it is not strictly necessary. An interesting fact was, however, discovered when testing several methods of assigning foreign keys as part of the planning stage of this project: Including both a reference to the parent object and its ID is necessary if Entity Framework Core should perform Cascading Deletes (Children of an Object are also deleted from the database when said object is deleted. This is useful since it removes the need for the developer to carefully manage the database to prevent no longer used data from being stored.). Not including any reference to the containing Model on the other hand is advantageous when Model data is referenced elsewhere or needed again at a later time. This observation was also made use of when storing Games.

As it was clear from the example given of the Option Model, Models tend to not be very complex as they simply contain definitions of fields. The Question Model is structured very similarly:
#code-snippet(caption: "Question Model")[
```cs
public class Question
	{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public Guid QuestionId { get; set; }
    public string QuestionName { get; set; } = string.Empty;
    public int NOptions { get; set; } = 0;
    public List<Option> Options { get; set; } = new List<Option>();
    public QType Type { get; set;} = QType.SingleChoice;
    public int ?TimeLimit { get; set; }
    public int ?Points { get; set; }
    public DateTime CreationDate { get; set; } 
    = DateTime.Now.ToUniversalTime();

    public Guid QuizId { get; set; }
    public Quiz Quiz { get; set; }
	}
```
]
There are, however, also several differences that deserve an examination. Line 8 shows the first example of how Models are used within other Models. It is evident from the example given that this is not very difficult to do. They can simply be used like any Class in #acr("OOP"). The time limit and points are declared nullable by prefixing them with a `?`. This is done because those properties are not set when creating a question and are added later. The biggest addition to the Question Model is the use of an Enum. An Enum is a set of constants, where each keyword is associated with an integer index. They are used when a variable can have multiple predefined states that can be switched between. @misc-enum. The definition for the Question type Enum is done as follows:
#code-snippet(caption: "Question type Enum")[
```cs
public enum QType
{
    SingleChoice, MultipleChoice
}
```
]
SingleChoice is assignable both with the integer: `Qtype[0]` and by using its name: `Qtype.SingleChoice`. The same goes for MultipleChoice. An Enum was used in this case, since it provides more flexibility if new Question types are introduced in the future and it improves the readability of the code.

The Quiz Model is structured very similarly to the Option model. It is, however, still important to the understanding of the rest of this documentation to know what is defined.
#code-snippet(caption: "Quiz Model")[
```cs
public class Quiz
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public Guid QuizId { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }
		public int NQuestions { get; set; } = 0;
		public List<Question> Questions { get; set; } = new List<Question>();
		public DateTime CreationDate { get; set; } 
    = DateTime.Now.ToUniversalTime();
  }
```
]
Each Model is also mapped to several #acr("DTO")s to more efficient transfer data. The #acr("DTO")s contain the same fields as the Models, although some of them are omitted as most use cases do not require all data. The mapping is done with AutoMapper and maps are configured in the `AutoMapperProfile.cs` file. Most maps can simply by letting AutoMapper assign each field of the #acr("DTO") to its corresponding field on the Model and vice versa. Some, however, require the manual assignment of values:
#code-snippet(caption: "Manual AutoMapper assignment")[
```cs
CreateMap<Quiz, QuizDto>().ForMember(dest => dest.QuizId, opt => opt.MapFrom(src => src.QuizId));
CreateMap<Quiz, QuizDto>().ReverseMap().ForMember(dest => dest.QuizId, opt => opt.MapFrom(src => src.QuizId));
```
]
In addition to configuring an AutoMapper Profile, there is another step that is required for the Models to become functional: A DbContext has to be created, which allows Entity Framework Core to work with the Models and allows the developer to store the Model data in the desired database by creating DbSets for each Model. It also allows for querying of data by performing #acr("CRUD") operations. The following example shows a simplified version of the DbContext used in this project. It only includes the definition of one DbSet and the needed configuration:
#code-snippet(caption: "DbContext")[
```cs
public class QuizManagementDbContext : DbContext
{
	public QuizManagementDbContext(DbContextOptions<QuizManagementDbContext> options) : base(options) { }
	public DbSet <Question> Questions { get; set; }

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		optionsBuilder.UseExceptionProcessor();
	}
  protected override void OnModelCreating(ModelBuilder builder)
	=> builder.HasPostgresEnum<QType>();
}
```
]
The OnConfiguring method is run when a migration is created. A migration has to be created manually each time the Models are updated. They automatically generate code, that defines tables and relationships in the database. These are created without manual configuration with one exception. As Enums are only supported by PostgreSQL, they have to be manually assigned to the database.

This DbContext then has to be configured in the main `Program.cs` file. There, the Connection String, which includes all needed information needed to connect to the database (Username, Password), is used to initialize the connection to the database. The String is typically stored in a #acr("JSON"), from where it is imported.
==== Repositories
The next step after the creation of the needed Models is to declare functions, which make use of said Models and their corresponding database tables to perform certain actions needed on the Frontend. As this project uses the Repository Pattern, the first task of this step is to create Repositories for each Model. Only the Question Repository will be shown in detail since they are all very similar.

Before creating the Repository itself, an interface has to be created first, which is then implemented by the Repository:
#code-snippet(caption: "Question Repository Interface")[
```cs
public interface IQuestionRepository
  {
      Task<Question> GetQuestionById(Guid Id);
      Task<Question> CreateQuestion(Question question);
      Task<Question> UpdateQuestion(Guid Id, CreateUpdateQuestionDto question);
      Task DeleteQuestion(Guid Id);
      Task<Option> AddOption(Guid Id);
      Task<IEnumerable<Question>> GetAll(Guid id);
  }
```
]
This is done to create an even clearer separation between what the code needs (data access functionalities) and how this is achieved (specific implementation using a database or API). It is also essential because it allows for greater flexibility when creating the repositories since IRepositories simply have to be included in other parts of the application by using Dependency Injection. This is useful since it allows for the complete replacement of the specific repository implementation without having to change all other parts of the application and without having to delete the old implementation. Dependency Injection will be further explained in the next section.

After creating an IRepository, an implementation has to be created. There, built-in Entity Framework Core functions are used to mutate data stored on the database. The following shows the implementation of the DeleteQuestion method:
#code-snippet(caption: "DeleteQuestion implementation in QuestionRepository")[
```cs
public async Task DeleteQuestion(Guid Id)
{
    Question question = _context.Questions.FirstOrDefault(q => q.QuestionId == Id);
    Quiz quiz = await _context.Quizzes.FirstOrDefaultAsync(quiz => quiz.QuizId.Equals(question.QuizId));
    _context.Questions.Remove(question);
    quiz.NQuestions--;
    await _context.SaveChangesAsync();
}
```
]
This function takes an ID of a Question as its argument. This ID is then used to search for the specific Question and the containing Quiz in the database. The Question is then removed from the database and the NQuestions variable, showing how many Questions a Quiz has, is decreased by one. Finally, the modifications are stored by saving the changes in the DbContext. The function is declared as async because interacting with the database includes I/O operations, which can be slow and block the main thread. By making it asynchronous, the function allows other parts of the application to continue running while waiting for the database operation to complete. This means that overall responsiveness and performance are greatly improved. When declared to be asynchronous the function return type has to be a `Task`. It represents a unit of work that is performed in an asynchronous fashion. It tells other parts of the program that if awaited, some action will be run in the background and the program can wait for said action to complete or continue executing other code while waiting. While not strictly necessary when developing Web #acr("API")s, asynchronous functions are considered best practice. @misc-async

All other functions in the Question Repository and their equivalents in the Quiz or Option Repositories follow the same pattern as the DeleteQuestion method shown in the code snippet. Thus, they will not be shown here. One thing that has to be mentioned, however, is that not all functions make use of AutoMapper for Model conversion, since it is not very easy to use AutoMapper when updating an existing instance of an Entity, meaning that for example, an already existing Quiz has to be updated with data from a #acr("DTO") while retaining its ID. This is theoretically possible but it takes a lot of extra configuration, which is too much extra work for a project this size.

In order to work properly, the Repositories have to be registered in the main `Program.cs file`.
==== Controllers
The final step that has to be implemented before the #acr("REST") #acr("API") can be used in the Frontend is the creation of the #acr("API") Controllers. There, specific #acr("HTTP") endpoints are created, which provide an interface for the client to interact with the previously defined Repository methods. As all Controllers (Quiz Controller, Question Controller, Option Controller) are very similar in their implementation, only the Question Controller will be thoroughly explained in this document.

The first step when creating an #acr("API") Controller is to declare the general route, where all endpoints can be accessed. This is done by using the following annotation about the class declaration: `[Route("api/[controller]")]`. The name of the Controller is automatically inserted. The next step is to include all dependencies needed to interact with the data. These might include Repositories, the DbContext, and an AutoMapperProfile. (The Repositories also use this method to inject the DbContext.) The following snippet shows such a configuration. (The snippet has been changed so that the data types of the variables are not shown in the constructor. This is done for space-saving reasons):
#code-snippet(caption: "Controller Dependency Injection")[
```cs
private readonly IOptionRepository _optionRepository;
private readonly IQuestionRepository _questionRepository;
private readonly IQuizRepository _quizRepository;
private readonly IMapper _mapper;

public QuestionController(optionRepository, questionRepository, quizRepository, mapper)
{
    _optionRepository = optionRepository;
    _questionRepository = questionRepository;
    _quizRepository = quizRepository;
    _mapper = mapper;
}
```
]
The dependencies are declared as read-only private variables and then retrieved using Dependency Injection. Dependency Injection is a Design Pattern, which states that higher-level components of the application should not be dependent on lower-level ones. Both should only be aware of each other via abstractions. An example of such an abstraction would be the previously discussed IRepositories. These abstractions themselves should also not depend on specific details in their implementations. The two principles together are referred to as the Dependency Inversion Principle, which is entirely theoretical in nature. The specific mechanism to apply said principle is called the Inversion of Control, which in turn is made use of by Dependency Injection. The specific approach used in Controllers is called Constructor Injection since the dependencies to be injected are passed into the Constructor. Other methods include Method Injection and Property Injection. After they have been configured in `Program.cs`, the Controllers are automatically run with their constructor. @misc-dependency

Specific endpoints can then be created by writing a new function for each endpoint. These functions then use the functionality provided by the Repositories to interact with the database. The following shows how to get all Options from a Question:
#code-snippet(caption: "GetAllOptions Endpoint")[
```cs
[HttpGet("{id}/options")]
public async Task<ActionResult<Option>> GetAllOptions(Guid id)
{
    try
    {
        var result = _mapper.Map<IEnumerable<OptionDto>>(await _optionRepository.GetOptionsByQuestionId(id));
        return Ok(result);
    }
    catch (Exception ex)
    {
        return BadRequest(ex.Message);
    }
}
```
]
The annotation defines the specific #acr("HTTP") request method and also defines the route, which would be `/api/Question/ID/options` in this case. In the function itself, a try-catch block is used to automatically return an error message in case something goes wrong. The list of Options is then gathered by using the Option Repository and converting them to an OptionDto using AutoMapper. This list is then sent to the client with a 200 (success) status code.
=== Frontend
On the Client, this section includes two pages, which provide the tutor the ability to create and manage Quizzes. The routes for the pages are defined using React Router.
==== Main page
The first page is the main page, also called the index page. It is configured on the default route. Fully loaded, the page looks like this:
#figure(image("images/screenshots/mainPage.png"), caption: [Main Page Screenshot], supplement: "Figure", kind: "image")
The first thing that happens when the page is loaded, is the loading of the Quizzes from the database. This is done using a ReactRouter Loader, which is declared on the route. Loaders and Actions are defined in their files. There, functions are created for each Loader/Action. The following Loader is used to fetch the Quizzes:
#code-snippet(caption: "Quiz Loader Function")[
```ts
export const quizLoader: LoaderFunction = async () => {
    const quizzes = await getQuizzes();
    if (quizzes == null) {
        throw new Response("", {
            status: 404,
            statusText: "Not Found",
        });
    }
    return quizzes;
}
```
]
This function has the type LoaderFunction, which is provided by ReactRouter. The getQuizzes() method and all other methods containing fetch requests are contained in a separate file called `endpoints.ts`, where the JavaScript fetch #acr("API") is used to make a #acr("HTTP") Request to the Server. The URL constant and all Models are imported from another file:
#code-snippet(caption: "getQuizzes() Method")[
```ts
type GetQuizzes = () => Promise<Quiz[]>
export const getQuizzes: GetQuizzes = async () => {
    try {
        const response = await fetch(`${URL}/Quiz`);
        const data = await response.json();
        return data as Quiz[];
    } catch (e) {
        throw e;
    }
}
```
]
The type has to be created in order to tell TypeScript which arguments of which types the function takes and what the return type of the function is.

The Loader can then be used in the Component of the page by using the `useDataLoader` hook. This hook is provided by ReactRouter. Once received, the Quizzes are passed as a Prop to another Component, where the Quizzes are laid out in Cards in a Grid layout. Each of these Cards in turn is its own Component. There, the name and description, as well as the number of Questions is laid out in an appealing way. Each Card also contains three Buttons to start a Game, edit a Quiz, and delete a Quiz. Two of these Buttons (Play, Delete) use Action Functions in order to execute #acr("API") calls. The Edit button redirects to the *Edit Quiz Page*. The Start Game button is defined like so:
#code-snippet(caption: "Start Game Button")[
```tsx
<Form method="post" action={`startgame/${id}`}>
    <Button variant='solid' colorScheme='green' type="submit">
        Play
    </Button>
</Form>
```
]
`variant` and `colorScheme` are Chakra-Ui styling props. When pressing the other two buttons, the tutor has to verify their identity by entering their password. This, however, is explained later on.

When the tutor wants to create a new Quiz, they simply have to press the New Quiz Button in the top right corner of the page. When pressed, a dialog opens where they can enter a name and a description:
#figure(image("images/screenshots/createQuiz.png", height: 7cm), caption: [Create Quiz Dialog Screenshot], supplement: "Figure", kind: "image")
This is implemented using the Modal Component provided by Chakra-Ui. This Component can be controlled with the `useDisclosure` hook. This hook provides one boolean value and two functions, which are passed as props to the Modal (In this case the Modal is wrapped in its own Component so they are passed as a Prop of this Component). The value is true if the Modal is open and false if it is closed. The two functions are used to open and close the Modal respectively.

Inside the Modal, there are two input fields and a submit button, which first makes an #acr("API") call to create a new Quiz and then navigates to the *Edit Quiz Page* of the created Quiz by using the `useNavigate` hook. This hook allows for redirection via code.
==== Edit Quiz Page
This page is used to edit the details of a Quiz. These details include the specific Questions and the various Options selectable on each Question. This page also gives the tutor the ability to rename a Quiz itself.
#figure(image("images/screenshots/editQuiz.png", height: 8cm), caption: [Edit Quiz Page], supplement: "Figure", kind: "image")
The page is split up into 2 sections:

*Sidebar:*

This part of the page is configured as its own component, which is then included in the Edit Quiz Page. In the main Component of the Edit Quiz route, the questions are loaded via a ReactRouter Loader function:
#code-snippet(caption: "Question Loader function")[
```ts
const loader: LoaderFunction = async ({ params }: QuestionsLoaderArgs) => {
    const quizId = params.quizId ?? "";
    const questions = await getQuestions(quizId);
    if (questions == null) {
        throw new Response("", {
            status: 404,
            statusText: "Not Found",
        });
    }
    return questions;
};
```
]
This function first receives the Quiz ID through the URL parameters (The route of the Edit Quiz Page is /editQuiz/quizId). The first line of the function uses the null coalescing operator to check if the ID from the parameters is not undefined. The null coalescing operator first checks if the value before ?? is null/undefined. If it is not, the right value is used. If the right value is null, the left value is utilized instead. This seemingly pointless check is needed because even if there is theoretically no chance for the ID to be undefined in TypeScript, the compiler will still throw an error since it does not know for certain that the parameter is a string and not undefined. Next, a standard #acr("API") call is made. The Questions array received through this Loader is then passed as a Prop to the Sidebar Component. There, the `array.map()` function is used to display a Link to the Question Details View for each Question. Other than the name of the Question, the Link also contains two Chakra-UI badge components displaying the Question type and the number of Options respectively. The button used to create a new Question employs a ReactRouter Action function. At the bottom of the Sidebar, there are two last buttons.

The second button is fairly simple as it merely contains a Link to the main route of the client. The first one, however, is more complicated as it opens a Modal where the name and the description of the Quiz can be altered. This Modal will not be shown here as it is almost entirely the same as the Create Quiz Dialog. It does, however, contain some interesting code: As the Modal Component needs to know the current Quiz details in order to populate the standard values of the text boxes, the name and description of the Quiz have to be loaded first. This seemed rather easy at first since it was assumed in the development process that instead of all Questions, the entire Quiz was loaded in the main Component of the route. This mistake was made due to the Edit Quiz details Modal being a late addition to the page made long after the rest. The problem was then solved by getting the Quiz ID from the #acr("URL") Parameter. This was not very easy since the ReactRouter documentation lacked any explanation on how to perform this task. It was eventually figured out through trial and error:
#code-snippet(caption: "loading Quiz details in Modal")[
```ts
 const { quizId } = useParams<'quizId'>();
    useEffect(() => {
        if (quizId) {
            getQuizById(quizId)
                .catch(error => console.error(error))
                .then(data => {
                    if (data) {
                        setName(data.name);
                        setDescription(data.description);
                    }
                })
        } else {
            console.error("Could not load");
        }
    }, [])
```
]
The Quiz ID can be loaded if the name of the #acr("URL") field is specified. Afterwards, the React `useEffect` hook is used to perform the needed #acr("API"). The useEffect Hook gives the developer the ability to perform side effects within function-based Components. Side effects are actions that need to happen after React has updated the #acr("DOM"), such as fetching data, subscriptions, timers, or directly manipulating the DOM. By using useEffect, the developer essentially instructs React to execute specific code passed as a function in its first argument after the Component has been rerendered. The Hook also takes an array as its second argument. This array is used to specify when the code should be executed. This is useful since otherwise, the function would run every time the Component is rerendered, which happens a lot in React. If for example a state variable is passed as the second argument, the code is only executed if that specific state changes. If an empty array is passed as it is in the example given, the function is only called on the first render of the Component. @misc-useeffect

*Question Details View:*

This part of the page encompasses all content to the right of the Sidebar. It can be displayed in two different versions depending on whether or not the Question is merely being viewed (display view) or actively edited (edit view). the views can be switched between by pressing the Edit button to start editing and by pressing the Save/Cancel buttons to mark the edit process as complete. Both views use the same underlying Components. The only difference is that in Edit mode, all buttons and text fields are enabled, which is achieved by declaring a boolean Prop on the Component and using said Prop to manage the state of input fields.

Both views are declared on their own subroutes of `/editquiz/quizId`. The edit view uses the route `/editquiz/quizId/editquestion/questionId` and the display view is available on `/editquiz/quizId/question/questionId`. As it is clear from the fact that the views have their individual #acr("URL")s, they are separate pages. This means that pressing the Links in the Sidebar would, without additional configuration, redirect to another page containing the display view of the desired Question. To display the contents of the route on the same page as the Sidebar, a ReactRouter Outlet Component needs to be included in the Component of the editquiz route. This tells ReactRouter to render the contents of subroutes as part of their parent. Once displayed, individual Questions are loaded using a ReactRouter Loader function. In the case when a new Question is created, the edit view is opened automatically. The Questions are always created without any data. The rest of this explanation will be focused on said edit view as it requires more attention due to the need to manage the State. This is not necessary on the display view since the user has no way of changing any values.

The edit view (and also the display view) contains a Component, which contains several input fields (disabled on display view) for entering data such as the Question name or the time limit and a dropdown list for the Question type. The following shows the input field for the time limit:
#code-snippet(caption: "Edit Question Time Limit Input Field")[
```tsx
<Input type="number" 
name="timeLimit" 
value={timeLimit != 0 ? timeLimit : ""} 
disabled={!isEditing} 
onChange={(event) => setTimeLimit(+event.target.value)}
/>
```
]
Its value is set to the time limit loaded with the Loader if the Question has a time limit specified. If not, the field is left empty. If the input changes as the tutor enters a number, said number is stored in State to be used in an #acr("API") call to the server which performs a PATCH Operation to mutate the data of the Question. the plus in front of the expression `event.target.value` is used to convert a string to a number in JavaScript/TypeScript. The component also features an error message that is displayed above the input fields if there are empty fields. This also causes the save button to be disabled:
*Image of error*
This is done by declaring a boolean state, which is used to control the visibility of the alert and the ability to click the button. This is then updated by using the useEffect Hook to trigger when the state of the input field values changes.
#code-snippet(caption: "Edit Question Error Check")[
```ts
useEffect(() => {
    setEmptyError(name == "" || points == 0 || timeLimit == 0);
}, [name, points, timeLimit])
```
]
Next to the Component for displaying the information about the Question there is another one showing all the Options. This Component uses the `array.map()` function to display one Component for each option, where the Option title can be changed (in the edit view), be marked as correct, or be deleted. As it would be extremely difficult to manage the state of the Options through that many layers of Components, the `useContext()` Hook is used on the main Component of the editquestion route. This hook provides an elegant way to share data across various components within an application, eliminating the need for "prop drilling" (Passing Props through multiple layers). A Context can be thought of as a container, which is accessible anywhere within the Component tree. When a Component needs a specific piece of data, useContext allows it to directly tap into that Context, retrieving the current value. In this example, the Hook is used to store all Option in an array of objects. For this, the TypeScript Index signature is used. This allows the developer to define a key for each entry in the array similar to a dictionary in other languages. The following shows the signature of the state used here: `{ [key: string]: OptionDto; }`. The key in this example is the ID of an Option. Existing Options are loaded into the State as follows:
#code-snippet(caption: "Load Options into Context State")[
```ts
const [options, setOptions] = useState<{ [key: string]: OptionDto }>(() => {
if (question.options.length > 0) {
  return question.options.reduce((acc:{[key: string]:OptionDto;}, option) => {
      acc[option.oId] = {
          optionText: option.optionText,
          isCorrect: option.isCorrect
      };
      return acc;
  }, {});
} else return {}
    });
```
]
This uses the `array.reduce()` function with two arguments, the dictionary where all options should be stored and the options themselves. The function is then run for every Option to add them to the dictionary. If no Options exist, the dictionary is left empty.

In order to use the Context State in other Components, they have to be wrapped in a Context Provider. This Provider takes the State and SetState functions as arguments. Inside those Components, the Context State can be accessed using the useContext Hook by passing the name of the Context @misc-usecontext:
#code-snippet(caption: "useContext Hook example")[
```ts
const { options: contextOptions } = useContext(OptionsContext);
```
]
In an Option Component, the most complicated problem is to determine whether or not the parent Question is SingleChoice or MultipleChoice. If it is the former, additional code is needed to only allow one Option to be correct at one time. The checkbox itself is made with a Chakra-UI IconButton Component which is filled if the Option is marked correct. The following code shows how an Option is marked as correct:
#code-snippet(caption: "check if there is already a correct Option")[
```ts
setOptions((prevOptions: { [key: string]: OptionDto }) => {
    const correctOptionId = Object.keys(prevOptions).find(
    key => prevOptions[key].isCorrect);
    
    if (correctOptionId 
        && correctOptionId !== id 
        && !prevOptions[id].isCorrect 
        && type == QType.SingleChoice) {
            console.error(`Error Message`);
            return prevOptions;
    }
    return { ...prevOptions, [id]: { ...prevOptions[id], isCorrect: !prevOptions[id].isCorrect } };
});
```
]
It first checks whether or not there already is a correct Option. Afterward, it checks if the ID of the current Option is not the ID of the Option that is marked correct and if the current Option is marked as not correct in the state. Finally, it checks the type of the Question. Said type is also provided to the Component with a Context. If all of these conditions are true, an error message is displayed. Otherwise, the state is updated. The Component containing all Options also contains Alerts for when an Option is empty and for the situation where there are not the required 2-6 Options. The Options from the Context State are then used in combination with the Question data to make an #acr("API") call to the Server to save the changes to the Questions/Options.
== Access Control with password
Another must-goal required the addition of functionality, which allows the tutor to restrict certain Actions from being executed without verification. This is necessary since the application is run locally and accessible through the tutor's #acr("IP") address. Without verification, it would be possible for a student to access the page on their own device and modify data without the tutor's consent. The solution that was implemented for this problem is a verification system using a password. This means that the tutor is not required to provide any login data like a username and an Email-address to use the application.
=== Backend
In the Backend, the password is stored similarly to the Quiz data. This means that it is stored in a hashed form in the same database as the rest of the application data. This is done in order to reduce complexity. A password Model was also created containing an ID that is automatically set to "1" since there can only ever be one password and a string for the password hash.

This Model is then used in a dedicated authentication Controller, which provides endpoints for checking if a password is set, registering a password, verification of an entered password, and changing the password set. The following shows the verification endpoint:
#code-snippet(caption: "Verify Password endpoint")[
```cs
 [HttpPost("verify")]
public async Task<IActionResult> Verify([FromBody] RegisterVerifyPasswordDto model)
{
    var storedPasswordHash = await _context.Passwords.FindAsync(1);
    if (storedPasswordHash == null) return NotFound("Password not set");

    if (BCrypt.Net.BCrypt.Verify(model.Password, storedPasswordHash.PasswordHash))
    {
        return Ok("Password verified successfully");
    }
    else
    {
        return Unauthorized("Incorrect Password");
    }
}
```
]
This code first retrieves the password hash stored in the database. Then, it uses Bcrypt.NET to check whether or not the password passed in the Body and the stored one corresponding to the hash in the database are the same. If they are, a #acr("HTTP") Response with the status code 200 (success) is sent. If they are not, the Server sends a Response with the status code 401 (unauthorized). The endpoint to change the password is similar with the only difference being that in addition to sending a 200 status code, the Server also updates the password hash on the database. The other two endpoints are also structured very similarly. Thus, they will be omitted in this documentation.
=== Frontend
== Game Flow
=== Models/DTOs
=== Repositories
=== Controller
=== Initialize Game
=== Join Game
=== Start Game
=== Gameplay
=== End Game

#pagebreak()

= Conclusion
== Results
=== Backend
=== Frontend
== Potential future additions
== Reflection on the project

#pagebreak()

#bibliography("references.bib")

#outline(
  title: [Code Listings],
  target: figure.where(kind: "code"),
)

#outline(
  title: [Image Listings],
  target: figure.where(kind: "image"),
)
