class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.16/agx-darwin-arm64"
      sha256 "22f83c1bc41d766c58ba39807a877044de4d68c5dcbee82c4d6026c530f27bae"
    else
      url "https://agx.tryshift.sh/cli/0.3.16/agx-darwin-x64"
      sha256 "7297823dbeb26e9c8c80e3d3c16beb99138dbbedc45a035b5a578bdf361ef1c0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.16/agx-linux-x64"
      sha256 "67761b35716fd2c4401a1324b8ec6af673169d70abfc597132725ce7d0f5c6f9"
    else
      url "https://agx.tryshift.sh/cli/0.3.16/agx-linux-arm64"
      sha256 "26aa1a216010008dc903651c161929d6f4bd3c5f219d6bdb6b8458731ff54351"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
