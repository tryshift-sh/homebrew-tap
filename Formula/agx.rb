class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.12/agx-darwin-arm64"
      sha256 "2490f1372df3eac3336ef1fa6df11629a05825080b9a7e8901aeb68d7e57ff3f"
    else
      url "https://agx.tryshift.sh/cli/0.1.12/agx-darwin-x64"
      sha256 "8d828716a7ff4aabfde5aba310ce660be2e02b4a2bbd894f0f4127bdcaa7c5b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.12/agx-linux-x64"
      sha256 "974d91807d06f842006ce9b0ab38b950514d1cc76d2e4ddb97d270dca6c6e7a4"
    else
      url "https://agx.tryshift.sh/cli/0.1.12/agx-linux-arm64"
      sha256 "3145a8d2395af3117c0e869e4437ec9c230c043386ac869d468fe3637da287e9"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
