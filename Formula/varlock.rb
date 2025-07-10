
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "refs/tags/@env-spec/parser@0.0.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "cdb406aebf0265005dfa710ed3feb26faf3b6e9ada7e9e94d586eb6b475c4d1a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "e86a85d93497d20f3d484c1dbeeabb8c0d1c61a21ecde0cf36516251d3b90efa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "12a9714f299894241de93f0eaa4e3c50f889e4f9e124d9188c176c0d885ad9af"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8c869e317e6c4cec4c458279010ee9fecb09661ad1a203cc6e28ca6ca382d357"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--post-install", "brew"
  end
end
