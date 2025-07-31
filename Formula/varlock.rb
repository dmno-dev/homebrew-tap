
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.7"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "5a6b4e01bfb136e9993e47d2d4bcd151143742dcc88b141e90f0383d1c96e136"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "d99873958693a878a1dfe6cb7ea3e117e73b3cee4c6a7411c91a5ecf2ea416cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "0ed2e6c60ac0925a4de408f68505dff3fee78511f230d6024a3e63a9cf9745ed"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "ce93563dda7798a86d2ed546d687ebade88813e03f9cb8982833e10b9e572eac"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.7", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
