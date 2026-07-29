
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.14.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a5ec207337c48977dc825c4c8fc7c2efc29b312b1da3145d7a75f978cb4dfc6a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "802e3ecc8a310734d0af71b3c4022af8bcdcf80ce40e211ce5c1d3ca7e70cf66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "7c1d62cc496c4ec271b74a2a967ee5285abb9ec5c3736971a7243f3c27ad3c7c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "11b5097bd24c5e579997773ba232c083a8a893b291b9dad8b554b0ab55ac9103"
    end
  end

  def install
    bin.install "varlock"

    on_macos do
      libexec.install "VarlockEnclave.app"
    end

    on_linux do
      libexec.install "varlock-local-encrypt"
    end
  end

  test do
    assert_equal "1.14.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
