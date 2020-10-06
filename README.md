# Game-Account-Transaction-WebSite

## 主要功能
- 用户管理
- 订单管理
- 游戏管理
- 售后管理
- 浏览

## 需求分析
本系统可实现游戏账号买卖信息查询、历史订单查询等功能。
- 对于买家：账号关键词搜索匹配，买操作，退货，评价，留言
- 对于卖家：账号信息批量导入，卖操作，退货，售后，留言
- 对于代练（可以是 卖家/接代练 也可以是 买家/发布代练订单 ）：匹配订单推送，售后，留言
- 系统管理员（可能是程序）：信用星级评定，售后介入

## 小结
因为我喜欢玩游戏，同时也进行过账号的交易，较为了解其中的流程，所以这次选择了游戏账号交易网站为题目，想要将所学的知识运用到实践中去。
初期，我是准备采用MVC框架进行前后端的分离，但是由于对于mvc的不了解最后放弃了这个构想，采用传统网站建立。在制作过程中，前端使用了bootstrap框架和jquery进行好看的界面交互操作，使界面更为美观，了解了弹性盒子、面板、模态框、内部导航等多种bootstrap功能。
后端数据库使用sql。为常用功能进行了存储过程的建立。同时查阅资料，实现了游戏账号的字母序排序，以美观地输出展示。同时，考虑到虚拟商品的安全性，在数据库中创建了系统定时作业，定时删除存储的过时的游戏账号和密码信息。同时在前端的显示中，使用了隐去密码的商品信息视图展示给买家，确保安全性。


## 后期想要解决的问题
- 1）更多功能的完善；
- 2）支付系统的正式引用;
