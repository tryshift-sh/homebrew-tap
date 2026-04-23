class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.11/agx-darwin-arm64"
      sha256 "8f5202fd08d9159f34cf52a0f4a80641001e7a36a767c8d5d8e72e71aefbf731"
    else
      url "https://agx.tryshift.sh/cli/0.1.11/agx-darwin-x64"
      sha256 "a991b097cd986976fd0b6d859a643eb19fe3afa17f761289bd28fceb2674ff3a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.11/agx-linux-x64"
      sha256 "bdc008d5143dbe2323baaa98e2991f26eac09bc8c0fca273fbb7c48837ebac86"
    else
      url "https://agx.tryshift.sh/cli/0.1.11/agx-linux-arm64"
      sha256 "a2335c81d16a45a87d011e690a89e9e0c718e4e74341768c413dd005db05cbba"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
