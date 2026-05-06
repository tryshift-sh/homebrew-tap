class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.0/agx-darwin-arm64"
      sha256 "24ffddfb02b9f243192a3163b9040de10a3a37fe4128d0afc525bc341f4314ab"
    else
      url "https://agx.tryshift.sh/cli/0.3.0/agx-darwin-x64"
      sha256 "8fd2c97d44c82b65e0d395b30a5a310eb2bcfef1e5189642e0352a53ef88a040"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.0/agx-linux-x64"
      sha256 "b9cd08918c919a03254905f4ebff9da1bb4cd896b364df71660f11e1e80bf0a2"
    else
      url "https://agx.tryshift.sh/cli/0.3.0/agx-linux-arm64"
      sha256 "86160b10e71c3e7e2dec7fa16e064e0b6f7d0f0366e89d77bd6fa3ce9cfec784"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
