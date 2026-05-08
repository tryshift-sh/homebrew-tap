class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.5/agx-darwin-arm64"
      sha256 "ed3f466958bc4ce7cc9eccd52f949ec15fe560285e23752cf1eb9fd279837a17"
    else
      url "https://agx.tryshift.sh/cli/0.3.5/agx-darwin-x64"
      sha256 "649e718294bba892ece37482ad0f2483a076bda611f53ffe867bcf485ed5cb8e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.5/agx-linux-x64"
      sha256 "f47450a729d4a6bc69aba19cc81d45577b0364b91428f50525190a6d012cf048"
    else
      url "https://agx.tryshift.sh/cli/0.3.5/agx-linux-arm64"
      sha256 "2c504b26436480a73f6e1865253e7d73a64a5888a70da266760eca4e5522f4f9"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
