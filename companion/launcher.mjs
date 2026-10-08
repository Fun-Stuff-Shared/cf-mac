// Starts the Cognitive Fingerprint app's own CF tools for Claude Code. The app writes a small record
// when it opens (its CF folder, its executable, the folder that holds its tools); this reads it and
// runs the app's executable as Node on the requested tool, so the tools always match the app.
// Usage: node launcher.mjs mcp | node launcher.mjs cf starting-point save <draft-file> | node launcher.mjs cf doctor
import { spawn } from "node:child_process";
import { existsSync, readFileSync } from "node:fs";
import { homedir } from "node:os";
import { join } from "node:path";

const RECORD = join(homedir(), "Library", "Application Support", "Cognitive Fingerprint", "agent.json");
const MISSING = "Install the Cognitive Fingerprint app and open it once, then try again. It is at github.com/Fun-Stuff-Shared/cf-mac/releases/latest.";

function fail(message) {
  process.stderr.write(`${message}\n`);
  process.exit(1);
}

let record;
try {
  record = JSON.parse(readFileSync(RECORD, "utf8"));
} catch {
  fail(MISSING);
}
const { cf_folder: folder, executable, plugin } = record ?? {};
const tools = typeof plugin === "string" ? { mcp: join(plugin, "dist", "mcp.mjs"), cf: join(plugin, "dist", "cf.mjs") } : null;
if (typeof folder !== "string" || typeof executable !== "string" || !tools || ![executable, tools.mcp, tools.cf].every((path) => existsSync(path))) fail(MISSING);

const [mode, command, ...rest] = process.argv.slice(2);
let args;
if (mode === "mcp" && command === undefined) args = [tools.mcp, "--cf", folder];
// The Starting Point is saved from one draft file; doctor only reports and takes nothing more, so it can never repair.
else if (mode === "cf" && command === "starting-point" && rest[0] === "save" && rest.length === 2) args = [tools.cf, "starting-point", "save", folder, rest[1]];
else if (mode === "cf" && command === "doctor" && rest.length === 0) args = [tools.cf, "doctor", folder];
else fail("Usage: node launcher.mjs mcp | cf starting-point save <draft-file> | cf doctor. The dashboard itself opens in the app.");

const child = spawn(executable, args, { stdio: "inherit", env: { ...process.env, ELECTRON_RUN_AS_NODE: "1", CF_DIST_DIR: join(plugin, "dist") } });
child.on("error", () => fail(MISSING));
child.on("exit", (code, signal) => process.exit(signal ? 1 : (code ?? 1)));
