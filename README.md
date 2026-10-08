# Cognitive Fingerprint for Mac

Downloads for the Cognitive Fingerprint Mac app, and the small Claude Code plugin that connects it to
your AI agents. There is no source here.

## Install the app

Download the `.dmg` from the latest release, open it, and drag Cognitive Fingerprint into
Applications. Open it from Applications; it keeps itself up to date from here.

## Connect Claude Code

Open the app once first. Then, in Claude Code:

```
claude plugin marketplace add Fun-Stuff-Shared/cf-mac
claude plugin install cf@cognitive-fingerprint-app
```

Your agents can then read the findings you confirmed, and you can say "open my CF dashboard" to
open the app.
