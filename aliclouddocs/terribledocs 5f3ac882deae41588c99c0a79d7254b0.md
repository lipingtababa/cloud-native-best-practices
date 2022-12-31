# terribledocs

# 摘要

阿里云的文档充满了满山满谷的死链接, 无厘头的错误链接, 莫名其妙的错误页, 不规范的错误码和故意损害体验的登录要求, 使得用户自助服务(Self Service)变得不可能, 并且让用户怀疑这个团队的基础工程素养和质量管理能力.

# 为什么我要读文档?

没有人会读iphone或者华为手机的用户说明书, 因为我们默认To C产品的设计就应该照顾傻子, 符合用户的直觉. 如果我在淘宝搜索不到我要的东西, 没人会说我能力不够, 大家都会说淘宝小二的UX设计有问题.

但是这个逻辑不能推行到To B产品. To B产品天然的需要学习. 作为一种最廉价最可靠的途径, 云厂家文档是我们自助服务时候最为依赖的信息媒介. 从云厂家的角度看, 当我们读完文档开始自助服务的时候, 实际上我们在帮他们完成产品交付. 

在我的工作实践中, 除非极少数尚在preview的新服务, 绝大多数时候, 我们开通云服务都不会和云厂家的售后沟通, 而是以这种“读文档学习,上Console测试, 写Terraform代码部署”的方式自助开通.

