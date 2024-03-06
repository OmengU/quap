#import "template.typ": project, footer-set, table-overview, declaration
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
  title: "Quap - a simple Quiz app",
  subTitle: "Design, Development and Implementation of a Quiz and Learning app",
  number: "5AHINF-2023/24-DA12",
  authors: candidates,
  authorsLastName: candidates.map(candidate => candidate.name.split().last()),
)

#heading(numbering: none, outlined: false)[Abstract]
The last 15 years have seen giant leaps in many fields of the computer and IT industry, not only in terms of performance but also when it comes to cost. This expansion has enabled many schools to provide staff and students with their devices, may it be a laptop or a tablet. Such a development has led to countless possibilities for improving education quality. Teachers worldwide have seized this opportunity and created interactive and engaging lessons for their students. Some countries and larger schools have also gone the extra way and have commissioned custom, often costly, software meant to enhance the performance of attendees even further.

However, this has also resulted in the widening of the difference in education quality nationally and internationally since many less-equipped institutions are reliant on already publicly available solutions. These are often developed by large multinational for-profit corporations. For that reason, many of them come with artificial limitations and privacy violations to push people into subscribing to often expensive monthly subscription services. This project aims to create a simple, free alternative to empower teachers worldwide.

#pagebreak()

#show: table-overview

#show: declaration




#abbreviations

#outline(depth: 3, indent: auto)
#show: footer-set.with(authors: candidates, number: "5AHINF-2023/24-DA12")
#counter(page).update(1)

#print-index(title: "List of abbreviations", outlined: true)

#pagebreak()

= Planning
This first section will cover all details relating to the planning of this project. It aims to give an extensive overview of the thought processes and ideas behind this diploma thesis.
== Task definition
The first step when starting work on this thesis was to define the nature of the application precisely and to think about what was needed to achieve a completed state.
=== Initial idea
Creating a fun and exciting environment is essential for any instructor/teacher. A popular way to create engaging lessons for students is to utilize quizzes, which not only consolidate previously taught material but also create an opportunity to assess students' abilities without having to rely on often very unpopular and tedious exams/tests.
That is exactly what I was pondering when I came to the realization that an application providing the feature described above would be an ideal choice for a diploma thesis. So, I began planning, and now I want to turn my plans into reality and hopefully create an application that will help many teachers make better lessons.
=== Status quo
Another reason for choosing this project is that existing solutions are often inadequate. They usually come with limitations, such as a maximum number of concurrent players, and irritating upselling, such as paid subscriptions and predefined lesson plans filled with irrelevant information and advertisements. They also collect and store user's data.
A major problem with creating a similar application is that traditional solutions are often hosted on the Web and thus cost a lot to run. However, this project is not a problem, as it is run directly on the instructor's PC and, therefore, only accessible on a local network, which is a nonissue for classroom situations.
== Goals
This project aims to create a functional prototype, which, while not 100% flawless, is still usable in a classroom setting.

*Minimalism*

The goal behind the application is not to create a full-fledged teaching suite, nor should it apply to as many distinct groups as possible. This product is mainly targeted toward educators, who desire a simple no-frills way to assist them in their class or educators, who are worried about the influence of large corporations on the field of education.

*Simplicity & Ease of Use*

Simplicity is another core principle behind the project. The goal is to create a user interface that, while not using the most up-to-date eye-catching design trends, is able to be used without having to spend more than a couple of minutes trying to figure out how to, for example create a quiz.

=== Must-goals
These goals must be completed by the final presentation in order to be able to call the project finished:
- *Ability to play quizzes* #linebreak() The application must provide a simple interface for playing quizzes. The quizzes must be laid out on a central page where a game can be started. When playing a game, the current question is displayed on a projector screen, and a separate interface is provided for choosing the desired answer. After completing the quiz, The scoreboard must be displayed on the projector screen.

- *Ability to create/edit/delete quizzes* #linebreak() The central page provides functionality for managing quizzes. There must also be a separate interface for creating quizzes. The quizzes must be stored on a local database.

- *Administrator* #linebreak()The program must provide a way for the instructor to create an administrator account in order to prevent students from accessing the central page to alter created quizzes.

- *Mobile-friendly interface* #linebreak()The student interface must be accessible from mobile devices, meaning that contents should be adjusted according to screen size.

- *Question properties* #linebreak()The instructor must be able to customize questions in several ways: single choice or multiple choice, number of points on correct completion, time limit, and number of answers. (min. 2, max. 6)

=== Should-goals
These goals may be completed if all must-goals have already been completed before the hand-in date. Thus, they are considered optional:

- *Packaging/Containerization* #linebreak()The application may be easily installed/run. This means it can be started with a simple click or a few CMD commands.

- *Exporting/Importing of quizzes* #linebreak()The instructor may be able to import/export quizzes as text files that can be, when imported into another instance of the program running on an entirely different computer, fully converted back into a valid quiz, which can immediately be played.

- *Animations* #linebreak()The application may contain animations in select parts of the #acr("UI") (player view, question overview), which may help boost student engagement.

- *More question types* #linebreak()The application may contain more than the two previously described (single choice, multiple choice) question types. Possible additions include text field entry (example: Math question), slider, sorting entries, …

== Project organization
This section seeks to inform about the project's organization and define specific tasks and milestones.
=== Roles
#grid(
  columns: (1fr, 1fr),
  column-gutter: 5mm,
  align(end)[#text(weight: "bold")[
     Main Supervisor#linebreak()Secondary Supervisor#linebreak()#linebreak()Project leader#linebreak()#linebreak()Project team
  ]
  ],
  align(start)[
    Dietmar Winkler#linebreak()Markus Falkensteiner#linebreak()#linebreak()Florian Piberger#linebreak()#linebreak()Florian Piberger
  ]
)
=== Task distribution
*Florian Piberger*
- Software Design
  - Backend Components
  - Frontend Components
  - Database Schema
  - Choosing used technologies
- Design Frontend interface
- Coding
  - Implementation of Backend #acrpl("API")
  - Implementation of Frontend Components
  - Implementation of Real-time communication between Frontend and Backend
  - Creating Database Models
- Testing 
- Documentation

=== Milestones
*Until late 09/2023 - early 10/2023:*
- Complete Scope Statement
- Start learning unknown technologies
- Enter details in the diploma thesis database

*Until end 10/2023:*
- Decide on major technologies
- Database schema for quizzes
- Initial work on the Backend
  - Architecture
  - ~30% complete

*Until end 11/2023:*
- Backend - essential real-time communication
- Frontend - initial work

*Until end 12/2023:*
- Frontend - Design
- Backend - first prototype

*Until end 01/2024:*
- Documentation - research and start writing (~40-50% complete)
- Frontend - first prototype

*Until end 02/2024:*
- Frontend/Backend - last polish and testing
- Documentation - ~80-85% complete

*Until end 03/2024:*
- Documentation – complete
- Backend – complete 
- Frontend – complete
- Start work on video and poster

#pagebreak()

= Theoretical Foundations
This chapter delves into various applications, programming languages, frameworks, and related technologies pertinent to this work. Each component receives a thorough examination, covering its functionalities, potential use cases, unique features, benefits, drawbacks, and any existing limitations. By illuminating these strengths and weaknesses, I aim to equip readers with a comprehensive understanding of these technologies and their significance to the overall project. This section is a reference point for the rest of the documentation. An explanation of what was achieved can be found in the #link(<implementation>)[Implementation] section.
== Software used
Many programs and other software were used in order to complete the must-goals. The following section will cover them in detail. To qualify as a program, a piece of software has to be executable.
=== Development
This section outlines the software used for the development of the application. The specific products were chosen for their support of the used languages as well as their ability to be installed and run on the Windows #acr("OS"). The personal preferences of the developer also played a considerable influence in the decision process.
==== Visual Studio
Visual Studio is an #acr("IDE") developed by the Redmond, Washington-based technology company Microsoft. @eb-microsoft It allows the developer to write code in multiple languages, including C\# and C++. It also provides tools for building and executing the written code, such as compilers and tools to improve the developer experience, the most notable being a Debugger and several code completion tools. A debugger allows the developer to diagnose problems with the code by setting breakpoints where the program is paused and the values of variables are shown. It also provides functionality to inform the developer when a variable changes. Visual Studio is available in 3 Versions:

- Community: Open source version with minimal proprietary additions; targeted towards students
- Professional: paid version; targeted towards small teams
- Enterprise: targeted towards large cooperations
The Community version was used for this project. @ms-visualstudio

In this project, Visual Studio was primarily used for the Backend of the application.
==== Visual Studio Code
#acr("VS Code") is a code editor developed by Microsoft with an open-source core that also contains proprietary components such as telemetry. Although it is not a full-fledged #acr("IDE"), as its core does not contain tools typically found in an #acr("IDE"), such as debuggers and code completion utilities, it is still a potent tool thanks to its expansive and well-supported extension eco-system. It is thanks to these extensions that #acr("VS Code") has become very popular in the field of web development, as many developers depend on #acr("VS Code") extensions when working with popular frameworks and libraries. When some commonly utilized technologies are used, no extensions are needed since Microsoft has included tooling for web technologies out of the box, such as a basic debugger and code highlighting for the popular programming languages JavaScript and Python @ms-vscode as well as EMMET, an extension providing productivity-enhancing abbreviations and snippets for #acr("HTML") and #acr("CSS"). @ms-emmet

In this project, Visual Studio Code was primarily used when developing the application's Frontend.
==== Docker Desktop/Docker
Docker Desktop is a #acr("GUI") application for Windows and macOS that is used to manage Docker Containers. It is available in both an open-source community edition and a paid commercial version. It allows the developer to create and maintain Docker Images and Kubernetes Clusters.

Docker itself is a system that gives developers the ability to deploy software quickly. It might be easier to imagine it as a way to package an application, including all dependencies and configuration files into a self-contained and reusable package. Said package is referred to as a Container. Docker is often used in combination with a #acr("CI/CD") pipeline, where code is automatically tested and built and, in the case of Continuous Deployment, published.

Images are the core of Docker. Images contain instructions on how to build Containers. Therefore, it is possible to think of them as "Blueprints" for creating Containers. The instructions are defined in a Dockerfile containing information about the Container #acr("OS"), startup commands, and software dependencies. Containers themselves are instances of Docker Images. Containers are isolated and self-contained. It is possible to run multiple instances of them simultaneously. This helps improve the stability and security of the deployed application.

Even if a developer does not containerize their software, as is the case with this project, Docker can still be a helpful tool because many common dependencies, such as databases, are available as Docker Images, which removes the need to install them on the development machine itself. @misc-dockerdesktop
=== Other
This section outlines software used for various miscellaneous tasks other than software development.
==== Mozilla Firefox
Mozilla Firefox is an open-source Web Browser developed by the Mozilla Corporation. It began development in 1998 as a fork of the then open-source Netscape Navigator Browser, which had at one point been the most popular Web Browser in the early days of the internet. It had, however, lost a significant bit of popularity by the time it was made open-source. Firefox, in turn, became a prevalent browser in the 2000s, but it has seen declining usage for the last couple of years as the Chrome Browser, developed by Google, has taken the lead. Depending on the region, Firefox now hovers around 3 to 10% market share.

