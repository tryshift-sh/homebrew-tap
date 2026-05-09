class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.15/agx-darwin-arm64"
      sha256 "2581a4062dab5d632211c57647127b8ab1516eacee2c24067b996681cfdfc9b8"
    else
      url "https://agx.tryshift.sh/cli/0.3.15/agx-darwin-x64"
      sha256 "0071c8c0d20b3478664a422e51533fb9630faea02c9e405f724e4467b7b68f4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.15/agx-linux-x64"
      sha256 "fb52a309de17aa885d2eb430fc22cb69a0231ba4e102275a069954e7ed773d3a"
    else
      url "https://agx.tryshift.sh/cli/0.3.15/agx-linux-arm64"
      sha256 "2f65be80ce3509d090fa984bb22f8d8a46e801978b30c3012f0ae1d5f7570a9f"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