这种做法也是符合[NIST对云计算的定义](https://developer.aliyun.com/article/982756)的:

> 云计算是一种按使用量付费的模式，这种模式提供可用的、便捷的、按需的网络访问， 进入可配置的计算资源共享池（资源包括网络，服务器，存储，应用软件，服务），这些资源能够被快速提供，只需投入很少的管理工作，或与服务供应商进行很少的交互。
> 

所以, 我们可以说“文档是云服务交付过程中很关键的核心资产, 不是可有可无的点缀”. 

很可惜, 我在测试领先云的时候, 没有感受到这一点, 我感受到的是一种漫不经心, 甚至可以说基本敬业精神的缺乏.

# 官方页面大量的死链接

这个页面 [https://cn.aliyun.com/product/rds?from_alibabacloud=](https://cn.aliyun.com/product/rds?from_alibabacloud=) 是领先云RDS服务的官方页面, 按道理, 应该是最多访问的页面. 说出来您可能不相信, 这一个页面就有三十几个不可用的链接.

## 正文中的死链接

页面的核心部分, ****云数据库RDS功能章节截图如下:****

![Screenshot 2022-12-31 at 20.00.02.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_20.00.02.png)

“可用区“的链接是

[https://help.aliyun.com/document_detail/rds/RDS-manual/RDS-HA/RDS-MAVZ.html?spm=5176.7920929.204027.1.4b243637qhBMAr](https://help.aliyun.com/document_detail/rds/RDS-manual/RDS-HA/RDS-MAVZ.html?spm=5176.7920929.204027.1.4b243637qhBMAr)

“异地灾备实例”的链接是[https://help.aliyun.com/document_detail/rds/rds_qs_mysql/rds_qs_mysql_00010/rds_qs_mysql_00012.html?spm=5176.7920929.204027.2.4b243637qhBMAr](https://help.aliyun.com/document_detail/rds/rds_qs_mysql/rds_qs_mysql_00010/rds_qs_mysql_00012.html?spm=5176.7920929.204027.2.4b243637qhBMAr)

“只读实例“的链接是

[https://help.aliyun.com/document_detail/rds/rds_qs_mysql/rds_qs_mysql_00010/rds_qs_mysql_00011.html?spm=5176.7920929.204028.2.4b243637qhBMAr](https://help.aliyun.com/document_detail/rds/rds_qs_mysql/rds_qs_mysql_00010/rds_qs_mysql_00011.html?spm=5176.7920929.204028.2.4b243637qhBMAr)

三个链接全都指向了…咳咳…淘宝网的错误页.

![Screenshot 2022-12-31 at 20.03.57.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_20.03.57.png)

## 无法理解的成片死链接

页面下方, 给了更多的链接指向更多的内容, 但是让人震惊的是, 全都是死链接, 无一例外.

绿色框的所有链接都指向help.aliyun.com, 但是跟上面三个链接一样, 最终都返回一个淘宝的错误页.

![Untitled](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Untitled.png)

红色框中的两个链接, 分别指向了

https://help.aliyun.com/product/8314883_rds.html  https://help.aliyun.com/knowledge_list/8314902.html

但最终返回的是阿里云自己的错误页面

![Screenshot 2022-12-31 at 20.14.42.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_20.14.42.png)

而蓝色方框的所有链接, 指向了一个已经废弃的域名 bbs.aliyun.com

![Screenshot 2022-12-31 at 20.15.18.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_20.15.18.png)

## 死链接是很容易修复的

我们团队也向公司的应用开发者提供文档, 使用[gatsby-remark-check-links](https://www.gatsbyjs.com/plugins/gatsby-remark-check-links/) 检查死链接. 

任何一个对文档的修改如果引入了死链接, 它那个PR就会被拒绝合并. 同时由于我们文档几乎每天都更新, 因此即使第三方网站撤销页面, 我们也能迅速发现并修正. 所以最终客户能看到错误页面的概率微乎其微.

我很遗憾, 阿里云作为专业的IT服务提供商, 居然没有使用这么简单的工具.

# 无厘头的JS跳转

同一页面的客户使用案例, 也是我很想阅读的, 但是它很没有必要的使用了js跳转.

![Screenshot 2022-12-31 at 19.49.42.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_19.49.42.png)

然后我在Chrome中打开,得到一个blocked空白页

![Screenshot 2022-12-31 at 19.54.37.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_19.54.37.png)

在Firefox中打开, 得到一个纯粹的空白页

![Screenshot 2022-12-31 at 19.54.14.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_19.54.14.png)

在Safari中, 根本无法点击.

![Screenshot 2022-12-31 at 20.19.52.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_20.19.52.png)

你总不能让我去用IE打开吧?

# 链接指向一个不可用的服务器

在同一章节, 还有两个内容我也有兴趣:

![Untitled](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Untitled%201.png)

其中”高安全访问模式“指向了

[https://docs.aliyun.com/?spm=5176.7920929.204030.1.4b243637tPWizP#/pub/rds/RDS-manual/RDS-Data-Link&RDS-ConnectionMode](https://docs.aliyun.com/?spm=5176.7920929.204030.1.4b243637tPWizP#/pub/rds/RDS-manual/RDS-Data-Link&RDS-ConnectionMode)

“自动备份“指向了

[https://docs.aliyun.com/?spm=5176.7920929.204030.2.4b243637tPWizP#/pub/rds/RDS-manual/RDS-Backup-Recovery&RDS-Backup-Policy](https://docs.aliyun.com/?spm=5176.7920929.204030.2.4b243637tPWizP#/pub/rds/RDS-manual/RDS-Backup-Recovery&RDS-Backup-Policy)

然后我得到了

![Screenshot 2022-12-31 at 20.35.52.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_20.35.52.png)

# 链接和锚文本不符

在如下所示的Console页面中, 左边sidebar最后一个链接, 其锚文本说的是数据库专家服务, 其正确页面应该是[https://cn.aliyun.com/product/dbes](https://cn.aliyun.com/product/dbes) 或者其国际站的对应页面.

但实际上链接指向了另外一个服务: 数据备份服务  [https://www.alibabacloud.com/zh/product/database-backup](https://www.alibabacloud.com/zh/product/database-backup)

请注意, 这不再是供阅读的文档, 而是用户实际操作的Console页面, 是操作不慎就可能出故障的Console! 

![Screenshot 2022-12-31 at 21.25.48.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_21.25.48.png)

# 漫不经心的翻译

领先云RDS文档有个有趣的[RDS与自建数据库对比优势表](https://help.aliyun.com/document_detail/41875.html), 

> 1个初级DBA工程师月薪至少5000/月，假设当前项目占用该工程师30%的工作量，则人员成本为5000 × 12× 30% = 18000元。
> 

这个表在领先云[国际站的中文版](https://www.alibabacloud.com/help/zh/apsaradb-for-rds/latest/competitive-advantages-of-apsaradb-rds-instances-over-self-managed-databases)就变成了

> 1个初级DBA工程师月薪至少$5,000/月，假设当前项目占用该工程师30%的工作量，则人员成本为5000 × 12× 30% = $18,000。
> 

都是讲简体中文的, 怎么在国内站就是5000人民币一个月, 在国际站就是5000美元一个月?

# 迷惑的错误页

如上所述, 作为阿里云的用户, 我被跳转到淘宝的错误页面. 我拿着公司的工资去研究阿里云的文档, 然后我老板看到我浏览器上打开的全是淘宝页面, 他会怎么想?

> 嘿, 老板, 我真的不是在买衣服, 这是个错误页面, 是阿里云跳转过来的. 真的, 阿里云会跳转到淘宝去的, 我没骗你!
> 

# 混乱的错误码

不只是错误页面, 错误页面的状态码也很混乱.

淘宝错误页面的状态码是302, 而阿里云错误页面的状态码直接是200. 实际上两者都应该是404.

有心的读者可以自行测试:

```bash
curl -vvv "https://help.aliyun.com/document_detail/rds/RDS-manual/RDS-HA/RDS-MAVZ.html"

curl -v  "https://help.aliyun.com/product/8314883_rds.html"
```

# 莫名其妙的登录要求

我认为云厂商都是鼓励用户自助服务的, 他们有专业的内容团队和布道师团队引导客户去读他们的文档. 但是阿里云的思路显然不太一样, 他们似乎在限制用户阅读文档.

比如下面这个一点都不温馨的提示: 未登录用户仅可预览8页文档.

你能理解我读文档读到第九页被打断要跑去登录的怒火吗?

![Untitled](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Untitled%202.png)

# 混乱的文档结构

即使没有所有这些奇怪的错误和限制, 阿里云的文档架构也很奇怪.

我看到的域名就有

- cn.aliyun.com/product/rds
- www.aliyun.com/product/rds
- help.aliyun.com/product/26090.html
- docs.aliyun.com
- bss.aliyun.com
- 以及不断跳转的国际站 alibabacloud.com

与此同时, 阿里云信任中心的合规性页面, 放在本应发售第三方服务的云市场.

![Screenshot 2022-12-31 at 21.08.04.png](terribledocs%205f3ac882deae41588c99c0a79d7254b0/Screenshot_2022-12-31_at_21.08.04.png)

# 总结

我听过很多次阿里云高P讲双十一世纪工程, 十亿客户运维经验, 人工智能改变世界, 超级芯片领先全球, 也许是真的, 也许是假的, 我不知道.

但是从文档看, 这个团队似乎缺乏基本的工程素养和质量管理. 在很关键的地方存在大量的低级错误无人理会.  有朋友说, 这很可能是因为文档不算内部KPI, 因此无人关注.

如果云厂家认为文档无关紧要的话, 那恐怕不只是质量管理问题, 而是团队对云服务的交付模式-用户自助服务(Self Service)-有根本性的误解. 这样的云, 会不可避免的养一个庞大的交付团队, 变成劳动力密集公司, 偏好消耗人力的系统集成项目. 这是中国云计算行业最值得担忧的一个趋势.

Disclaimer: 我和阿里云, 或者阿里云的任何竞争对手, 没有利益关系. 实际上, 写这篇文章是因为我想用阿里云RDS举例以便向我的朋友们证明: 云厂家的托管数据库比自建数据库好. 显然, 读了文档之后, 我这个信心受到了动摇.