Firefox was used in this project to test and interact with the Frontend interface. It was preferred over Chrome or Browsers based on it, because it not only offers a greater amount of privacy but also better developer tools, especially when viewing #acr("CSS") properties of #acr("HTML") elements. @eb-firefox
==== Swagger #acr("UI")
Swagger #acr("UI") is an interface built upon the OpenAPI Specification for documenting an #acr("API") by using either a YAML or #acr("JSON") document to describe the available endpoints and the Models used for data transfer. It was initially known as the Swagger Specification. Swagger itself includes a set of tools that aid the developer in the design, development, and documentation of #acrpl("API").

Swagger #acr("UI") is one of these tools. It helps the developer keep an overview of the #acr("API") by generating a #acr("GUI") out of the YAML/#acr("JSON") document displaying all endpoints. It then allows for the testing of the endpoints by providing fields for each parameter, where test data can be entered and buttons to submit the #acr("API") calls. @misc-swagger
==== Typst
Typst is a newly developed #acr("FOSS") markup system primarily targeted toward academic use. It is intended as a replacement for LaTeX. Typst is heavily inspired by Markdown as it includes built-in syntax for commonly used text elements like bold/italic text, unordered/ordered lists, and headings. The system is entirely built with Rust, a modern type-safe high-performance programming language resulting in fast compile times compared to LaTeX.

Another major difference between Typst and older solutions is that it is not separated into a distinct markup and scripting language but is instead one language containing both capabilities. Its scripting side includes implementations of conditionals, loops, and data types, including Strings, Integers, Floats, Arrays, and Dictionaries, all of which are commonly found in other programming languages, making Typst very intuitive for programmers while not being too complicated for regular users. Additionally, it supports many formats for storing bibliographies, including Hayagriva YAML and BibLaTeX files. Typst documents can be exported as #acr("PDF") and #acr("HTML") files.

The markup and scripting components of Typst are very closely linked and can be embedded within each other. Declared variables are also shared between the two, making it very easy to, for example, create a list of names, programmatically modify it, and output the result in the space of a couple of lines in one file. The same procedure would require the use of multiple separate files in comparable systems. Typst also allows the user to programmatically change the properties of text elements anywhere in the document by using so-called Set Rules. The following two examples show how to add numberings to headings and how to justify the text of paragraphs:
```typ
set heading(numbering: "1.")

set par(
  justify: true
)
```
When used in text, programmatic elements must be marked by writing a "\#" in front of them. @typst Typst provides both a #acr("CLI") tool and a #acr("WYSIWYG") web-based editor for writing documents.

Typst allows for the creation of document-independent templates and packages. Even though Typst is still very new, there is already a thriving community of developers and general users creating said components and sharing them for free with the rest of the user base.

Typst itself is run as a startup and is headquartered in Berlin, Germany. The founders are Martin Haug and Laurenz Mädje. @typst2
==== JabRef
JabRef is a bibliography management tool that allows the user to collect, categorize, organize, and keep track of sources. It supports searching many online repositories, the most well-known of which is Google Scholar. Additionally, it includes the functionality to extract metadata from #acr("PDF") files. Collections of sources are stored as .bib BibLaTeX files, allowing them to be imported into the most common writing systems used in academia.

Sources can be categorized into several predefined categories including articles, books, thesis, and websites, each requiring the user to enter different information. The categories can also be edited by adding custom fields. @misc-jabref For example, this project required the addition of the date when a website was accessed.
==== Git/GitHub
Git is a so-called #acr("VCS"). A #acr("VCS") is an essential tool in software development. It is used to track changes made to a codebase, organize said codebase, and manage the collaboration between multiple developers in teams or open-source communities. Git was developed by Linus Torvalds, the creator of the famous #acr("FOSS") #acr("OS") Linux in 2005 to be an entirely free and open version control standard. He created it due to the capabilities of the BitKeeper #acr("VCS"), which had been used in the development of Linux, being reduced for non-paying customers.

There are a couple of concepts essential to the understanding of Git:

- *Repository*: Repositories represent the fundamental component of Git. They are used to store the code of a project or part of a project. Changes to files are also tracked on the repository level. On the technical level, it is a unique database storing project revisions and history. Unlike in other similar solutions, a Git repos not only contains file data but also data about itself, such as metadata and user configuration. That information is located in a ".git" directory, which is configured to be hidden. Git uses two different key structures to store data: the object store (efficiently copied during cloning) and the index (temporary and modifiable).

- *Branch*: To further segregate code changes and to avoid conflicts where multiple developers working on different features end up overriding the work of their colleagues, Git provides the ability to create an unlimited number of branches on a repository. Upon a branch's creation, all changes made to code only affect the branch itself and are not reflected in the rest of the repository. A branch is created as follows: ```sh
git checkout -b branchName
or
git checkout branchName
or 
git branch branchName
``` The default branch that is initialized when creating a repository has traditionally been called "Master". Due to negative historical denotations, the term "Main" is preferred nowadays.

- *Commit*: Commits are snapshots of a repository's current state of selected files. They are used by Git to record changes made to files over time. A single commit does not record the state of all files. Instead, Git looks for changes made to files by comparing the newly committed state to the previously stored one. Git then processes the changes found. All unchanged files and directories remain unaffected by the commit. A commit is the only way for a developer to change the files stored in the repository. Developers are also free to choose which files are included in a commit. Each commit must have a descriptive message explaining the changes. Before creating a commit, files are typically staged using the `git add` command, creating a temporary list of changes to be included.

- *Merge*: If a developer is done working on a specific branch, they can integrate its changes into another branch, combining the commit history of both branches and bringing their changes together. This process is referred to as merging two (or more) branches. A branch is merged as follows: ```sh
git merge branchName
``` One problem that can occur when merging branches is Merge Conflicts. They occur when changes have been made to the same file in multiple branches. A developer or a team leader then has to manually inspect affected files and decide which version to keep and which to discard. One way to achieve this is to use the `git diff` command. This command is used to display changes between files. Other tools and strategies are also available to simplify conflict resolution. @book-git

While storing a repository solely on a local computer is possible, especially when working alone, it is way more common to host a repository on a server. Large organizations may have their private Git servers, but there are also hosting sites that allow users to manage repositories. The most popular option is the Microsoft-owned GitHub, which is used to host this project. In addition to simply hosting repositories, GitHub allows users to host simple Websites and track issues on repositories in addition to basic project management tools like a Kanban Board and #acr("CI/CD") with GitHub Actions. @misc-githubfeatures
== Backend
In addition to the many programs used to complete this project, several technologies were also used as building blocks of the application. This section will cover everything used in the Backend or the server of the project.
=== Programming Languages
The following section outlines which Programming Languages were used in the Backend.
==== C\#
C\#, or as it is pronounced, "C sharp", is a general-purpose programming language developed at Microsoft by a team headed by the Danish software engineer Anders Heijlsberg. He was previously responsible for creating the Turbo Pascal and Delphi languages. At Microsoft, he also works on TypeScript, which will be explained later in this document.

The language is written object-oriented, meaning that the core of each C\# application is Classes, independent entities containing both variables and business logic. It also provides type safety, which, in combination with the language's automatic memory management and garbage collector, makes C\# very user-friendly and reliable. Its syntax is often compared to that of the popular language Java. Microsoft originally developed the language only for their own Windows #acr("OS"), but it has since been made available for macOS and Linux. @misc-csharp It is part of the larger .NET Framework used to create many different kinds of applications. The original .NET Framework is only supported on Windows. A cross-platform version called .NET Core is also available. The most recent .NET Core revision as of February 2024 is .NET Core 8. @ms-dotnet
=== Frameworks/Libraries
In addition to C\# as the primary programming language of the Backend, several frameworks, libraries, and packages were also used in cases where additional features were required. 
==== Asp.NET Core <asp.netcore>
Asp.NET is #acr("FOSS"), cross-platform, and lightweight framework built as an addition to the previously mentioned .NET Core Framework. It enables developers to create high-performing Web Applications with the C\# language. It is based on the older Asp.NET Framework, which, as opposed to its newer counterpart, is only available for Windows, as it is based on the regular .NET Framework. Asp.NET still receives updates. They are, however, minor. Asp.NET Core is a total rewrite of the previously existing functionality.

Asp.NET Core provides the ability to create both #acr("MVC") and Web #acr("API") applications. #acr("MVC") describes a popular architectural pattern where the application logic is split into three distinct parts:

- *Models*: Represents the data and manages how data is stored, retrieved, and manipulated.

- *Views*: The #acr("GUI") page(s) the user interacts with. They are used to display the data provided by the Models and provide interactive elements to mutate said data.

- *Controller*: A Controller acts as the middleman between the View and the Model and facilitates data transfer across the application.

On the other hand, web #acr("API")s, on the other hand, merely provides endpoints to which other applications can send and request data. They do not include graphical interfaces themselves. It is, however, possible to also define endpoints on #acr("MVC") Controllers so that other applications also have access to the data. @misc-asp.netcore

This project uses a Web #acr("API") without any #acr("MVC") Components.
===== Entity Framework Core
Asp.NET Core also provides an #acr("ORM") called Entity Framework Core. An #acr("ORM") is an abstraction layer between the application and the database. It is used to perform #acr("CRUD") operations without having to write database queries by hand. They typically provide interfaces to interact with database tables like regular objects. One thing of note is that the term is reserved for relational databases only. Non-relational solutions use different terms (for example, Object Document Mapper in MongoDb). Entity Framework Core supports SQLServer out of the box, although there are third-party packages which add support for further databases. @misc-orm
==== AutoMapper <automapper>
To convert between a Model and a #acr("DTO"), it is normally required to assign the values as follows manually:
```cs
model.name = dto.name;
model.date = dto.date;
model.price = dto.price;
```
Doing this can not only lead to a lot of filler code, but it may also be impossible with larger objects. #acrpl("DTO") will be thoroughly explained later in this document. AutoMapper is a library that allows the developer to define maps between certain Models/#acrpl("DTO"). It will then try to match the corresponding fields automatically. Should this fail, the developer will be able to create maps manually as well. Maps are not bidirectional, so each one has to be created twice. AutoMapper includes an easy way of doing this by simply defining the map a second time and adding `.ReverseMap()` at the end of one of them. @misc-automapper
==== SignalR <signalR>
In a traditional Web #acr("API"), clients can only send requests to the server, to which the server may then respond. This system works well for specific use cases, but it is too limited for others, such as chats or games. Instead, these applications may benefit from using another technology, namely WebSockets. They differ from traditional #acr("HTTP") endpoints by establishing a persistent connection between clients and servers with two-way communication channels. The technical term for communication of that sort is "Full-Duplex Communication". Messages transmitted over WebSockets are also delivered or received in real-time. Although their usefulness is without doubt, WebSockets also possess certain limitations, which a developer has to keep in mind when using them:

- *Poor Security:* WebSocket messages are, by default, not transported securely. This may lead to unauthorized access to systems and data breaches.

- *Browser Compatibility:* Some older Browsers may not support WebSockets. Some Browsers also require other metadata or security certifications when using them.

- *Complexity:* Compared to #acr("HTTP") endpoints, WebSockets are more challenging for developers to use and implement. The developer must also maintain the connection and manage clients, which adds even more difficulty.

To solve these problems, Microsoft released the SignalR library for .NET and .NET Core. It enables developers to work with WebSockets efficiently. At the core of SignalR are so-called Hubs. There, functions can be created that correspond to a particular task performed by the application. Business logic is defined within them, and Model data is interacted with. Should the changes to the application state performed in a function require updates in the clients, messages can be sent to either all clients, groups of clients, or specific clients. SignalR is also easily combined with Microsoft Identity to associate specific clients with logged-in users.

For clients, for example, a website, SignalR is also available as a package. Once installed, event listeners can be defined, which waits for a specific message from the server. Each message requires its own listener. Additionally, clients can call the previously discussed functions on the server by invoking them with their name and, if needed, adding data required in the Backend.

SignalR also allows for the creation of a custom function that is executed on a client establishing a connection by overriding the `Hub.OnConnected()` or `Hub.OnConnectedAsync()` methods. It is also possible to invoke functions on the Hub on the same ASP.NET application by using a HubContext. Lastly, SignalR also supports real-time communication technologies other than WebSockets. They are, however, excluded from this documentation since they are not used. An example of one of them would be Server Side Events. @book-signalr 
==== Bcrypt.NET <bcrypt>
Bcrypt.NET is a .NET library that implements the popular Bcrypt password-hashing function. @misc-bcryptnet

Bcrypt was designed by Niels Provos and David Mazières in 1999 and is based on the 1993 developed Blowfish Cipher, created by American cryptographer Bruce Schneider. Although newer ciphers and algorithms exist, Bcrypt is still considered secure and widely used, thanks to its availability on many platforms. Blowfish even has a successor called Twofish.

It does not only just hash passwords; it also salts them. Salting adds additional security compared to just hashing, where passwords are merely encrypted using a predefined algorithm. One downside of doing things this way is that hackers retain the ability to use so-called Rainbow Tables, which are created by first gathering a list of commonly used passwords, most of them regular words without significant alterations. Frequently used tricks, such as replacing the letters "O" and "E" with the numbers 0 and 3, respectively, are also taken into consideration. This list is then run through an algorithm to get a list of hashed passwords. Salting mitigates this issue in the following way: When passwords are hashed, in addition to simply applying the algorithm, a random string of numbers and characters is used as a second argument to the hashing function. This string is referred to as the Salt. It is used inside the hashing function to modify the resulting hashed password so that encrypting the same password with multiple Salts results in different outputs, rendering Rainbow Tables useless.

In addition to Salts and to distinguish itself from competing solutions, Bcrypt is also significantly slower than other algorithms, making regular encryption and decryption still possible but rendering Rainbow Tables time-consuming to produce, even without the use of Salts. @misc-bcrypt
=== PostgreSQL <postgres>
The database used for this project is PostgreSQL, a #acr("FOSS") relational database. Similarly to other relational databases like MySQL and SQLServer, it stores data in tables divided into rows and columns. Another shared characteristic is that most relational databases use #acr("SQL") to write queries performing #acr("CRUD") operations on stored data. What differentiates PostgreSQL from other solutions is that it is a so-called Object Relational Database. It supports concepts like custom data types and inheritance typically found in #acr("OOP"). It also allows multiple transactions to be run simultaneously by assigning a snapshot of the database to each one and for reusable queries. @misc-postgres

This project uses some of these features since it uses Enums to store specific data, which are not available on other relational #acr("DBMS"). Further details about said implementation will be covered in the Backend part of the implementation section later in this documentation. One downside of using PostgreSQL with Entity Framework Core is that it requires the installation of a third-party package called `Npgsql` to be supported.
=== Concepts
The following concepts are vital to understanding the implementation of the Backend.
==== REST
#acr("REST") #acrpl("API") are #acrpl("API"), that use #acr("HTTP") technology. The term #acr("REST") itself merely describes a set of guidelines, which are recommended when designing #acr("HTTP")-based #acrpl("API"). They were laid out by Roy Fielding, who co-founded the Apache #acr("HTTP") Server Project in his Ph.D. thesis written in the year 2000. #acr("API")s that utilize these guidelines are called "RESTful".

Having a well-designed #acrpl("API") is essential to the modern web, where developers not only work with their #acrpl("API") but also with several others hosted on other servers on the web. Therefore, all #acrpl("API") must be designed similarly. The core of #acr("REST") is defined by its #acr("URI") format:

`URI = scheme://authority/path[?query][#fragment]`

