#!/bin/sh
# Runs launcher.mjs with the Cognitive Fingerprint app's own executable as Node, so the person needs
# no Node of their own. The app keeps itself up to date only from Applications, so that is where it is.
app="${CF_APP_EXECUTABLE:-/Applications/Cognitive Fingerprint.app/Contents/MacOS/Cognitive Fingerprint}"
if [ ! -x "$app" ]; then
  echo "Install the Cognitive Fingerprint app in your Applications folder and open it once, then try again. It is at github.com/Fun-Stuff-Shared/cf-mac/releases/latest." >&2
  exit 1
fi
ELECTRON_RUN_AS_NODE=1 exec "$app" "$(dirname "$0")/launcher.mjs" "$@"
