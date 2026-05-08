class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.8/agx-darwin-arm64"
      sha256 "0574f2c26ae598924cfd5237db13638eb5d1c05862bc44b555bf2c03bd0ef7f2"
    else
      url "https://agx.tryshift.sh/cli/0.3.8/agx-darwin-x64"
      sha256 "c24bee8e608c382d5c38bfddec674d90d241ea9ac76292ac3397dbcfbebf2d5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.8/agx-linux-x64"
      sha256 "6451f32b6ebaf0f0216b38cecf4e374bddf7921375ab609803c558cff513ac15"
    else
      url "https://agx.tryshift.sh/cli/0.3.8/agx-linux-arm64"
      sha256 "3a48e3afceadab0f5cbf6a9261498946dff5f793e9e986dc88e3a7f5fa39b8c6"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