- *Scheme* usually denotes the protocol used (for example #acr("HTTP") or #acr("FTP"))

- *Authority* is the place, where the server is hosted (#acr("IP") Address or Domain name)

- *Path* is used to separate and organize data/pages on the server. Subsequent paths separated by slashes always indicate a hierarchical relationship

- *Query* is optional and is, for example, used for data entered by a user (Search parameters, ...)

- *Fragment* usually links to a specific part of data/a page (for example, a heading)

Although there are several other minor rules, six concepts build the core of #acr("REST") together with the #acr("URI") format. Some of these have already been alluded to previously:

+ *Client-Server:* There should always be a separation of concerns between clients (the applications processing the data) and the server (the application providing the data). Their interactions must be defined through standardized requests and responses, ensuring independence and scalability.

+ *Uniform Interface:* Resources are identified using URIs and accessed through a standard set of #acr("HTTP") methods (GET, POST, PUT, DELETE). This consistency makes #acr("API") usage intuitive and predictable for developers.

+ *Layered System:* This rule specifies that it is possible for there to be intermediaries, such as proxies between the client and the server, as long as they are not visible to the client. They may, however, still block specific data from reaching the client. Examples would be website blockers on a school network.

+ *Cache:* Data should always be cachable anywhere along the network path. The responsibility to declare data as cachable is a server's job. Caching is essential to the modern web, as it massively decreases the time and cost of data transfers.

+ *Stateless:* Each separate request must include all information the server needs to be processed independently. A server should not be relied upon to have any knowledge about each client and data associated with them, and it should also not store said knowledge. This improves scalability and prevents issues with server-side session management.

+ *Code-On-Demand:* Servers may temporarily transfer executable code to the client. The server also has to ensure that the client can execute said code. An example would be JavaScript files. @book-rest
==== DTOs
In software development, a #acr("DTO") is like a specialized messenger carrying only the data needed between different parts of an application. In their implementation, #acrpl("DTO") look similar to regular Models. The major difference is that they are not meant to represent data stored on the database but instead, data that is sent and received. A #acr("DTO") is usually associated with a Model and includes all fields from said Model needed for a certain data transfer. They are a good way to obfuscate data and are categorized as a Design Pattern. @misc-dto

An example for a use-case of a #acr("DTO") from this project is that when information about a specific Question of a Quiz is transferred to a client, any data containing information about whether or not an Option is correct or not is omitted to prevent students from cheating.
==== Repository Pattern
The Repository pattern in ASP.NET is a design pattern where so-called Repositories are created, which act as a middleman between Entity Framework Core and the #acr("API") Controllers. All functions performing #acr("CRUD") operations are defined in the Repositories so that a Controller never has to work with the database directly. The Repository pattern brings several advantages:

- *Separation of Concerns:* The Repository keeps business logic decoupled from the intricate data access details, leading to cleaner and more maintainable code. This is especially important for larger teams, where many developers work on a single codebase.

- *Reusability:* A single Repository can serve multiple parts of the application, reducing code duplication and promoting consistency.

- *Flexibility:* If you need to switch data sources, you only need to modify the Repository implementation, keeping the rest of the application intact. @misc-repo
== Frontend
This section will cover all technologies used in the implementation of the Frontend part of the application. The Frontend encompasses all parts of the program that a user interacts with. For example, all #acrpl("GUI") are part of the Frontend.
=== Programming Languages
Following Programming Languages were used in the Frontend.
==== JavaScript
When working on websites, developers have a limited number of technologies they can use, as most Web Browsers only support a small fraction of what is theoretically available. Generally, only three languages are used to create websites: #acr("HTML") for the markup of the general layout of the page, #acr("CSS") for styling elements of a page, and JavaScript to add interactivity to a page.

Of the three, JavaScript is the only one that can be understood as a Programming Language, although it is often referred to as a scripting language. In addition to common features such as Loops, Variables, and #acr("OOP"), it also supports a wide variety of features specifically designed to enhance its usefulness to Web Development, for which it was invented. For example, it is possible to programmatically interact with elements of a #acr("HTML") page by selecting them with `document.querySelector()`. It is then treated as a variable, which can be used to dynamically adjust the element's #acr("CSS") properties to modify its content. The built-in #acr("API") that provides those features is referred to as the #acr("DOM") #acr("API"). The name comes from the fact that a #acr("HTML") document is represented as a logical tree, with each node of said tree representing an element of a page and each underlying node representing its children. @misc-js
==== TypeScript
As valuable as JavaScript is to Web Development, it is also widely considered flawed. One significant aspect often criticized is its lack of a proper typing system. JavaScript uses dynamic typing, meaning a developer does not have to specify a data type when creating a variable. This alone is not the main reason this aspect of the language is often panned, as it is also found in other very popular and widely praised options such as Python. The real reason is that JavaScript is very inconstant in its type-checking behavior. For example, the expression `"5" == 5` checks if the correct value is the same as the left one and returns true, even though the values compared are a string and a number. This is the case because in JavaScript, the common "==" operator does not consider the type of the values. Instead, the developer is forced to use the "===" operator. JavaScript also has so-called truthy and falsy values, where non-boolean expressions such as an empty string are interpreted as false and a non-empty string as true.

All these particularities make it easy to make mistakes when writing JavaScript, which is often quite tricky to debug. This also makes JavaScript unsuitable for larger projects, which is why TypeScript was developed.

TypeScript is a superset of JavaScript, which means that all valid JavaScript code is also valid TypeScript code. TypeScript's main addition is static typing, meaning it makes it possible to define the data type of a variable. However, it is not strictly necessary because TypeScript automatically tries to figure out the type of a variable on creation if it is initialized with a value. It also offers advanced type-checking capabilities and an improved class system. TypeScript also allows for creating advanced types for situations such as when an #acr("API") request returns data consisting of multiple values, which should be stored together. This is achieved by using the `type` keyword. It is similar to an interface, although it cannot directly inherit other types. It also supports many advanced typing features not found on interfaces. @misc-ts

This project uses TypeScript as opposed to regular JavaScript.
=== Frameworks/Libraries
Common web technologies are very useful for smaller applications. As the complexity of an application grows, it becomes increasingly difficult to manage the codebase, which is why several frameworks and libraries were used to simplify the development process.
==== React
When creating larger web applications, using the same elements more than once is widespread. For example, a website could have the feature to enable a dark mode with a toggle on every page. If developed traditionally, this toggle would have to be manually implemented on each page, which might not seem like much work for a small element such as this. However, as the the application scale and the complexity increases, this approach becomes unsustainable. Imagine being tasked to implement the same complex navigation bar on multiple pages. This redundancy not only wastes development time but also creates inconsistencies and makes maintenance of the codebase harder.

However, many libraries and frameworks aim to solve this problem by allowing the developer to create reusable blocks called Components. The most popular solutions are Angular and React, the latter of which is used in this project. Components are self-contained, customizable, and readily interchangeable.

In the previous example, the dark mode toggle becomes a Component that, after it has been implemented once, can be used anywhere. In the case of the navigation bar, where the specific links may change, it is also possible to define the content as props, values that can be passed to a Component similarly to arguments of functions. React utilizes a virtual #acr("DOM"), which is an in-memory representation of the actual #acr("DOM") mentioned in the section about JavaScript. It allows  React to efficiently identify and update only the necessary parts of the #acr("UI") when data changes, leading to faster and smoother user experiences. Components also make it very easy to maintain code down the line. Imagine updating the toggle behavior – you do it in one place, and the change automatically reflects across all instances.

React supports both JavaScript and TypeScript. It allows the developer to write #acr("HTML") markup directly in the JavaScript/TypeScript file using #acr("JSX"). #acr("JSX") also allows for seamless code injection into the markup by wrapping all code to be executed in "{}". @misc-react
==== Vite
One problem that occurs when working with Libraries such as React is that Web Browsers do not natively support them as they only know how to work with #acr("HTML"), #acr("CSS"), and JavaScript, which means that code written in React first has to compiled to technologies understood by Browsers. This step also requires including or bundling in all necessary dependencies. The traditional tool of choice for this task was WebPack, but in recent years, another option, Vite, has increased in popularity.

The main advantage of Vite is that it is much faster than WebPack. Vite achieves this by supporting ES Modules, the official module system for JavaScript, which increases the efficiency of the bundling process because code no longer has to be bundled into a single file, greatly reducing complexity. This also makes it possible for Vite to update only the modules for certain parts of the application since code is bundled into multiple files, making it particularly useful for development, as it decreases reload times when making small changes to code. Vite can also determine if certain parts of code are essential to the application and then remove said code from the bundle, reducing its file size. @misc-vite
==== Chakra UI
When working with React or another Component-based framework/library, it soon becomes evident that many different Components appear on almost every page. A perfect example of such an element would be a Button or even something more complicated, such as a Card or a Dialog/Modal. Additionally, as every Frontend developer knows, it usually takes quite a long time to decide how the page should look and even longer to subsequently define all the necessary #acr("CSS") rules.

Luckily, several packages and extensions aim to reduce the time it takes to implement standard Components and style them. Their way of doing so varies greatly, but Chakra UI, the solution used in this project, approaches this problem by providing the developer with several predefined and styled Components. These range from commonly used elements like the ones mentioned above to more abstract ones like one Component that is a container with the #acr("CSS") flexbox display property. Chakra UI also allows for basic styling of its Components by passing props, and it provides the functionality to easily make the website responsive (usable on smaller screens) and accessible. @misc-chakra The following shows a Button that is inside of a container with flexbox:
```tsx
<Flex justify="center" gap="2px" direction="row">
  <Button colorScheme="green" p="1px">Save</Button>
</Flex>
```
As shown in the example, it is straightforward to work with Chakra UI. Specific props will not be explained here or in the following documentation of the implementation with a few exceptions.

Chakra UI is installed using the #acr("NPM"). It is then required to wrap the main Component in a ChakraProvider Component. Afterwords, Chakra UI can be used anywhere in the application. @misc-chakra
==== React Router <reactRouter>
React alone is often insufficient when working on more complex projects since it lacks any features to declare multiple routes with different pages. There is, however, a library that adds such support called React Router. It offers several different kinds of routers. This project uses a BrowserRouter, where the current location is stored in the Browser's address bar. A BrowserRouter allows the developer to define routes and children routes by adding a path and a Component for the page like this:
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
The main Component must then be wrapped in a Router Component for the routes to work.

In addition to simple routing, React Router also supports more advanced features, such as loaders and actions, as shown in the example above. Loaders allow the developer to define functions that automatically get executed when the Component loads. This is used to load data from an external data source (#acr("API")). Actions, on the other hand, are more complicated. They emulate the standard #acr("HTML") feature, where, when a form is submitted, a #acr("HTTP") request is made. Actions intercept said request and relay the form data to a specifically defined function on a route. There, the data is processed and sent to a Backend Server. If only one action is declared per route, said action is automatically executed on a form submit. Otherwise, the route of the action desired has to be defined on the Form.

React Router also allows for the creation of Links to redirect to another page. Redirecting is also possible as a return value of an action or via a React Hook called `useNavigate()`. @misc-reactrouter Hooks will be explained in the next section.
=== Concepts
The following concepts are vital to understanding the implementation of the Frontend.
==== React Component Types
React offers the ability to create two different types of Components: *Class* Components and *Functional* Components. Class Components are the older way, as they have been available since React was first released. They are JavaScript objects/classes. They allow for the use of Lifecycle Methods, which perform actions at specific stages of the Component's lifecycle (creation, update, deletion). They also allow for the management of the Component state. This means it is possible to store data specific to the Component instance and modify that data at any time. Functional Components, on the other hand, rely on functions for their implementation. When displayed, Functional Components act like a standard function and are executed once. They return  #acr("JSX") markup. Due to that behavior, they do not support Lifecycle Methods and dynamic state management. This made them the less popular option for a long time until Hooks were introduced. Hooks add the previously missing features to Functional Components. The most used Hook by far is the useState Hook. It allows for state management. It is initialized with a value and a setter function. Once the setter function is called, the entire Component gets rerendered with the updated data.
```tsx
const [name, setName] = useState<string>("Simon")
```
In this example, the name is initialized with the value "Simon". The specification of the type is required only when working with TypeScript.

Functional Components are generally preferred nowadays since they require less Boilerplate code and are more performant. They also receive more support than Class Components, which are considered outdated at this point. Another reason for the popularity of Functional Components is that Classes behave very irregularly in JavaScript, which can lead to many bugs. Functions, on the other hand, are considered more reliable. @misc-reactcomponents 

#pagebreak()

= Implementation <implementation>
This chapter of the diploma thesis will cover the practical implementation of the project. It is divided into several chapters, where information about the architecture and code is separated into sections loosely based on the must-goals. It will also contain graphics and images to provide an even better look at the finished product.
== Architecture
Even though the application is run locally, it still relies heavily on technologies commonly found in web development. A major deciding force for employing going this route was that the project is very similar to web applications in not only its concept (all available solutions, which were used as inspirations for this project are web-based) but also its general composition. The reason for this similarity is found in the fact that the application has to be accessible from not only a tutor's PC but from a student's device as well.

This sameness also extends to its general architectural Design, which, like web applications, is divided into a Frontend and a Backend. The former includes all clients and #acrpl("GUI") accessed by students and tutors, and the latter contains a Server, which is responsible for storing and managing Quiz/Game data and for providing access to said data via multiple methods, which are outlined in @architecture-general:
#figure(image("images/architecture/General.jpg"), caption: [General Architecture Overview], kind: "image", supplement: "Figure")<architecture-general>
As seen in the @architecture-general, communication occurs both via #acr("HTTP"), where data is requested by the client and then subsequently provided/mutated/stored by the Server, as well as bidirectional #link(<signalR>)[SignalR] WebSocket connections.
#pagebreak()
=== Backend
#figure(image("images/architecture/Server.jpg"), caption: [Backend Architecture Design], kind: "image", supplement: "Figure")<architecture-backend>
*Logo Reference:*

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  figure(image("images/logos/postgres.png", height: 1.5cm), caption: [#link(<postgres>)[Postgres]@image-postgers], supplement: "Figure", kind: "image"),
  figure(image("images/logos/automapper.png", height: 1.5cm), caption: [#link(<automapper>)[AutoMapper]@image-automapper], supplement: "Figure", kind: "image"),
  figure(image("images/logos/signalr.png", height: 1.5cm), caption: [#link(<signalR>)[SignalR]@image-signalr], supplement: "Figure", kind: "image"),
  figure(image("images/logos/bcrypt.png", height: 1.5cm), caption: [#link(<bcrypt>)[Bcrypt.NET]@image-bcrypt], supplement: "Figure", kind: "image"),
  )

@architecture-backend shows the general composition of the Backend Server application. It is developed in #link(<asp.netcore>)[Asp.NET Core] and thus written with the C\# programming language. It contains all Models, DTOs, Repositories, and Controllers needed to manage the persistent storage of Quizzes and Games, in addition to basic user verification capabilities. All of these components will be explained in detail in their own sections. Information is stored in a PostgreSQL database, which is run as a Docker Container. It is initialized using a `docker-compose.yaml` file:
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

The difference between a `docker-compose.yaml` and a `dockerfile` is that the former is used to run and configure Docker Containers, while the latter is used to do the same for Docker Images. @misc-dockercompose. This is also evident from the code segment above, where an Image that has already been created providing the latest version of PostgreSQL is specified. The only thing left to configure is the username and password for the database. They are still hard-coded here, as the must-goals do not require a more complex solution, but it would be better for larger projects to obfuscate that information. This, however, is outside the scope of this project.

The DbContext shown in @architecture-backend is a class that utilizes Entity Framework Core. It is used to configure what to store in the database and how to do so. Further details will follow in sections describing various Models. At the core of the #link(<asp.netcore>)[Asp.NET Core] project is the `Program.cs` file, which is used for configuration.
=== Frontend
#figure(image("images/architecture/Client.jpg"), caption: [Frontend Architecture Design], kind: "image", supplement: "Figure")<architecture-frontend>
*Logo Reference:*
#figure(image("images/logos/reactrouter.png", height: 1.5cm), caption: [#link(<reactRouter>)[React Router]@image-reactrouter], supplement: "Figure", kind: "image")

The Frontend of the project is a complex React application. It is divided into two main sections, which differ in their implementation and use case. The first one is the Game Pages, which contain all the functionality needed for playing a Game. They are shown in their own section in @architecture-frontend. This part of the application mainly uses SignalR connections to communicate with the Server. The other section is the Quiz Management interfaces, which are entirely used by the tutor. Here, they can create new Quizzes, edit existing ones, or delete Quizzes that are no longer used. These functions are separated into two pages:

- *Root Page:* Default page of the client. Displays all Quizzes and lets the tutor edit, create, delete, or start Games with Quizzes.

- *Edit Quiz Page*: This page is navigated when editing a Quiz. Here, individual Questions and Options are visible and editable.

Deleting and editing Quizzes requires the tutor to enter a password for verification. This segment of the Frontend relies on #acr("HTTP") endpoints for interactions with the Backend, making significant use of React Router loaders and actions to manage data. All code needed to perform requests to the #acr("HTTP") #acr("API") is located in the `endpoints.ts` file, from where it is imported into other parts of the application. All routes needed are defined in the Main Component.
== Quiz Management
A significant part of the planned project was a tutor's ability to manage Quizzes. This includes the creation, editing, and deleting of Quizzes and their containing Questions and Options. The aim was to create user-friendly interfaces to perform these tasks and for the Quizzes to be stored perpetually.
=== Backend
In the Server, this section includes a RESTful #acr("API") providing several endpoints for managing Quizzes.
==== Models/DTOs
In order to properly store data, the creation of multiple Models is required. A Model is a class used as a reference by Entity Framework Core to create #acr("SQL") queries to Initialize tables. Each Model represents one of these tables. This section includes three Models: Quiz, Question, and Option. Of those three, Option is the lowest in their shared hierarchical order as it is part of a Question, which is part of a Quiz. The Option Model includes distinct fields that represent different essential data. The Model itself is created as a regular C\# class:
#code-snippet(caption: "Option Model")[
  ```cs
public class Option
{
  [Key]
  [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
  public Guid OId { get; set; }
  public string OptionText { get; set; } = String.Empty;
  public bool IsCorrect { get; set; } = false;
  public DateTime CreationDate { get; set; } = DateTime.Now.ToUniversalTime();
  public Guid QuestionId { get; set; }
  public Question Question { get; set; }
}
  ```
]
The annotation `[Key]` is used to define the ID of an Option as the primary key, and the line below tells Entity Framework Core to automatically generate a random ID when creating a new entry in the database. The CreationDate is needed for sorting Options. Note that an Option also includes a reference to the Question containing it. This is done by adding fields for the Question ID and the Question itself. Doing so is not strictly necessary when a developer only wants to use a Model in another Model as part of a composition dependency. It is, however, necessary for Entity Framework Core to correctly assign foreign keys in the created database tables. Including both is considered a best practice, although it is not strictly necessary. An interesting fact was, however, discovered when testing several methods of assigning foreign keys as part of the planning stage of this project: Including both a reference to the parent object and its ID is necessary if Entity Framework Core should perform Cascading Deletes (Children of an object are also deleted from the database when said object is deleted. This is useful since it removes the need for the developer to carefully manage the database to prevent no longer used data from being stored.). On the other hand, not including any reference to the containing Model is advantageous when Model data is referenced elsewhere or needed again later. This observation was also made use of when storing Games.

As it was clear from the example given of the Option Model, Models tend not to be very complex as they contain definitions of fields. The Question Model is structured very similarly:
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
  public DateTime CreationDate { get; set; } = DateTime.Now.ToUniversalTime();

  public Guid QuizId { get; set; }
  public Quiz Quiz { get; set; }
}
```
]
There are, however, also several differences that deserve an examination. Line 8 shows the first example of how Models are used within other Models. It is evident from the example given that this is not very difficult to do. They can be used like any Class in #acr("OOP"). The time limit and points are declared nullable by prefixing them with a `?`. This is done because those properties are not set when creating a Question and are added later. The biggest addition to the Question Model is the use of an Enum. An Enum is a set of constants where each keyword is associated with an integer index. They are used when a variable can have multiple predefined states that can be switched between. @misc-enum. The definition for the Question type Enum is done as follows:
#code-snippet(caption: "Question type Enum")[
```cs
public enum QType
{
    SingleChoice, MultipleChoice
}
```
]
SingleChoice is assignable both with the integer: `Qtype[0]` and by using its name: `Qtype.SingleChoice`. The same goes for MultipleChoice. An Enum was used in this case, since it provides more flexibility if new Question types are introduced in the future, and it improves the readability of the code.

The Quiz Model is structured very similarly to the Option Model. It is, however, still crucial to understand the rest of this documentation to know what is defined.
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
  public DateTime CreationDate { get; set; } = DateTime.Now.ToUniversalTime();
}
```
]
Each Model is also mapped to several #acrpl("DTO") to transfer data more efficiently. The #acrpl("DTO") contain the same fields as the Models, although some are omitted as most use cases do not require all data. The mapping is done with AutoMapper, and maps are configured in the `AutoMapperProfile.cs` file. Most maps can simply by letting AutoMapper assign each field of the #acr("DTO") to its corresponding field on the Model and vice versa. Some, however, require the manual assignment of values:
#code-snippet(caption: "Manual AutoMapper assignment")[
```cs
CreateMap<Quiz,QuizDto>().ForMember(dest => dest.QuizId, opt => opt.MapFrom(src => src.QuizId));
CreateMap<Quiz,QuizDto>().ReverseMap().ForMember(dest => dest.QuizId, opt => opt.MapFrom(src => src.QuizId));
```
]
In addition to configuring an AutoMapper Profile, there is another step that is required for the Models to become functional: A DbContext has to be created, which allows Entity Framework Core to work with the Models and allows the developer to store the Model data in the desired database by creating DbSets for each Model. It also allows for data querying by performing #acr("CRUD") operations. The following example shows a simplified version of the DbContext used in this project. It only includes the definition of one DbSet and the needed configuration:
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
The OnConfiguring method is run when a migration is created. A migration has to be created manually each time the Models are updated. They automatically generate code that defines tables and relationships in the database. These are created without manual configuration with one exception. As Enums are only supported by PostgreSQL, they must be manually assigned to the database.

This DbContext must be configured in the main `Program.cs` file. The Connection String, which includes all the information needed to connect to the database (Username, Password), is used to initialize the connection to the database. The String is typically stored in a #acr("JSON"), from where it is imported.
==== Repositories
The next step after creating the needed Models is to declare functions that use said Models and their corresponding database tables to perform specific actions needed on the Frontend. As this project uses the Repository Pattern, the first task of this step is to create Repositories for each Model. Only the Question Repository will be shown in detail since they are all very similar.

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
This is done to create an even more apparent separation between what the code needs (data access functionalities) and how this is achieved (specific implementation using a database or #acr("API")). It is also essential because it allows for greater flexibility when creating the repositories since IRepositories must be included in other parts of the application using Dependency Injection, which is helpful since it allows for the complete replacement of the specific Repository implementation without having to change all other parts of the application and without having to delete the old implementation. Dependency Injection will be explained further in the next section.

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
This function takes an ID of a Question as its argument. This ID is then used to search for the specific Quizzes and the Questions contained within Quizzes in the database. The Question is then removed from the database, and the NQuestions variable, showing how many Questions a Quiz has, is decreased by one. Finally, the modifications are stored by saving the changes in the DbContext. The function is declared as async because interacting with the database includes I/O operations, which can be slow and block the main thread. By making it asynchronous, the function allows other parts of the application to continue running while waiting for the database operation to complete. This means that overall responsiveness and performance are greatly improved. When declared asynchronous, the function return type must be a `Task`. It represents a unit of work that is performed asynchronously. It tells other parts of the program that if awaited, some action will be run in the background, and the program can wait for said action to be completed or continue executing other code while waiting. While not strictly necessary when developing Web #acrpl("API"), asynchronous functions are considered best practice. @misc-async

All other functions in the Question Repository and their equivalents in the Quiz or Option Repositories follow the same pattern as the DeleteQuestion method shown in the code snippet. Thus, they will not be shown here. One thing that has to be mentioned, however, is that not all functions make use of AutoMapper for Model conversion since it is not very easy to use AutoMapper when updating an existing instance of an Entity, meaning that, for example, an already existing Quiz has to be updated with data from a #acr("DTO") while retaining its ID. This is theoretically possible, but it takes a lot of extra configuration, which is too much extra work for a project this size.

In order to work correctly, the Repositories must be registered in the main `Program.cs file`.
==== Controllers
The final step that has to be implemented before the #acr("REST") #acr("API") can be used in the Frontend is the creation of the #acr("API") Controllers. There, specific #acr("HTTP") endpoints are created, which provide an interface for the client to interact with the previously defined Repository methods. As all Controllers (Quiz Controller, Question Controller, Option Controller) are very similar in their implementation, only the Question Controller will be thoroughly explained in this document.

When creating an #acr("API") Controller, the first step is to declare the general route where all endpoints can be accessed. This is done by using the following annotation about the class declaration: `[Route("api/[controller]")]`. The name of the Controller is automatically inserted. The next step is to include all dependencies needed to interact with the data. These might include Repositories, the DbContext, and an AutoMapperProfile. (The Repositories also use this method to inject the DbContext.) The following snippet shows such a configuration. (The snippet has been changed so that the data types of the variables are not shown in the constructor, which is done for space-saving reasons):
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
The dependencies are declared as read-only private variables and then retrieved using Dependency Injection. Dependency Injection is a Design Pattern that states that higher-level components of the application should not be dependent on lower-level ones. Both should only be aware of each other via abstractions. An example of such an abstraction would be the previously discussed IRepositories. These abstractions themselves should also be independent of specific details in their implementations. The two principles are called the Dependency Inversion Principle, which is entirely theoretical. The specific mechanism to apply said principle is called the Inversion of Control, which is used by Dependency Injection. The specific approach used in Controllers is called Constructor Injection since the dependencies to be injected are passed into the constructor. Other methods include Method Injection and Property Injection. After configuring them in `Program.cs`, the Controllers are automatically run with their constructor. @misc-dependency

Specific endpoints can then be created by writing a new function for each endpoint. These functions then use the functionality provided by the Repositories to interact with the database. The following shows how to get all Options from a Question:
#code-snippet(caption: "GetAllOptions Endpoint")[
```cs
[HttpGet("{id}/options")]
public async Task<ActionResult<Option>> GetAllOptions(Guid id)
{
  try{
      var result = _mapper.Map<IEnumerable<OptionDto>>(await _optionRepository.GetOptionsByQuestionId(id));
      return Ok(result);
  } catch (Exception ex)
  {
      return BadRequest(ex.Message);
  }
}
```
]
The annotation defines the specific #acr("HTTP") request method and the route, which would be `/api/Question/ID/options` in this case. In the function itself, a try-catch block is used to automatically return an error message in case something goes wrong. The list of Options is then gathered by using the Option Repository and converting them to an OptionDto using AutoMapper. This list is then sent to the client with a 200 (success) status code.
=== Frontend
On the client, this section includes two pages, which allow the tutor to create and manage Quizzes. The routes for the pages are defined using React Router.
==== Main page
The first page is the main page, also called the index page. It is configured on the default route. Fully loaded, the page looks like this:
#figure(image("images/screenshots/mainPage.png"), caption: [Main Page Screenshot], supplement: "Figure", kind: "image")<mainPage>
The first thing that happens when the page is loaded is loading the Quizzes from the database. This is done using a ReactRouter loader declared on the route. Loaders and actions are defined in their files. There, functions are created for each loader/action. The following loader is used to fetch the Quizzes:
#code-snippet(caption: "Quiz loader Function")[
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
This function has the type `LoaderFunction`, which is provided by ReactRouter. The getQuizzes() method and all other methods containing fetch requests are contained in a separate file called `endpoints.ts`, where the JavaScript fetch #acr("API") is used to make a #acr("HTTP") request to the server. The #acr("URL") constant and all Models are imported from another file:
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
The type has to be created to tell TypeScript which arguments of which types the function takes and what the function's return type is.

The loader can then be used in the Component of the page using the `useDataLoader()` Hook. This Hook is provided by ReactRouter. Once received, the Quizzes are passed as a prop to another Component, where the Quizzes are laid out in Cards with a Grid layout. Each of these Cards, in turn, is its own Component. There, the name and description, as well as the number of Questions, are laid out appealingly. Each Card also contains three Buttons to start a Game, edit a Quiz, and delete a Quiz. Two of these Buttons (Play, Delete) use action functions in order to execute #acr("API") calls. The Edit button redirects to the *Edit Quiz Page*. The Start Game button is defined like so:
#code-snippet(caption: "Start Game Button")[
```tsx
<Form method="post" action={`startgame/${id}`}>
    <Button variant='solid' colorScheme='green' type="submit">
        Play
    </Button>
</Form>
```
]
`variant` and `colorScheme` are Chakra UI styling props. When pressing the other two buttons, the tutor has to verify their identity by entering their password. This, however, is explained later on.

When the tutor wants to create a new Quiz, they have to press the New Quiz Button in the top right corner of the page. When pressed, a dialog opens where they can enter a name and a description:
#figure(image("images/screenshots/createQuiz.png", height: 7cm), caption: [Create Quiz Dialog Screenshot], supplement: "Figure", kind: "image") <createQuiz>
This is implemented using the Modal Component provided by Chakra UI. This Component can be controlled with the `useDisclosure()` Hook. This Hook provides one boolean value and two functions, which are passed as props to the Modal (In this case, the Modal is wrapped in its own Component, so they are passed as a prop of this Component). The value is true if the Modal is open and false if it is closed. The two functions are used to open and close the Modal, respectively.

Inside the Modal, there are two input fields and a submit button, which first makes an #acr("API") call to create a new Quiz and then navigates to the *Edit Quiz Page* of the created Quiz by using the `useNavigate()` Hook. This Hook allows for redirection via code.
==== Edit Quiz Page
This page is used to edit the details of a Quiz. These details include the specific Questions and the Options selectable on each Question. This page also gives the tutor the ability to rename a Quiz itself.
#figure(image("images/screenshots/editQuiz.png", height: 8cm), caption: [Edit Quiz Page], supplement: "Figure", kind: "image")
The page is split up into two sections:

*Sidebar:*

This part of the page is configured as its own Component, which is then included in the Edit Quiz Page. In the main Component of the `editquiz` route, the Questions are loaded via a ReactRouter loader function:
#code-snippet(caption: "Question loader function")[
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
This function first receives the Quiz ID through the #acr("URL") parameters (The route of the Edit Quiz Page is `/editQuiz/quizId`). The first line of the function uses the null coalescing operator to check if the ID from the parameters is not undefined. The null coalescing operator first checks if the value before "??" is null/undefined. If it is not, the correct value is used. If the right value is null, the left value is utilized instead. This seemingly pointless check is needed because even if there is theoretically no chance for the ID to be undefined in TypeScript, the compiler will still throw an error since it does not know that the parameter is a string and not undefined. Next, a standard #acr("API") call is made. The Questions array received through this loader is then passed as a prop to the Sidebar Component. There, the `array.map()` function displays a Link to the Question Details View for each Question. Besides the Question's name, the Link contains two Chakra UI badge Components displaying the Question type and the number of Options. A button used to create a new Question employs a ReactRouter action function. At the bottom of the Sidebar, there are two last buttons.

The second button is fairly simple as it merely contains a Link to the main route of the client. The first one, however, is more complicated as it opens a Modal where the name and the description of the Quiz can be altered. This Modal will not be shown here as it is almost the same as the Create Quiz Dialog. It does, however, contain some interesting code: As the Modal Component needs to know the current Quiz details to populate the standard values of the text boxes, the Quiz's name and description must be loaded first. This seemed rather easy at first since it was assumed in the development process that instead of all Questions, the entire Quiz was loaded in the main Component of the route. This mistake was made because the Edit Quiz details Modal was a late addition to the page made long after the rest. The problem was solved by getting the Quiz ID from the #acr("URL") Parameter, which was difficult since the ReactRouter documentation lacked any explanation on how to perform this task. It was eventually figured out through trial and error:
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
The Quiz ID can be loaded if the name of the #acr("URL") field is specified. Afterwards, the React `useEffect` Hook is used to perform the needed #acr("API"). The useEffect Hook allows the developer to perform side effects within function-based Components. Side effects are actions that need to happen after React has updated the #acr("DOM"), such as fetching data, subscriptions, timers, or directly manipulating the #acr("DOM"). Using useEffect, the developer instructs React to execute specific code passed as a function in its first argument after the Component has been rerendered. The Hook also takes an array as its second argument. This array is used to specify when the code should be executed. This is useful since, otherwise, the function would run every time the Component is rerendered, which happens often in React. If, for example, a state variable is passed as the second argument, the code is only executed if that specific state changes. If an empty array is passed, as in the example given, the function is only called on the first render of the Component. @misc-useeffect

*Question Details View:*

This part of the page encompasses all content to the right of the Sidebar. It can be displayed in two different versions depending on whether or not the Question is merely being viewed (display view) or actively edited (edit view). The views can be switched between by pressing the "Edit" button to start editing and pressing the "Save"/"Cancel" buttons to mark the edit process as complete. Both views use the same underlying Components. The only difference is that all buttons and text fields are enabled in Edit mode, achieved by declaring a boolean prop on the Component and using said prop to manage the state of input fields.

Both views are declared on their own subroutes of `/editquiz/quizId`. The edit view uses the route `/editquiz/quizId/editquestion/questionId` and the display view is available on `/editquiz/quizId/question/questionId`. As it is clear from the fact that the views have their individual #acrpl("URL"), they are separate pages, which means that pressing the Links in the Sidebar would, without additional configuration, redirect to another page containing the display view of the desired Question. To display the contents of the route on the same page as the Sidebar, a ReactRouter Outlet Component needs to be included in the Component of the `editquiz` route. This tells ReactRouter to render the contents of subroutes as part of their parent. Once displayed, individual Questions are loaded using a ReactRouter loader function. When a new Question is created, the edit view is opened automatically. The Questions are always created without any data. The rest of this explanation will focus on the edit view as it requires more attention due to the need to manage the state. Doing so is unnecessary on the display view since the user cannot change any values.

The edit view (and the display view) contains a Component, which contains several input fields (disabled on the display view) for entering data such as the Question name or the time limit, as well as a dropdown list for the Question type. The following shows the input field for the time limit:
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
Its value is set to the time limit loaded with the loader if the Question has a time limit specified. If not, the field is left empty. If the input changes as the tutor enters a number, said number is stored in state to be used in an #acr("API") call to the server, which performs a PATCH Operation to mutate the data of the Question. The plus in front of the expression `event.target.value` converts a string to a number in JavaScript/TypeScript. The Component also features an error message displayed above the input fields if there are empty fields and also causes the save button to be disabled:
#figure(image("images/screenshots/questionError.png", height: 6.5cm), caption: [Error Message Empty Question fields], supplement: "Figure", kind: "image")
This is done by declaring a boolean state, which controls the alert's visibility and the ability to click the button. The variable is then updated using the useEffect Hook to trigger when the state of the input field values changes.
#code-snippet(caption: "Edit Question Error Check")[
```ts
useEffect(() => {
    setEmptyError(name == "" || points == 0 || timeLimit == 0);
}, [name, points, timeLimit])
```
]
Next to the Component for displaying the information about the Question, another one shows all the Options. This Component uses the `array.map()` function to display one Component for each Option, where the Option title can be changed (in the edit view), be marked as correct, or be deleted. As it would be challenging to manage the state of the Options through that many layers of Components, the `useContext()` Hook is used on the main Component of the `editquestion` route. This Hook provides an elegant way to share data across various Components within an application, eliminating the need for "prop drilling" (Passing props through multiple layers). A Context can be thought of as a container that is accessible anywhere within the Component tree. When a Component needs a specific piece of data, useContext allows it to tap into that Context directly, retrieving the current value. In this example, the Hook is used to store all Options in an array of objects. For this, the TypeScript Index signature is used. This allows the developer to define a key for each entry in the array, similar to a dictionary in other languages. The following shows the signature of the state used here: `{ [key: string]: OptionDto; }`. The key in this example is the ID of an Option. Existing Options are loaded into the state as follows:
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
The code uses the `array.reduce()` function with two arguments: the dictionary where all Options should be stored and the Options themselves. The function is then run for every Option to add them to the dictionary. If no Options exist, the dictionary is left empty.

In order to use the Context state in other Components, they have to be wrapped in a Context Provider. This Provider takes the state and SetState functions as arguments. Inside those Components, the Context state can be accessed using the useContext Hook by passing the name of the Context @misc-usecontext:
#code-snippet(caption: "useContext Hook example")[
```ts
const { options: contextOptions } = useContext(OptionsContext);
```
]
In an Option Component, the most complicated problem is determining whether or not the parent Question is SingleChoice or MultipleChoice. If it is the former, additional code is needed to allow only one Option to be correct at one time. The checkbox itself is made with a Chakra UI IconButton Component, which is filled out if the Option is marked correctly. The following code shows how an Option is marked as correct:
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
It first checks whether or not there already is a correct Option. Afterward, it checks if the ID of the current Option is not the ID of the Option that is marked correct and if the current Option is marked as not correct in the state. Finally, it checks the type of the Question. Said type is also provided to the Component with a Context. If all of these conditions are true, an error message is displayed. Otherwise, the state is updated. The Component containing all Options also contains Alerts for when an Option is empty and for the situation where there are not the required 2-6 Options. The Options from the Context state are then combined with the Question data to make an #acr("API") call to the server to save the changes to the Questions/Options.
== Access Control with password
Another must-goal required adding functionality, which allows the tutor to restrict specific actions from being executed without verification, which is necessary since the application is run locally and accessible through the tutor's #acr("IP") address. Without verification, it would be possible for a student to access the page on their personal device and modify data without the tutor's consent. The solution for this problem is a verification system using a password. This means the tutor is not required to provide login data like a username and an email address to use the application.
=== Backend
In the Backend, the password is stored similarly to the Quiz data, which means it is stored in a hashed form in the same database as the rest of the application data. Doing so reduces complexity. A password Model was also created containing an ID set to "1" automatically since there can only be one password and a string for the password hash.

This Model is then used in a dedicated authentication Controller, which provides endpoints for checking if a password is set, registering a password, verifying an entered password, and changing the password set. The following shows the verification endpoint:
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
This code first retrieves the password hash stored in the database. Then, it uses Bcrypt.NET to check whether or not the password passed in the Body and the stored one corresponding to the hash in the database are the same. If they are, a #acr("HTTP") response with the status code 200 (success) is sent. If they are not, the server sends a response with the status code 401 (unauthorized). The endpoint to change the password is similar, with the only difference being that in addition to sending a 200 status code, the server also updates the password hash on the database. The other two endpoints are also structured very similarly. Thus, they will be omitted in this documentation.
=== Frontend
For the password verification to be helpful to the tutor, the previously described endpoints must be used in the Frontend.

When first loading the main page of the React application, the endpoint providing information, whether or not a password is set, is accessed using the `useEffect()` Hook. If no password is set, a red "Register" button is displayed next to the "New Quiz" button on the top of the page. If, however, a password has already been set and the corresponding hashed string is found in the database, the button is replaced with a green one, allowing the tutor to change the password. The latter is shown in @mainPage. Both buttons, when clicked, open their own Modals/Dialogs (contained in separate Components), where input fields are provided for the necessary data. They are laid out almost identically to the Modal shown in @createQuiz.

On the other hand, the Modal used for verification is more involved in its implementation, the reason for this being the necessity to execute particular code or redirect to other pages on a successful verification attempt. To be more precise, verification is needed when trying to edit or delete a Quiz. It would be trivial if React provided a way to freeze all other Components until verification is complete. This way, using the Component like a JavaScript Dialog on a simple #acr("HTML") page would be possible. However, this requires a lot of extra code, which could even include the manual implementation of a custom Hook. Thus, this approach was abandoned.

The easier solution, which was eventually discovered, is that passing a function as a prop to the Modal Component is feasible, which would then be executed on a successful password entry. This works very well when redirecting to the Edit Quiz Page since this only requires a change of route, which is easily done with the following function:
#code-snippet(caption: "redirect to Edit Quiz Page function")[
```ts
const onVerificationSuccessEdit = () => {
    navigate(`editquiz/${id}`);
}
```
]
A problem arises when applying the same approach to deleting Quizzes, which uses a ReactRouter action function. There is no real way to run an action via code. It is possible to redirect to the route of the action, but doing so merely loads the corresponding page. In this case, the `deletequiz` route does not have a page, so an error occurs. There is, however, a way in React to submit a form using code instead of a submit button, which includes using the `useRef()` Hook. The core concept behind this Hook can easily be explained using its name: It provides a reference to some value or object. It can also be used to store the state itself. The difference between this Hook and the `useState()` Hook is that a change of the state or referenced data does not cause the Component to rerender. Another distinction of the `useRef()` Hook is how the state is accessed or mutated. Other than the `useState()` Hook, it does not use a function to update the state, as this would trigger a reload of the Component. Instead, it stores the value in a mutable object, which can be accessed or changed using its `value.current` property. This Hook also allows the developer to reference elements in #acr("JSX"). @misc-useref

The first thing that was attempted in this project was to create a reference to the form and to submit the form via that reference like so:
#code-snippet(caption: "useRef Hook attempt with Form")[
```tsx
const deleteRef = useRef<HTMLFormElement>(null);

const onVerificationSuccessDelete = () => {
    deleteRef.current?.submit();
};

<Form method="DELETE" action={`deletequiz/${id}`} ref={deleteRef}>
```
]
Note that this code has been condensed and is not executable in its current state, which should work, but it does not. Even after several hours of research, reading the React documentation, and studying the behavior of submitting a Form in JavaScript, no explanation for this oddity could be found. The most likely problem is that ReactRouter does not support calling an action without a submit button. The solution, which was eventually developed, is to create a button in the form that is not visible to the tutor. This button is then referenced and clicked via code. This solution is not optimal, but since the underlying problem is likely due to a bug in a library, it remains the most elegant way to fix this problem.
#code-snippet(caption: "useRef successful attempt with invisible button")[
```tsx
const deleteBtnRef = useRef<HTMLButtonElement>(null);

const onVerificationSuccessDelete = () => {
    deleteBtnRef.current?.click();
};

<Button type="submit" display={"none"} ref={deleteBtnRef}></Button>
```
]
== Game Flow
The last central area to explore in the implementation section is the logic behind the Game itself. While also making use of a small #acr("REST") #acr("API"), the majority of the communication between the various participants in a Game is handled with SignalR. Said communication is handled via a series of messages, which occur throughout the different stages of a Game. The following sequence diagram shows all messages in the chronological order they occur in. Details about the implementations of specific messages will be shown further down in this section.
#figure(image("images/architecture/gameFlow.svg", height: 18cm), caption: [Game Flow Sequence Diagram], supplement: "Figure", kind: "image")
=== Models/DTOs
Similar to the Quiz data, information about Games is also stored in Models and transmitted using #acrpl("DTO"). To be specific, two new Models were required to structure the necessary data properly.

