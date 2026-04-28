class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.17/agx-darwin-arm64"
      sha256 "5cf200ddc5da35066bd9a11c318b6b7ba0c7636dd955b2b18f482111e973b6ca"
    else
      url "https://agx.tryshift.sh/cli/0.1.17/agx-darwin-x64"
      sha256 "9fc561d85e9b6fc40311ffd46439ff0cc5d2dd867bcf84b6a34210fb25cf8fbb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.17/agx-linux-x64"
      sha256 "4241a7e369b8369ad2bdce1f72825dc33bb433d263cc6b240b1e4b38db62eee2"
    else
      url "https://agx.tryshift.sh/cli/0.1.17/agx-linux-arm64"
      sha256 "6dda3023249f3a1acd52cfa90b99764de6fb5ecf77f23b523a814dab7ae8e7cd"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
