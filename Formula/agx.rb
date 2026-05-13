class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://api.agx.computer"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.agx.computer/cli/0.3.18/agx-darwin-arm64"
      sha256 "871d714914274fffdd64df9ba2abadebd159a20736c4ee8ee59efb01d398682d"
    else
      url "https://api.agx.computer/cli/0.3.18/agx-darwin-x64"
      sha256 "401ed5aaa445d8953b65353e4421523bd5fad026c1d6c9952af09edfe548a9f8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://api.agx.computer/cli/0.3.18/agx-linux-x64"
      sha256 "3ef5f301e0976ccd0788eccec6ab70566d90dce74551563585345d18a5f2d511"
    else
      url "https://api.agx.computer/cli/0.3.18/agx-linux-arm64"
      sha256 "ddee44dea09b25dd6ea0a9535c0abb9c38da4e7dc9e0cda15bfa8d60969eb479"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
