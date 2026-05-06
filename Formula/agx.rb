class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.3/agx-darwin-arm64"
      sha256 "0b4bca356f7f896116c6711de49ca6f28c6342df9de4deb84c5b6f2bf80272f7"
    else
      url "https://agx.tryshift.sh/cli/0.3.3/agx-darwin-x64"
      sha256 "df64f777fa2072304e8fc5330e816f35a7b7210f61e1c8730a913947f9be21ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.3/agx-linux-x64"
      sha256 "53d68d62e0a5656d5dd2defe6113613e4fc1a0beb8a5200fcc96f40e94c196f5"
    else
      url "https://agx.tryshift.sh/cli/0.3.3/agx-linux-arm64"
      sha256 "14f345b07ef11347ec8bc21c969c5e59596c8db957bff986b3868a0ec9173d05"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