The first of these is a Model for a Player of a Game. Its general composition is not that different from the Models shown in the Quiz Management section. One potentially noteworthy aspect is that the icon of a Player is not a custom image, as is the case with competing Quiz Game solutions. Instead, a string is used to store an Emoji as the icon, which is possible since they are no different from other Unicode characters. Doing so makes the application more versatile as it does not rely on a third-party library.
#code-snippet(caption: "Player Model")[
```cs
public class Player
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public Guid PlayerId { get; set; }
    public string Name { get; set; }
    public string Icon { get; set; }
    public int Score { get; set; } = 0;

    public Guid GameId { get; set; }
    public Game Game { get; set; }
}
```
]

The Player Model is then included in the larger Game Model. It also includes a Quiz, but other than the previous times a Model was made part of another, the Quiz Model does not contain any reference to the Game Model. By doing this, cascading delete is not triggered when removing a Game from the database, which makes it possible to play multiple Games with the same Quiz. The Players are, however, still deleted.
#code-snippet(caption: "Game Model")[
```cs
 public class Game
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public Guid GameId { get; set; }
    public List<Player> Players { get; set; } = new List<Player>();
    public Quiz Quiz { get; set; }
}
```
]
Various #acrpl("DTO") were also created for these Models.
=== Controller/Repositories
Even though the Game functionality is mainly centered around real-time communication requiring SignalR, certain pieces of functionality can also be performed with a #acr("HTTP") #acr("API"). Thus, a separate Controller was created for the Game. The two main ways this Controller is used are to create and delete a Game once it is finished. These endpoints are almost identical to their counterparts in the Quiz, Question, or Option Controllers. Thus, they will not be shown here to prevent the spotlighting of duplicate code.

