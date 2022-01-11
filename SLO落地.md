# Meta Data
Date: 2021-01-11 
Address: 在线会议

# 现状
用故障时长/年时长 来量化服务可用性，粒度粗

# 问题
slo设置为一级服务99.5%，怎么拆sli？

# 建议步骤
1. 成立专门的虚拟项目组推动slo落地
2. Service Owner决定其Service业务层面的指标
3. 在公司层面选出北极星指标
4. SLO是动态的，需要不断的优化

# Tips
* SLO不应该作为KPI考核指标，避免Service owners围绕SLO优化
* 管理好MTTR期望
* 到某个系统或者模块的错误率/延迟

# 工具和标准：
## 在推广的slo标准协议
[Open SLO](https://openslo.com/)
[Sloth](https://sloth.dev)

## 业界工具
[datadog](https://www.datadoghq.com/)
[观测云](https://www.guance.com/)
[自研可观测平台](https://opentelemetry.io/docs/concepts/what-is-opentelemetry/)
[nobl9](https://nobl9.com/)
