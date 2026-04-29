class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.18/agx-darwin-arm64"
      sha256 "9b5395d7daa15576592f54a087fe7754304ccc6a49525ebf25333ff9ca2bc469"
    else
      url "https://agx.tryshift.sh/cli/0.1.18/agx-darwin-x64"
      sha256 "2921cfff2d133cbbc8653fd38d7a34a064465f5103b632524c37ba19f68b2518"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.18/agx-linux-x64"
      sha256 "0f50514684d6b3d6025b96b826147c4b9567a38b93dbf0493ce287a5ea7528c7"
    else
      url "https://agx.tryshift.sh/cli/0.1.18/agx-linux-arm64"
      sha256 "b6f49894382aa957d7aa5f7fa926e60d69e53568badacdb0780c964e54ecb317"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
