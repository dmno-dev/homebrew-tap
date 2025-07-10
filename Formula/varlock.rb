
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "refs/tags/@varlock/nextjs-integration@0.0.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "63ce855770059fa9ccd555bc9bd2c3204a561f2850fd88dede6e5ba6f73b6661"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "4fc96d52f4c4417e882607f825a74d42d88805c224f888e9a995aeb415548aa4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "8e2e03bf41ff70ebb6a35c4c308892b38595ebfb495e0721a4e9b65be8d1c327"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "112278041631cf276ed604046359df2186e5942211fc57bd6dd23daf9ec6b2ac"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--post-install", "brew"
  end
end
