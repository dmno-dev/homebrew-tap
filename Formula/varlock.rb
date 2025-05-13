class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  version "0.0.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-macos-x64.tar.gz"
      sha256 "XXX"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-macos-arm64.tar.gz"
      sha256 "XXX"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-linux-x64.tar.gz"
      sha256 "XXX"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-#{version}-linux-arm64.tar.gz"
      sha256 "XXX"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--version"
  end
end