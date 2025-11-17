
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "2667b0c51500ea9084bb22aaf5998dab933c9a0743355e7775ca2c5528b7531c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "d8e87e77fbffb8385a960a7bb2ab76ed1bbb39864123b9af373983e799ef41f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "fe1f78a4a2fab536f34b2605f11eced367c26ad71fdd47b39f6598b015635ddf"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8914e2c29b30339646f245afa4baeda8fc5bfb0832fdbb96f9d6217fd5e1e836"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
