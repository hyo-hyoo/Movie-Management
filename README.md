# Movie Management System|(Group Work)
[电影管理系统-中文介绍](https://github.com/hyo-hyoo/Movie-Management/blob/master/README-CN.md)

## 1、Project Introduction
The project is called DogeMovie and consists of two systems: the user-side and the admin-side. Here is a brief introduction to these two systems.
* **User-side**  
  The user-side system of DogeMovie is designed to provide an enjoyable movie-watching experience for users. It offers features such as browsing and searching for movies, viewing movie details, managing user profiles, and interacting with other users through ratings and reviews.	The system also provides a movie ticket purchasing feature. The complete process for users to purchase tickets is illustrated in the following diagram:  
  ![001](/img/001_EN.png)
* **Admin-side**  
  DogeMovie项目的后台管理系统分为用户管理、电影管理、演职人员管理、影院管理、场次管理、订单管理、评论管理等七个子系统。管理员经过登录验证后可以在后台管理页面对用户信息、电影信息、订单信息等各项信息进行查看、增加、删除或修改操作。各个子系统应功能全面、页面简洁，便于管理员对各项数据进行操作，来保证在线购票系统信息的实时性和正确性，满足用户和管理员的各种需求。

## 2、Development Tools and Technologies
> Development Tools: Eclipse、MySQL、Git、Postman  
> Project technologies: Spring + SpringMVC + MyBatis


## 3、Page Introduction
### User-side
The visual effects and functionalities of the user-side pages are showcased in a GIF animation:  


### Admin-side
（1）	User Management Page: On this page, the administrator can view users' basic information and perform operations such as modifying or deleting user information.  
![003](/img/003.png)
![004](/img/004.png)    
（2）	Movie Management Page: On this page, the administrator can manage movie information. They can perform operations such as adding, deleting, modifying, and searching movies. Additionally, the administrator can modify the status of movies to make them either available or unavailable for screening. The movie information page includes details about the cast and crew, as well as a gallery of movie images, which can only be added or deleted.  
![005](/img/005.png)
![006](/img/006.png)

（3）	Cast and Crew Management Page: On this page, only the names and pictures of the cast and crew members are stored. The administrator can add, delete, and edit the pictures of the cast and crew members.
![007](/img/007.png)

（4）	Cinema Management Page: This feature is a nested management system where cinema management includes hall management, and hall management includes showtime management. On this page, the administrator can perform operations such as adding, deleting, modifying, and searching cinema information. By clicking on the hall management for each cinema, the administrator can manage the halls associated with that cinema. Further, they can perform operations such as adding, deleting, and modifying showtimes for each hall.  
![008](/img/008.png)
![009](/img/009.png)
![010](/img/010.png)

（5）	Order Management Page: On this page, the administrator can view order information.
![011](/img/011.png)

（6）	Review Management Page: On this page, the administrator can view review information.
![012](/img/012.png)