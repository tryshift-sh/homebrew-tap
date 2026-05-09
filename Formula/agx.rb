class Agx < Formula
  desc "Agent Execute — the CLI shortcut to everything"
  homepage "https://agx.tryshift.sh"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://agx.tryshift.sh/cli/0.3.14/agx-darwin-arm64"
      sha256 "ae6e6fd158c02edb2b7c1998864c273490489fc594bc6ba9d85e601e787da23b"
    else
      url "https://agx.tryshift.sh/cli/0.3.14/agx-darwin-x64"
      sha256 "cdb638ae6f52807b0d3fdc7723a2da83443edc4f586f81d5c3b57a031d027085"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://agx.tryshift.sh/cli/0.3.14/agx-linux-x64"
      sha256 "533fde81b163ff6de3254504acc699240b480daee63cccf8e6ffc5436de835a6"
    else
      url "https://agx.tryshift.sh/cli/0.3.14/agx-linux-arm64"
      sha256 "30dcf8d7ddad856666f01598a2cb73f28ca9c1a498af9ef12386a02638967035"
    end
  end

  def install
    bin.install Dir["*"].first => "agx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agx -v")
  end
end
