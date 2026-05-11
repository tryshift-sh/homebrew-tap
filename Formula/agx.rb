class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.17/agx-darwin-arm64"
      sha256 "208a3203c02d9ec82de8557d9332c2bd08d0b5df9ca251ceef3690caae01f03b"
    else
      url "https://agx.tryshift.sh/cli/0.3.17/agx-darwin-x64"
      sha256 "45ff2ec968f6dad1ba37a7d94de0e543d5a011e648a56bdc8be466d9e1f5dc06"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.17/agx-linux-x64"
      sha256 "10fe3cb64b84759666c39247cdffd478f449c030dd781eb3b999a0f5257172ba"
    else
      url "https://agx.tryshift.sh/cli/0.3.17/agx-linux-arm64"
      sha256 "b64e059150461835dc6d714bed9215cd2d942b1455c2edd7b8be18210506cdcc"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
