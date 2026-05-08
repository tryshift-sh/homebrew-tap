class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.9/agx-darwin-arm64"
      sha256 "0d0543149a243b5ce50c92289f643486f66c527eee19778753e76bc82167e4d1"
    else
      url "https://agx.tryshift.sh/cli/0.3.9/agx-darwin-x64"
      sha256 "63f9a28ee70c5091d57fa845fb5c53542bd9e66700e84070e15a0b6e30545a39"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.9/agx-linux-x64"
      sha256 "23c275de047d2e6093306b32771b68f42c2b0df628602af648ca64b7dd14aae9"
    else
      url "https://agx.tryshift.sh/cli/0.3.9/agx-linux-arm64"
      sha256 "c6b3504f3f607c1c0c792e53a8fe71094e0ed2ee3e5fe7734168793a28fd9f9f"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
