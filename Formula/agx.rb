class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.4/agx-darwin-arm64"
      sha256 "dec7758c8f13d688439d37167dea41b6abfe508b491d5e00ef72be1b73f17e5e"
    else
      url "https://agx.tryshift.sh/cli/0.3.4/agx-darwin-x64"
      sha256 "055c32f605fd08aa14d25c3b49141a6ae763a756a965db721aa6157ba7eee1a7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.4/agx-linux-x64"
      sha256 "6f16d242b10378b384aec59bb0c9e6e14f028c10d7b8f82932ee62af59d070f2"
    else
      url "https://agx.tryshift.sh/cli/0.3.4/agx-linux-arm64"
      sha256 "c7c5743693f686893d5030c929749fe4fc53d59dfc9b5de5ff2746afa423174c"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
