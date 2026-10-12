#!/bin/sh
# Finds the installed Cognitive Fingerprint app and runs its companion launcher with the app's executable as Node.
# Mac: the app updates itself only from Applications. Windows (Claude Code runs this through Git Bash): the
# installer puts the app in the member's own Programs folder.
case "$(uname -s)" in
  MINGW* | MSYS* | CYGWIN*)
    programs="$(cygpath -u "${LOCALAPPDATA:-}")/Programs/cognitive-fingerprint"
    app="${CF_APP_EXECUTABLE:-$programs/Cognitive Fingerprint.exe}"
    launcher="${CF_APP_LAUNCHER:-$(dirname "$app")/resources/plugin/companion/launcher.mjs}"
    get="download github.com/Fun-Stuff-Shared/cognitive-fingerprint/releases/latest/download/Cognitive-Fingerprint-Windows.exe and open it"
    ;;
  *)
    app="${CF_APP_EXECUTABLE:-/Applications/Cognitive Fingerprint.app/Contents/MacOS/Cognitive Fingerprint}"
    launcher="${CF_APP_LAUNCHER:-$(dirname "$app")/../Resources/plugin/companion/launcher.mjs}"
    get="download github.com/Fun-Stuff-Shared/cognitive-fingerprint/releases/latest/download/Cognitive-Fingerprint-Mac.dmg, open it, and drag Cognitive Fingerprint into Applications"
    ;;
esac
if [ ! -f "$app" ] || [ ! -f "$launcher" ]; then
  echo "The Cognitive Fingerprint app is not installed. To install it, $get. Open it once, then try again." >&2
  exit 1
fi
CF_COMPANION_ROOT="$(cd "$(dirname "$0")" && pwd)" ELECTRON_RUN_AS_NODE=1 exec "$app" "$launcher" "$@"
