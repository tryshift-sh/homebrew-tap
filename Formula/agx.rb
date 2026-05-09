class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.12/agx-darwin-arm64"
      sha256 "011e1d971aa464f822b663c54d4e67cf77326edbf72a20eaa817323897878fd5"
    else
      url "https://agx.tryshift.sh/cli/0.3.12/agx-darwin-x64"
      sha256 "9ff4266449c7dca7c4159779d69685e3a7d5c19a74815c569c396af6d1ee68b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.12/agx-linux-x64"
      sha256 "87cd5b23b2bf313af2548ec06c10515d5a80ec48ec4de5c0f82513ad32006631"
    else
      url "https://agx.tryshift.sh/cli/0.3.12/agx-linux-arm64"
      sha256 "52ffc009483886711ab86973da180a8fd01aa8ada5ff94ea04b80eaad965e0e9"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
