
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.9"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a42d2f7b398aab0d1da88fed188b7743b0876ff06d007fa50931abe5d3627f17"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "ea5e291e91675e1ceca6361f3ab873d193f9a0f69dffe49210f3063d01920f5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "3426b4a8535db242b61aebfe9f2506b2d7ee53ccd730180cdc1ff4a79333fc7e"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "644b56282b82861a9156066f54dff759fe83bd3d66a16c7919a4e86291e85eb5"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.9", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
