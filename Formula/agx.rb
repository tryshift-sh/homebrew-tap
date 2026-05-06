class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.2.0/agx-darwin-arm64"
      sha256 "813c9fe585e9d0881c295330a5a5cb1617662a63ec95494b6925cb5fd6450931"
    else
      url "https://agx.tryshift.sh/cli/0.2.0/agx-darwin-x64"
      sha256 "417901fde7a46cccf9f4defe7aa6a301c25f6b75404fc71d06602ca7a52040bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.2.0/agx-linux-x64"
      sha256 "e472a1502798ee5d7cf453952b63ed17d2e2455da4337145920e2a35ba67bdb6"
    else
      url "https://agx.tryshift.sh/cli/0.2.0/agx-linux-arm64"
      sha256 "fd8f96d5bf862bb50b7f17acbdd19c10e5616af8f12313fccbb927002a1c194f"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
