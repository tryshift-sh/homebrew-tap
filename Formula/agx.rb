class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.1/agx-darwin-arm64"
      sha256 "63e19d5c465423837cae72fe38953d38e9cbe697c6213b826e20ecc61def0f2d"
    else
      url "https://agx.tryshift.sh/cli/0.3.1/agx-darwin-x64"
      sha256 "47ea6f4f2cf35146aefc161a4e0ccd93aa7ae01940f09f2c1173119d58fc2fc9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.1/agx-linux-x64"
      sha256 "f05c7c26363850ec99f39c6c3161e62afc5bfb151460ee603f3ddad8163f27a3"
    else
      url "https://agx.tryshift.sh/cli/0.3.1/agx-linux-arm64"
      sha256 "5b06e04c8dddedd665c79f55706f473307e46a358fb5dfbf1a3d90f671f04025"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
