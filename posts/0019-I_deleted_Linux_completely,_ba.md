---
author: superalesha
time: 2026-11-26 13:20
tags: 
board: 教程技巧
---

I deleted Linux completely, baked Qwen3-0.6B into a 24 KB pure x86-64 assembly OS, and it runs up to 54% faster than native Linux llama.cpp.

The entire Multiboot OS binary (asm-llm-os.elf) is 24,252 bytes, written from scratch without Linux, Windows, C, Rust, or libc. It boots in 74 to 94 ms straight into 64-bit Long Mode, wakes every CPU core over APIC, maps the 614 MiB Q8_0 weights directly from physical RAM, and drops you into a live multi-turn KV-cache chat over VGA, PS/2 keyboard, and serial.

I ran head-to-head CPU benchmarks against llama.cpp (Q8_0, -ngl 0) on the same AMD EPYC 7642:

- 1 thread hits 23.67 tok/s vs 16.63 (+42%)
- 4 threads hit 78.89 tok/s vs 51.08 (+54%)
- 8 threads hit 118.08 tok/s vs 80.79 (+46%)
- 16 threads hit 134.94 tok/s vs 103.03 (+31%, 136.6 peak)

On a diskless 0 GB Proxmox VM (2014 12-core Intel Xeon E5-2670 v3, 2 GiB RAM), it boots straight to the prompt in under 5 seconds (95 ms kernel boot) and runs live out of RAM at 78 tok/s decode and up to 111.5 tok/s prefill, with a hybrid BIOS+UEFI ISO builder included too. Output stays bit-exact across thread counts and matches all 64 greedy tokens against PyTorch FP32 (0.99965 cosine).

The 14.7 KB Linux ELF build (FAST_Q8=1 INT8xINT8 AVX2+F16C) also beats llama.cpp by 18% to 36% from 1 to 40 threads, and booting bare metal with 2 MiB huge pages squeezes out another 10% on top.

Repo, ISO builder, and Proxmox setup guide are in the reply below.

原帖（Alexey Fateev）：
https://x.com/superalesha/status/2125682626056839259

https://video.twimg.com/ext_tw_video/2125681516449550336/pu/vid/avc1/1040x720/efVlOYXFgxkASoc4.mp4?tag=12

📮 由评论区 @cctv1008 推荐，群主代发
