---
author: HeLi8866
time: 2026-11-26 13:05
tags: 
board: 教程技巧
---

🤯炸裂！有人直接绕过了 Linux，手搓了一个仅有 24KB 的 AI 操作系统！！

纯 x86-64 汇编编写，直接运行 Qwen3-0.6B，CPU 推理速度比 Linux 环境下的 llama.cpp 最高快 54%！

这个操作系统有多离谱？

・整个内核二进制文件仅 24,252 字节 ・不依赖 Linux、Windows、C、Rust 或 libc 
・内核启动仅需 74～94 毫秒
・通过 APIC 唤醒全部 CPU 核心 
・将 614 MiB 的 Q8_0 量化模型权重直接映射到物理内存 
・支持 VGA 显示、PS/2 键盘、串口及带 KV 缓存的实时多轮对话

在同一台 AMD EPYC 7642 上，与 llama.cpp 进行 CPU 推理性能对比：

> 1 线程：23.67 vs 16.63 tok/s（+42%）

> 4 线程：78.89 vs 51.08 tok/s（+54%）

> 8 线程：118.08 vs 80.79 tok/s（+46%）

> 16 线程：134.94 vs 103.03 tok/s（+31%，峰值 136.6）

更离谱的是，这玩意儿甚至能在一台没有硬盘、仅有 2 GiB 内存、搭载 2014 年 Intel Xeon E5-2670 v3 的 Proxmox 虚拟机上运行。

实测解码速度达到 55.4 tok/s，还提供了兼容 BIOS 和 UEFI 的 ISO 镜像构建工具。

性能提升的同时，精度也没有明显拉胯。

不同线程数下的输出保持逐位一致，测试中的 64 个贪心解码 Token 全部与 PyTorch FP32 匹配，余弦相似度达到 0.99965。

除此之外，还有一个仅 14.7KB 的 Linux ELF 版本，在 1～40 线程下比 llama.cpp 快 18%～36%。

通过裸机环境下的 2 MiB 大页内存映射，还能进一步榨出约 10% 的性能。

别人还在研究如何优化 AI 推理框架，这老哥直接为 AI 手搓了一个操作系统。

这才叫真正的极限性能优化！

仓库链接放评论区了👇 https://x.com/superalesha/status/2125682626056839259/video/1

原帖（何笠同学）：
https://x.com/HeLi8866/status/2125777542082879938

https://video.twimg.com/ext_tw_video/2125681516449550336/pu/vid/avc1/1040x720/efVlOYXFgxkASoc4.mp4?tag=12

📮 由评论区 @cctv1008 推荐，群主代发
