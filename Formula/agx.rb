class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.2/agx-darwin-arm64"
      sha256 "f1d1dfa492cf1a2f707033936a039f8a5b5540052184f436289958609c3870f6"
    else
      url "https://agx.tryshift.sh/cli/0.3.2/agx-darwin-x64"
      sha256 "ced45e0827248637d3cca5159ceff73f29c898e84f87f4b9458bc466da815d5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.2/agx-linux-x64"
      sha256 "fb43b58997014d746b27f4358d05bdc66a4d3904747703692509cdcddbeabc32"
    else
      url "https://agx.tryshift.sh/cli/0.3.2/agx-linux-arm64"
      sha256 "84aa6928265f4ed5ce578bd63f3879119cd5fa00f089815f6e44444e22225fea"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
