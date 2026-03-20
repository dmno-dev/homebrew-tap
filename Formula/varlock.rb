
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.6.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "dc99f4084bfb0c674e302db9d393aa20b40fdfe1408d9fe8833441d4feeef354"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "f8f8151ab66b6cf4b415fe08ef9b0a1c568ac06669526b241998221c5acdc656"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "e10479e641feb3d00187bf3040489fb219f890b7b6cf694166c3976eeae66ffa"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "d94eddf88d3d3a175b6416a195154e7b6d3b7df14f3119425df80800394e9e8b"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.6.2", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
