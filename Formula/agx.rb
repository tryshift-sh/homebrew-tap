class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.14/agx-darwin-arm64"
      sha256 "b4c02e3acc6e6f33789769e1dfe059f0089f4d3c3b9af0fd0e82213f8d65355b"
    else
      url "https://agx.tryshift.sh/cli/0.1.14/agx-darwin-x64"
      sha256 "4f9d3f747dbbbb42dccdcf99914cf960a1e134d89cf0e394a891840e91796dc8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.14/agx-linux-x64"
      sha256 "0b51ea487fc1aaa5d84dc8481dd919118ece76befafbc6012caa3b40d5eebf39"
    else
      url "https://agx.tryshift.sh/cli/0.1.14/agx-linux-arm64"
      sha256 "1cb915b8bbd6cbf191ff1199e8c114b86a097b39cf5be6cefb03ecf5677d3a6a"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
