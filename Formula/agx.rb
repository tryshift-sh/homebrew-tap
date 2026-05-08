class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.7/agx-darwin-arm64"
      sha256 "4457f5581c297a8ab4f62fe3bd5b684b3f1833cc26fdc577117630409236bcf5"
    else
      url "https://agx.tryshift.sh/cli/0.3.7/agx-darwin-x64"
      sha256 "1efd8dea9edbe604aa65086976384b7d3e1c37b5339706f68cad355d6d98d6d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.7/agx-linux-x64"
      sha256 "d8c8ac449c4e999b6e5fa0bcc3ac2befdcebfeb6a11f3f9996f76fd4c0852240"
    else
      url "https://agx.tryshift.sh/cli/0.3.7/agx-linux-arm64"
      sha256 "ff9d629c3ec41b3d465cf17a66dc442717452d3ac0d5031f11d240a26a52d560"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
