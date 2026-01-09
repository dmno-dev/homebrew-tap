
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.5"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "24c7b477829cd54d5875fbf7a1c821656021483ebca8f1a6f8e7e4c3c7e514a6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "3167de7949ac41107d21129190673879683c397415780d689ef09dfd092b3b1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "9b3bda774caef84bbf46d8015fda91f978a60a4caa5b750ee57fc801aea4eb89"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "3539d4e4037491af2902d95360a1fcf4dcc0615e568299869d7018f928f91ee0"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.5", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