Repositories were also implemented for both the Game and the Player Models. They are used both in the Game Controller and the Game Hub. The repos provide basic functionality for interacting with Games/Players by, for example, adding a Player to a Game or increasing the Player's score.
=== Initialize/Join Game
The first thing a tutor has to do to provide a Game for their students to play is select a Quiz for the Game, which is done on the main page (@mainPage) by pressing the "Play" button on a Quiz Card. This then makes an #acr("API") call to the server, where a new Game is created in the Game Controller. Subsequently, the tutor is redirected to the Waiting Room page. A link is displayed for the page where students can join the Game. This link is `location.hostname` browser property.
#figure(image("images/screenshots/waitingRoom.png"), caption: [Game Waiting Room], supplement: "Figure", kind: "image")
Once started, Players can join a Game immediately. They can do so by navigating to the application's `/play` route. There, they are met with an opened Modal where they can enter their name and select their preferred Emoji as an icon. This is done using a predefined Emoji picker Component, which is available on the #acr("NPM") and installed using the command `npm i emoji-mart`.
#code-snippet(caption: "Emoji Picker Component")[
```tsx
 <Picker theme="light" data={Data} onEmojiSelect={(event: { native: SetStateAction<string>; }) => {
    setIcon(event.native);
    setPickerVisible(!isPickerVisible);
}} />
```
]
Once selected, the local state of the icon is changed, and the Picker is not visible. If both a name and icon have been selected, the Player can join the Game. Before that, a connection to the Game Hub has to be created. In the case of the join Game page, this connection is declared with the `useRef()` Hook. Doing so is necessary since a state change, and thus a Component rerender, is triggered every time the Player enters a new character in a text field, which would cause the connection to be restarted each time this occurs.
#code-snippet(caption: "Start Connection to Hub in Frontend")[
```ts
useEffect(() => {
    connection.current = new signalR.HubConnectionBuilder()
        .withUrl(`${sURL}/Game`)
        .build();

    connection.current.start()
        .then(() => console.log('Connection started!'))
        .catch(() => console.log('Error while establishing connection :('));

    return () => {
        if (connection.current) {
            connection.current.stop()
                .then(() => console.log('Connection stopped!'))
                .catch(() => console.log('Error while stopping connection :('));
        }
    };
}, []);
```
]
This is done inside the `useEffect()` Hook to make the connection available as soon as the Component loads. First, the connection is created, and messages are subsequently outputted to the browser console on a successful connection or a failure. The return statement of the `useEffect()` Hook is simply executed when the Component is unloaded, meaning when the page is changed, which is done to dispose of the connection before bugs can occur.

