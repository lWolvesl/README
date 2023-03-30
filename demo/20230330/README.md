# Cinema

- 启动顺序 `后端`>>`前端`

[Cinema](#cinema)

- [1、后端](#1%E5%90%8E%E7%AB%AF)
  - [1.1 结构](#11-%E7%BB%93%E6%9E%84)
    - [1.1.1 `admin`模块](#111-admin%E6%A8%A1%E5%9D%97)
    - [1.1.2 `common`模块](#112-common%E6%A8%A1%E5%9D%97)
    - [1.1.3 `framework`模块](#113-framework%E6%A8%A1%E5%9D%97)
    - [1.1.4 `system`模块](#114-system%E6%A8%A1%E5%9D%97)
  - [1.2 启动](#12-%E5%90%AF%E5%8A%A8)
- [2、前端](#2%E5%89%8D%E7%AB%AF)
  - [2.1 Panda-user](#21-panda-user)
    - [2.1.1 启动](#211-%E5%90%AF%E5%8A%A8)
  - [2.2 Panda-ui](#22-panda-ui)
    - [2.2.1 启动](#221-%E5%90%AF%E5%8A%A8)

## 1、后端

### 1.1 结构

![image-20230330133301035](http://cos.wolves.top/img/202303301333208_repeat_1680154381391__744279.png)

#### 1.1.1 `admin`模块

- 主要负责整个系统的启动和系统基础配置以及管理员和用户交互模块![](http://cos.wolves.top/img/202303301336617_repeat_1680154590719__195005.png)
- `resources`中的`application.yml`和`application-druid.yml`为系统的基础配置
- `application-druid.yml`中主要为配置连接池，主要修改的位置为![image-20230330133817223](http://cos.wolves.top/img/202303301338250_repeat_1680154697349__396605.png)中的`url`，`username`，`password`，你需要根据自己的`mysql`配置相应部位，其中![image-20230330134017706](http://cos.wolves.top/img/202303301340745_repeat_1680154817827__471845.png)`localhost:3306`为你的数据库的`ip`+`端口`，`movie`为使用的某个数据库，其他内动非必要不需更改

#### 1.1.2 `common`模块

- 此模块主要负责应用，包括了文件上传管理、分页器、前端交互等

#### 1.1.3 `framework`模块

- 此模块主要为整合各个模块，提供了与JWT以及自定义的异常类

#### 1.1.4 `system`模块

- 此模块的主要功能是负责用户的数据交互，储存了实体以及数据库sql（主要使用的是mybatis）

### 1.2 启动

- 启动类位于`admin`模块![image-20230330134652874](http://cos.wolves.top/img/202303301346910_repeat_1680155213089__835627.png)
- 此文件中定义了`SpringBoot`的启动类![](http://cos.wolves.top/img/202303301347530_repeat_1680155245604__110526.png)

## 2、前端

- 前端分为两个模块![image-20230330134809100](http://cos.wolves.top/img/202303301348131_repeat_1680155289203__152698.png)分别为用户模块和管理员模块,均采用了`Vue`+`element ui plus`编写，前后端交互数据均采用`axios`

### 2.1 Panda-user

#### 2.1.1 启动

![image-20230330135115778](http://cos.wolves.top/img/202303301351820_repeat_1680155475909__609961.png)

- 控制台输入`npm run serve`即可开启用户端
- 用户登陆需要提前在管理员端注册，管理员账户不能登陆用户端

### 2.2 Panda-ui

#### 2.2.1 启动

![image-20230330135115778](http://cos.wolves.top/img/202303301351820_repeat_1680155475909__609961.png)

- 控制台输入`npm run serve`即可开启管理员端

- 管理员端的默认账户和密码为![image-20230330135358740](http://cos.wolves.top/img/202303301353779_repeat_1680155638870__712724.png)