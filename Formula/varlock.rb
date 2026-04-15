
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.8.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "4c40a0c2be4b825a8f22c05c46feb171effabe841ab6d53725e75092c299cd18"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "a27f42d6ed171ed41aca0ad3905b3c5d953bae52938af37db53db801dbb9a9c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "c695480855ffedd23f6debb176ca8bbda5ec429f7c4e0d3b73f77a78ef380692"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "d0b7448be83d798eda0a23b3d774dd7fac74416ed820488cc25210eb7ff80bb5"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.8.2", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