If the connection is started correctly and no error appears, the Player can join the Game by simply pressing the "Join" button. This button then sends a message to the server. The following closes the Model.
#code-snippet(caption: "Join Game Message")[
```tsx
 connection.current.invoke("RegisterPlayer", dto)
.then(() => {
    onClose();
})
.catch(err => console.error(err));
```
]
Once a Player is added to the Game, the Hubs send a message to said Player containing their ID. At the same time, the Player is stored in the database. If no Game is open for joining, the Player will receive an error message saying so. There are many options available to send individualized messages to Players. The one chosen for this project is to add the Player's connection ID, which is unique to each connection created to the Hub. In said group, the connection ID and the Player ID are associated. This is necessary since the connection ID of a Player changes once they are redirected to a new page. There, the new connection ID has to be added to the group, and the Player can continue to receive messages.
#code-snippet(caption: "Player Registration on Server")[
```cs
 public async Task RegisterPlayer(CreatePlayerDto dto)
{
    await Console.Out.WriteLineAsync(_currentQuestionIndex.ToString());
    if (_currentQuestionIndex == 0 && _game != null)
    {
      Player createdPlayer = await _playerRepositoryCreatePlayer(dto);
      await _gameRepository.AddPlayer(createdPlayer);

      await Groups.AddToGroupAsync(Context.ConnectionId,
      createdPlayer.PlayerId.ToString());

      await Clients.All.SendAsync("playerAdded", _mapper
      Map<PlayerDto>(createdPlayer));

      await Clients.Group(createdPlayer.PlayerId.ToString())
      .SendAsync( "addedYou", createdPlayer.PlayerId);
    }
    else
    {
      await Clients.Client(Context.ConnectionId).SendAsync("gameRunning");
    }
}
```
]
Messages can be received by the client by creating listeners for specific messages. The following one listens to the "addedYou" message and stores the Player's ID in LocalStorage. From there, it can be accessed whenever it is required, for example, when submitting an answer.
#code-snippet(caption: "Message listener")[
```ts
connection.current.on("addedYou", (id: string) => {
    localStorage.setItem('playerId', id);
})
```
]
At the same time, another message is sent to all clients. This message is listened to in the Waiting Room and is used to display new Players as they join automatically.
=== Gameplay
As soon as all students have joined, the tutor can start the Game by pressing the "Start Game" button on the Waiting Room page, which sends the "StartGame" message to the SignalR Hub on the server. There, the first Question is sent to all clients. This is done separately from the StartGame function since sending Questions is not just required when starting the Game. On the tutor's computer, which screen is projected to a projection screen or shown on a digital whiteboard, a redirection to the page of the `/gameTeacher` route occurs. There, all relevant information about the Question is displayed straightforwardly:
#figure(image("images/screenshots/gameTutor.png", height: 8.5cm), caption: [Game Teacher View], supplement: "Figure", kind: "image")
The top part of the page features a pleasing gradient background with multiple Cards for important information. On the first Card, the timer is displayed. It continuously goes down until it reaches zero, at which point the Question is closed for answering. Further detail on the implementation of the timer in the Frontend and Backend will follow further down this section since it requires further information to be comprehended in its entirety. Next to the timer, the name of the Question is displayed. The last two Cards display the points received if the correct Option or Options are selected and a button to advance to the next Question, respectively. The bottom part of the page features the individual Options displayed in a grid layout. The colors shown are predefined in an array and assigned to the Cards using a previously unknown feature of the `array.map()` function. As previously explained, this function allows for an action to be performed on each element of an array, which is used here to display a Card for each Option. This has already been done similarly in the Sidebar on the Edit Quiz page. The new functionality used here allows the developer to define an incrementing number similar to a for loop. This number is then used to select the correct color from the colors array.

