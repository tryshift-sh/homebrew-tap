class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.10/agx-darwin-arm64"
      sha256 "f92497165807738000c7fe329438e2e6af072d22cd0e34d2d737ad0e87063a97"
    else
      url "https://agx.tryshift.sh/cli/0.3.10/agx-darwin-x64"
      sha256 "5493b51cb89b7fef3b9b7b020f5c3f0aa949ae53ee7d38e26e664bf553cbe493"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.10/agx-linux-x64"
      sha256 "0dbc1797ee9c9e45ddecb4c201aaa9e850e3e27e45f608e094d6f8eacfa4c7cf"
    else
      url "https://agx.tryshift.sh/cli/0.3.10/agx-linux-arm64"
      sha256 "b8fce337798dde8f33b1d4a356d5d1da5e774127a1bdbddffdafdbbf011ea087"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
