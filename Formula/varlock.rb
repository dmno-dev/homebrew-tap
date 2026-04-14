
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.8.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "9b4b992705c5afba68552e882a1cc074600d74b644c7e83b675c18c6fbe07f2b"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "ac8c7de21457808a83cc1c1fc946f454057a452607bdb2e10baa8798798b37d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "9e0518e8ebcb335234a26d280caff389df6d098d748c5dcdad9509546c077210"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "ea62bf83bdb50c944d1552fc511daa95365ee0a52e0d01c355a580be483bb6c6"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.8.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
