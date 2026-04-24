class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.13/agx-darwin-arm64"
      sha256 "5ed63a48f54d9b0c2996421161b3382711dcc4a4078b4c839156edb25e12cbab"
    else
      url "https://agx.tryshift.sh/cli/0.1.13/agx-darwin-x64"
      sha256 "44ccdc5e69a6d61defcac1d9de0581270e273ddb6724b707fcfce9131570ab9a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.13/agx-linux-x64"
      sha256 "cbc609f7a357b5df40a80406633efc44ca3741313b26cc45e47430b787ea8300"
    else
      url "https://agx.tryshift.sh/cli/0.1.13/agx-linux-arm64"
      sha256 "11dde5f78f9974c52faeab72826b96c56671c65f09abd9370ba6744710207cc8"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
