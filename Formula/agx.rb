class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.19/agx-darwin-arm64"
      sha256 "77d31752a26aa518b3cd6b48d54146e7b88013f08d5af4adf087025e25265263"
    else
      url "https://agx.tryshift.sh/cli/0.1.19/agx-darwin-x64"
      sha256 "e615d9bc43387cfa87a42eb9ee117f19957d0a19fa0f76b3970d187356358fd9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.19/agx-linux-x64"
      sha256 "3fddf18480dec7a394e02415704517b7dddb4521a004c0cd41d0ce796aab04e2"
    else
      url "https://agx.tryshift.sh/cli/0.1.19/agx-linux-arm64"
      sha256 "df26d43e4715c42cc061d0e21219219bf0681e92b2dcfd18f5b047a261b1f93f"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
