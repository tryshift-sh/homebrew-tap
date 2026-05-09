class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.11/agx-darwin-arm64"
      sha256 "3bdb88bbf90332c772aaa1d52ac8fceb3b931b4f72d8b46905fc6624580e60ef"
    else
      url "https://agx.tryshift.sh/cli/0.3.11/agx-darwin-x64"
      sha256 "13e96a04b874ab9740305047476515c8db3d2fd796a56b92de9fb33068cd7dfe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.11/agx-linux-x64"
      sha256 "308d52f92a2a9f76ffbfdfcf3151e1bf42e373efdfc18facc5984f2b4560491b"
    else
      url "https://agx.tryshift.sh/cli/0.3.11/agx-linux-arm64"
      sha256 "c4ddce80e8c3d265455e1b585ffb5fd76b32679dd4478162bba7b7253a483657"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
