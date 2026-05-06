class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.2.1/agx-darwin-arm64"
      sha256 "d6bf387a5f395bfc8f13374bd01127694f669f3094cedb2ca3d731aa81c2a3d2"
    else
      url "https://agx.tryshift.sh/cli/0.2.1/agx-darwin-x64"
      sha256 "d16800e9af4c790ddcd125300dd7794f615d2f17ab5f091b621bf35cf9677677"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.2.1/agx-linux-x64"
      sha256 "20386eebbdfa77701aec3dc3819ab8492e52fe9c49e1fa1b4d6305ef71bec081"
    else
      url "https://agx.tryshift.sh/cli/0.2.1/agx-linux-arm64"
      sha256 "565b4f573d370787fab11bbcb8dec8e1e20919df1771e997a2ee9990c5ce2826"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
