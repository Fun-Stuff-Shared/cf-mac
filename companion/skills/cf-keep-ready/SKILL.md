---
name: cf-keep-ready
description: Have the person's Cognitive Fingerprint dashboard open whenever their computer starts, stop doing that, or say how to check. Use when they say "keep my dashboard ready", "start my CF dashboard automatically", "open my CF at login", or ask to stop it starting by itself.
---

# CF Keep Ready

The steps for this live in the Cognitive Fingerprint app, so they always match the app the person has. Run exactly this one command:

```
sh ${CLAUDE_PLUGIN_ROOT}/cf.sh guide cf-keep-ready
```

Follow what it prints as the steps for this request. If it prints a line about installing, opening or updating the app instead, tell the person that line and stop.
