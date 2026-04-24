class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.15/agx-darwin-arm64"
      sha256 "4df340cf9b579ff24b3613e8b87470f3661cb22b9277b567e5a8696556e5f02c"
    else
      url "https://agx.tryshift.sh/cli/0.1.15/agx-darwin-x64"
      sha256 "fc293c7ded48604fc44be95f12cd1052b819542c3cf4693966041fe6932843a7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.15/agx-linux-x64"
      sha256 "5d6e5dfe0238ce182dd9c1469f3571a2c700c85429cd78e77ca8b921c1e42d8c"
    else
      url "https://agx.tryshift.sh/cli/0.1.15/agx-linux-arm64"
      sha256 "9384d4c6f0bdd87bbc64341450a5872974290af3ef3ac84d1bbb701c31f273ec"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