On the Player side, the student is redirected to the page of the `/gameStudent` route. There, a different layout is displayed depending on whether the Question is single or multiple-choice. The difference between the two is that Options are selected and submitted via a separate button on a multiple-choice Question. The styling of the Options is also different. This page also features a mobile-friendly responsive design, as it is likely that a student might want to play on their phone instead of a laptop or computer.
#grid(
  columns: (1fr, 1fr),
  figure(image("images/screenshots/gamePlayerSingle.png", height: 6.5cm), caption: [Game Student View Single Choice], supplement: "Figure", kind: "image"),
  figure(image("images/screenshots/gamePlayerMulti.png", height: 6.5cm), caption: [Game Student View Multi Choice], supplement: "Figure", kind: "image"),
  )
The way answers are submitted differs slightly between the two. Both rely on the same function to send the IDs of selected Options to the Hub alongside the Player ID stored in LocalStorage, which is done comparably to any other SignalR message described until now. The two differ in how this function is used. In a single-choice Question, each Option contains a click event handler, which runs this function with the ID of the Option as an argument:
#code-snippet(caption: "Submit single Answer")[
```ts
 const submitSingle = (event: React.MouseEvent<HTMLButtonElement>, id: string) => {
        event.preventDefault();
        sendToHub([id]);
    }
```
]
Even though only a single ID needs to be sent to the Hub, an array is still used to make the sendToHub function usable for both use cases. On the Backend, the sent IDs are used to create a list of Options. This list is then checked, and if all Options are correct, the player's score is updated. If the Options are part of a multiple-choice Question, the IDs are added to an array and submitted via a submit button.
#code-snippet(caption: "Submit multiple Answers")[
```ts
const selectMulti = (event: React.MouseEvent<HTMLButtonElement>, id: string) => {
    event.preventDefault();
    multiIds.includes(id) ? 
    setMultiIds([...multiIds.filter((m) => m != id)]) :
    setMultiIds([...multiIds, id]);
}
```
]
This function first checks if the ID has already been added to the array. If it has, it is removed by filtering the array. Otherwise, it is simply added. This is done to allow for an Option to be both selectable and deselectable.

