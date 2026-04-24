class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.1.16/agx-darwin-arm64"
      sha256 "73c2daac0ba31bcb2b360f547c3911521895853eeebdf15a615d6949214d5335"
    else
      url "https://agx.tryshift.sh/cli/0.1.16/agx-darwin-x64"
      sha256 "23189823af6ae55ed49d8e0ef033b9d0e9a63951877542334f6078f26cfaa104"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.1.16/agx-linux-x64"
      sha256 "5dbc2207887557eff93544a83e422dceeeb1d67e72f687d1ec0c0cff29db0afa"
    else
      url "https://agx.tryshift.sh/cli/0.1.16/agx-linux-arm64"
      sha256 "4d4b04fb5b0ae0950b0fc966886b9df0d4cf4256dc7895f812166994954dc592"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
