
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "refs/tags/@varlock/nextjs-integration@0.0.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "89772cc863c91e219f6df6228e703b107bb603586df63d89ca8fd47f8b323339"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "1a2bb31c64d411a8c7b1e58bd44a442876efabc6920bfcf599561467e19c34a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "0db920feadf26d4b9ec902e74dddc7d3a47fe2979ccc4cfcdff8092d5463fef9"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "673dc7c07dbd926a29dd75ceda64799b668a7649df03db2acc21ff8436b53d43"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--post-install", "brew"
  end
end