Once all Players have submitted an answer, the tutor can press the "Next Question" button in the top portion of the teacher view. A message is then sent to the Hub requesting the scores of the students, which leads to the following function being called:
#code-snippet(caption: "Request Scores function")[
```cs
 public async Task RequestScores()
{
  _game.Players = await _context.Players.ToListAsync();

  var playersWithScore = _game.Players.Where(p => p.Score > 0).ToList();
  var topPlayers = playersWithScore.Count < 3
      ? playersWithScore.Concat(_game.Players.Except(playersWithScore)
      .OrderBy(p => Guid.NewGuid()).Take(3 - playersWithScore.Count)).ToList()
      : playersWithScore.OrderByDescending(p => p.Score).Take(3).ToList();

  await _hubContext.Clients.All.SendAsync("topPlayers", topPlayers);

  foreach (Player player in _game.Players)
  {
      await _hubContext.Clients.Group(player.PlayerId.ToString())
      .SendAsync("resultReceived", player.Score);
  }
}
```
]
This function uses a hubContext instead of sending messages normally, which is necessary since it is executed once the timer has run out. In that case, the current instance of the Hub at the time of the timer creation is no longer active once it reaches zero. This is due to a Hub having a very short lifecycle as it is often disposed of and then created again to improve memory usage. The hubContext is needed because it allows access to the Hub anytime. The way it is used here is not intended as it is usually used outside a Hub, but its characteristics also make it ideal for this use case. The line `_game.Players = await _context.Players.ToListAsync();` fetches the latest list of Players from the database and assigns it to `_game.Players`, which is done to ensure that `_game.Players` always contains the most up-to-date data from the database.

Next, a list of the top three Players is created. First, all Players who have a score greater than zero are added to a list. This list is then sorted by score, and the three best students are selected. If there are fewer than three Players with a score, the list is extended by adding as many scoreless Players as needed to reach three again. After that, the list is sent to the tutor's computer, where a Modal is shown with a table showing its data:
#figure(image("images/screenshots/results.png"), caption: [Top three Players], supplement: "Figure", kind: "image")
Each Player also receives their current score via a Modal. The student is also informed whether or not the Question has been answered correctly by storing each score received in an array and comparing the last two scores. If they are identical, a mistake was made when answering. The tutor can then advance to the next Question by pressing the button in the Modal, at which point the server sends the new data to the clients where the contents of the pages are updated.

*Timer*

The timer was first created using the Hub's `SartGame()` method. There, the time limit of the first Question is assigned to it, and the `RequestScores()` function is designated to be executed when the timer runs out. The timer is simulated on the Frontend using the `useEffect()` Hook.
#code-snippet(caption: "Timer Frontend")[
```ts
 useEffect(() => {
        let interval: number = 0;
        if (timerActive && timerSeconds > 0) {
            interval = setInterval(() => {
                setTimerSeconds((timerSeconds) => timerSeconds - 1);
            }, 1000);
        } else if (!timerActive && timerSeconds != 0) {
            clearInterval(interval);
        }
        return () => clearInterval(interval);
    }, [timerActive, timerSeconds]);
```
]
The Hook takes a function and an array of dependencies (`timerActive` and `timerSeconds`) as arguments. The function inside the Hook is executed every time one of the dependencies changes.

In this function, an interval is set up to decrement `timerSeconds` by one every second, but only if the timer is active and has not yet reached zero. If the timer is inactive and `timerSeconds` is not 0, the interval is cleared, effectively pausing the timer. The return statement clears the interval, ensuring the timer stops when the Component is unmounted or before it updates, which prevents potential memory leaks.

Back on the server side, the timer is stopped when the scores are requested and starts again with the new time limit of the next Question.
=== End Game
After the last Question of a Quiz has been reached and the tutor has clicked the "Next Question" button in the Modal, the server sends a list of all Players sorted by their score, which is then displayed on a new route.
#figure(image("images/screenshots/scoreboard.png"), caption: [Scoreboard], supplement: "Figure", kind: "image")
While this process works, an error occurs because the tutor's client still tries to request a new Question. The most interesting part of this problem is when it occurs: The error message is displayed long after the redirection to the scoreboard has already taken place. Due to this, it is very likely that the reason lies within the way React dismounts its Components. Somehow, this process seems to send a redundant message to the Hub. While certainly not ideal, this error was ignored because it does not affect the flow of the Game itself.

Finally, the tutor has to press the "Return to Menu" button, which sends a message to the server requesting that the Game be deleted from the database. Once this is done, the server sends a confirmation back, and the tutor is redirected to the main page, where they can either edit a Question, create a new one, or play another Game.
#pagebreak()

= Conclusion
The implementation of the must-goals, with the exception of a few bug fixes, was completed on February 7, 2024. It took approximately 110 hours of time entirely spent on coding. The planning and research were completed in about 40 hours, and the documentation was written in another 40 hours. In total, the project required 190 hours to complete.

As previously alluded to, all must-goals were completed. However, no should-goals were completed because of time constraints.
== Results
The results of this diploma thesis are presented and explained below.
=== Backend
The project offers a high-performing and well designed server, which provides both a highly useful #acr("REST") #acr("API") for the seamless management of Quizzes and their underlying Questions and a responsive SignalR Hub used to ensure real-time communication between clients during a game. Both components provide outstanding security and efficiency thanks to the robust ecosystem of ASP.NET Core. Data is persistently stored in a database and represented in well-structured Models, enhancing code readability and making it more readable.

Overall, the project's Backend development proved more efficient and streamlined than anticipated. The implementation of the SignalR Hub was completed incredibly quickly, as it had been assumed that it would be the most complicated section of the whole project at the start. In reality, SignalR was easier to work with than anticipated when starting the project.

The #acr("REST") #acr("API") development progressed smoothly due to clear RESTful design principles, resulting in an intuitive and easy-to-understand #acr("API"). While Entity Framework Core with PostgreSQL was chosen for the database needs, the Enum configuration required additional research. This minor hurdle did not significantly impact the development timeline. Data is also transferred using well-desired #acrpl("DTO") powered by the powerful yet easy-to-use tool AutoMapper. They ensure that the data transfer between the client and the server is done in an efficient and logical manner.

A minor challenge arose when the initial #acr("API") design was not fully #acr("REST") compliant, necessitating a complete redesign, which proved to be a valuable learning experience, leading to improved #acr("API") design skills.

The server additionally offers a simple yet effective #acr("API") for adding passwords, securely hashed with Bcrypt.NET and stored in the database. A verification mechanism ensures authorized user access to specific functionalities, adding an extra security layer and protecting data integrity.

Overall, the application boasts a robust, efficient, and secure Backend, providing a solid foundation for a smooth and enjoyable user experience.
=== Frontend
In addition to the previously described server, the application also provides several #acr("GUI") pages, which are pleasing to the eye thanks to the well-designed but still very functional Components from Chakra UI. They are also highly user-friendly, allowing even inexperienced tutors to create engaging Quizzes without hassle. It also includes a design for the player pages, which is remarkably versatile as it is styled to look and function well on full-sized desktop monitors and small smartphones. The fact that the Frontend is implemented entirely with web technologies also makes it not only efficient but also cross-platform. Additionally, the tutor has the ability to set a password to protect their precious Quizzes from meddling students, which is an excellent addition to classroom use.

The implementation of the Frontend went significantly less smoothly than the Backend implementation. A significant factor for the unexpected complexity was the need for an extensive state management solution for the Edit Quiz page to achieve a great layout. Initially, it had not been anticipated that this would need as many complicated Components as it ended up needing. It also had to be rewritten due to the initial implementation not meeting the high standards set for this project. An enormous breakthrough occurred when the `useContext()` Hook was first used. After this, everything fell right into place and resulted in a well-designed and intuitive page, which, as a whole, represents the best this application has to offer.

Consequential delays in the development process also occurred when implementing the Game pages as they needed the highest amounts of polish in the entire Frontend due to being interacted with by both students and tutors. However, this effort paid off thanks to the great design and ease of use provided by the pages in their current state.
== Potential future additions
In its current state, the project already offers a feature-rich Quiz application with a great user-friendly design. The connection between the Frontend and the Backend works without significant errors, and the experience of playing a game Game is very enriching and informative thanks to the ability to create exciting Quizzes.

Even though all must-goals were completed, there is still room for improvements, including containerizing the application with Docker, making it even more versatile. Additionally, minor bugs and other small problems could be ironed out. Finally, the ability to export and import Quizzes could help build a community and foster the spirit of learning within everyone willing to expand their horizons.

#pagebreak()

#bibliography("references.bib")

#show outline: set heading(outlined: true)

#outline(
  title: [Code Listings],
  target: figure.where(kind: "code"),
)

#outline(
  title: [Image Listings],
  target: figure.where(kind: "image"),
)
