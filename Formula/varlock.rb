
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "43ced948e624f5e35d5349f235e820e1ad2c4903c2a5593dd839c5eb9e3389e3"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "a7b7086d7cd7cde25fa5c3ad444f4ee2a8e4428bb3306cb283bd6a0ff667c284"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "c319f136c7f69f4048710f4e336a2d8611daf1ce59faacaa3252e879a105263d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "26f3d62432a58422472fb85cb9c4e531b8649b334f415882ffe2e288a959a16f"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--post-install", "brew"
  end
end
