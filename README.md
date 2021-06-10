# WanGiao 
这是一款用Flutter开发的学习App，主要数据api来自[WanAndroid](https://wanandroid.com/blog/show/2)。

<img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/175903_f5e3431e_1008291.png"/><img width="300" height="600" src="https://images.gitee.com/uploads/images/2021/0610/173147_09762ed8_1008291.png"/><img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/173341_133a5032_1008291.png"/><img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/173348_2762e827_1008291.png"/><img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/173400_cab2075c_1008291.png"/><img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/173411_455b09ac_1008291.png"/><img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/173421_8f8c9dde_1008291.png"/><img width="360" height="640" src="https://images.gitee.com/uploads/images/2021/0610/175737_92b94ecc_1008291.png"/>

## 前言
学习Flutter也有一段时间了，开发这款App也是系统的使用一些Flutter知识。

## Flutter基础
1. 因为Flutter需要用到Dart语言，所以如果要开发Flutter应用需要先了解一下Dart的基本语法和特点，根据位学习下来的情况，其实和java有一些类似，如果有java基础的话，学习起来会容易一些。
2. 因为Flutter的应用不像传统的Android项目布局文件是xml形式的，更像google新推出的jectpack compose，是一种声明式的UI，而且是一种树形结构的写法，一开始可能会不习惯，多写一些代码就好了。Flutter基础学习的话可以看看[Flutter](https://flutterchina.club/get-started/install/)。

## 开发中使用到框架
1.[Getx](https://pub.dev/packages/get) 
项目中的状态管理和路由管理都是使用。GetX集成了状态管理，路由管理，依赖注入，使用GetX可以大大减少页面使用StatefulWidget和setState()的使用，可以做到哪里需要刷新就刷新哪里，更加直观，很类似于Android中的LiveData，数据驱动页面刷新。

2. [Dio](https://pub.dev/packages/dio)
一个App肯定少不了网络交互，这里我使用的是Dio，项目中我进行了二次封装，更好的统一处理返回数据和错误异常提示。

