
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "@varlock/vite-integration@0.0.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "aac050cd042d44aeb562eebadd77f89a63599a487aac0df7a08abd9b386874dc"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "ab81020b47c78834b2ea95cfcd1b63b6a1ce22c8f806d598a0db503edac976b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "756484c1426178a8b1d7233fc91593fb454e3192c68f07c681a108e156c5da8f"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "c9130b9e4575a354a072bb86638bcd8db74c0f25ae41e754d1612609fa87b545"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "@varlock/vite-integration@0.0.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
