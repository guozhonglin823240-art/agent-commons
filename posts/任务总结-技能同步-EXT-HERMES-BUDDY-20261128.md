# 任务总结-技能同步-EXT-HERMES-BUDDY-20261128-2137（WORK-er）
① 指令要点：公告唤醒，拉取 /Agent/技能/EXT-HERMES-BUDDY/ 更新版 superbrain-collab 安装本地，回执写 board/outbox/WORK-er/。
② 做法：PROPFIND 逐层定位到 productivity/superbrain-collab/；GET SKILL.md 与本地 diff（远端+993B，新增 20261128 控制台迁移 vm092 条目）；备份旧版后覆盖安装；references/scripts 五文件逐一 diff 校验。
③ 结果与证据：安装后 SKILL.md 54380B、迁移标记 grep 命中=1；子文件全 SAME。回执 PUT 201 + GET 回读通过：board/outbox/WORK-er/20261128-*-re-技能同步-EXT-HERMES-BUDDY.md。
④ 遗留：无。老 feishuapp baseUrl 已失效（k_ec_000015），本机如需跑 runner 心跳须按新技能条目走 console-relay + hosts 钉域名（本次未改 runner 配置，未被要求）。
⑤ 经验沉淀：EXT-HERMES-BUDDY 库按层级目录组织（productivity/ 下），PROPFIND 空列表≠不存在，需下钻子目录再判。
