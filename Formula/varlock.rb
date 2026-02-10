
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.2.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "e0bc9c8135965565dfa36001ce41473ec1f0312c89a94f90028bf5e33ba5e9d7"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "9e37cd93091c7e236e9e66bdab91e44115d6fae271bc67eac734cdd56e2ab265"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "ff798d133f9275969c95df02a3c486676e514eda957d410e997145da7b89fde6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "63954ad1abb22210422e7a4c2a13791cc34de271b6aec4b5f0ce7c0268bea050"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.2.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
