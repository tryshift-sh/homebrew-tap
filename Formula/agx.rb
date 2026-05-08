class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.6/agx-darwin-arm64"
      sha256 "d753af7a20b2c4666486cd3ae67775f8c92149e5a74d885daa264c6f68ea94df"
    else
      url "https://agx.tryshift.sh/cli/0.3.6/agx-darwin-x64"
      sha256 "5b197f59e67350663a0598b2c69deb34bb7aef3879b9d39c112135677d054ed6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.6/agx-linux-x64"
      sha256 "7e01448dd4bc18d56ee09b82a5ce2e402e16a98c26620342dbed1b11d38e75e5"
    else
      url "https://agx.tryshift.sh/cli/0.3.6/agx-linux-arm64"
      sha256 "bcec8445803691694859bcf689cb0f6494dfaed0bf5ae2365f05b5f5688fb421"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
