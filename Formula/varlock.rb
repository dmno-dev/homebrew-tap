
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.7.4"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "1081ea8269a34ab57ecacacc22976fc7ca6ea8e0a40ff7295be92bf9792be791"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "e6c0b38dbb7badd28a763c4d6b9234d283177074922b03117e9c42f191b4cbc1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "8fa86414e34a289f2a85f21fa5f775e459b2519595f5b1aa76f7457bcaf9a616"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "eca727fa05076c1f90108482584e53cb335e4e00ef88f411d5f9afa72d2da7bb"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.7.4", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
