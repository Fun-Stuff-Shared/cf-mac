---
name: cf-onboard
description: Set up a new person's Cognitive Fingerprint. Their dashboard is the Cognitive Fingerprint app; it makes or finds their CF folder on first launch and walks them through the rest: their name, ten short questions, connecting with their CF service key, and adding their calls. Safe to run again. Use when someone says "set up my CF", "start my CF", or "onboard me".
---

# CF Onboard

The steps for this live in the Cognitive Fingerprint app, so they always match the app the person has. Run exactly this one command:

```
sh ${CLAUDE_PLUGIN_ROOT}/cf.sh guide cf-onboard
```

Follow what it prints as the steps for this request. If it prints a line about installing, opening or updating the app instead, tell the person that line and stop.
