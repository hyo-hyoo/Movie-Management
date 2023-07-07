# 电影管理系统|(小组合作)
## 1、项目简介
本项目名叫DogeMovie，分为用户端和管理端，下面是对这两个系统的大致介绍。
* **用户端:**
用户端主要提供购票服务，大致分为以下的部分：

* **管理端:**
DogeMovie项目的后台管理系统分为用户管理、电影管理、演职人员管理、影院管理、场次管理、订单管理、评论管理等七个子系统。管理员经过登录验证后可以在后台管理页面对用户信息、电影信息、订单信息等各项信息进行查看、增加、删除或修改操作。各个子系统应功能全面、页面简洁，便于管理员对各项数据进行操作，来保证在线购票系统信息的实时性和正确性，满足用户和管理员的各种需求。
## 2、开发工具与技术
> 开发工具：Eclipse、MySQL、Git、Postman
> 项目技术：Spring + SpringMVC + MyBatis


## 3、页面介绍
### 用户端
用户端的页面效果和功能在GIF图中展示：


### 管理端
（1）	用户管理页面：在此页面中，管理员可查看用户的基本信息，并对用户信息进行修改、删除等操作。

（2）	电影管理页面：在此页面中，管理员可对电影信息进行管理，可对电影进行增删改查操作，也可修改电影状态，使其上映或下架。其中电影的信息页包含了演职人员及电影图集，仅可进行添加和删除操作。

（3）	演职人员管理页面：在此页面中，仅存有演职人员的姓名与图片，管理员可对演职人员信息进行添加、删除以及编辑图片操作。

（4）	影院管理页面：该功能为一个嵌套管理系统，影院管理下设影厅管理，影厅管理下设场次管理。在此页面中，管理员可对影院信息进行增删改查，点击每个影院对应的影厅管理后，可对影院下设的影厅进行管理，再进一步对影厅所有的场次进行增删改操作。

（5）	订单管理页面：在此页面中，管理员可查看订单信息。

（6）	评论管理页面：在此页面中，管理员可查看评论信息。