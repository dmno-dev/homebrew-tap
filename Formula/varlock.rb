
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a10e0af597814abb588bca86c8c8eb45ba5230fc0653f0c58608830275de1dbd"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "24f33e8fa51f3a08759911c84295e70fdf008e294ea49b28967c51b84cfb620a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "0e6cea3fcbe3b0287629acd20617a0f1398b89f8349cfb3cd9091085e8e91ce9"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "8a42f32aa5d65e457d8de2091a35a87623a72b88d165e36a444f756f3368b994"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
