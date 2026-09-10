# 110 GOD MODE

This branch is the protected working branch for Ryan's 110 build.

## Mac: safest first launch

1. Clone or download this branch to your Mac.
2. Double-click `START_110.command`.
3. macOS may ask you to approve running the file the first time.
4. The launcher will:
   - enforce a localhost-only launch path,
   - skip Puppeteer's optional browser download,
   - install the exact locked npm dependency tree,
   - run the project's setup doctor,
   - run unit tests,
   - build the production bundle,
   - open `http://localhost:4173` only after those gates pass.

## Node requirement

Use Node.js 24.14+ or Node.js 26. Node 25 is intentionally rejected.

## Keys

Start keyless. Do not commit API keys. Add optional provider credentials only after the base app launches cleanly.

## Branch policy

Do experimental 110 work on `110-god-mode`. Keep `main` as the clean upstream-style baseline until changes are reviewed.
