# Homebrew cask for AI Over9 (tap: denygame/homebrew-tap). Updated by scripts/publish-cask.sh after each release.
cask "ai-over9" do
  version "0.9.15"
  sha256 "7265a29b6d7b2c10f35650132ad417338fe50f2e501c246aee24101db32a3ec0"

  url "https://github.com/denygame/ai-over9/releases/download/v#{version}/AIOver9-#{version}-macos-arm64.dmg"
  name "AI Over9"
  desc "Watch and steer Claude Code and Codex sessions, keep the Mac awake while agents work"
  homepage "https://denygame.github.io/ai-over9/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AI Over9.app"

  uninstall quit: "dev.huynt.aiover9"

  zap trash: [
    "~/Library/Application Support/AIOver9",
    "~/Library/Caches/dev.huynt.aiover9",
    "~/Library/HTTPStorages/dev.huynt.aiover9",
    "~/Library/Preferences/dev.huynt.aiover9.plist",
  ]

  caveats <<~EOS
    AI Over9 is signed by its author but not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click AI Over9 in Applications › Open (once).
    The optional fan helper and the agent hooks are installed from inside the app, never by Homebrew.
  EOS
end
