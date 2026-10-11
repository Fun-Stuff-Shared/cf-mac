#!/bin/sh
# The app updates itself only from Applications, so its tools and skill guides are looked for there.
app="${CF_APP_EXECUTABLE:-/Applications/Cognitive Fingerprint.app/Contents/MacOS/Cognitive Fingerprint}"
launcher="${CF_APP_LAUNCHER:-$(dirname "$app")/../Resources/plugin/companion/launcher.mjs}"
if [ ! -x "$app" ] || [ ! -f "$launcher" ]; then
  echo "Install the Cognitive Fingerprint app in your Applications folder and open it once, then try again. It is at github.com/Fun-Stuff-Shared/cf-mac/releases/latest." >&2
  exit 1
fi
CF_COMPANION_ROOT="$(cd "$(dirname "$0")" && pwd)" ELECTRON_RUN_AS_NODE=1 exec "$app" "$launcher" "$@"
