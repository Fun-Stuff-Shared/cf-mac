---
name: cf-starting-point
description: Set up a person's CF workspace with a short conversation about their business, the result they want in 90 days, and how they will know it is working. Saves a draft business.md that the person checks and saves in the dashboard. Use when someone runs CF for the first time, or says "set up my CF", "start my CF", "update my starting point", or "redo my starting point".
---

# CF Starting Point

The steps for this live in the Cognitive Fingerprint app, so they always match the app the person has. Run exactly this one command:

```
sh ${CLAUDE_PLUGIN_ROOT}/cf.sh guide cf-starting-point
```

Follow what it prints as the steps for this request. If it prints a line about installing, opening or updating the app instead, tell the person that line and stop.
