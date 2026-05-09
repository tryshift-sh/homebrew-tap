class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.13/agx-darwin-arm64"
      sha256 "ad8fecdab68a68075fa6f26e3c262f88f45145c29c47539e6c479c2913ca64b8"
    else
      url "https://agx.tryshift.sh/cli/0.3.13/agx-darwin-x64"
      sha256 "4500fd5622fd262428a2156c8a4ea32222d175008318b58c861a881d8465ceaf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.13/agx-linux-x64"
      sha256 "3996dbdfca71124d83dba893b7219da3c19b7adde3c6a8f89d7123a2d1845b64"
    else
      url "https://agx.tryshift.sh/cli/0.3.13/agx-linux-arm64"
      sha256 "2ea51fae34e19a21b661772b44d3e9e1f2cb8faad4ae7df3614ecd1018e5353b"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
