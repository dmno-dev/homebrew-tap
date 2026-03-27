
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.6.4"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "79009a26a2f193b2a5e1e670fd4a8d00b0a9533f9760e473db563d6f34a5b718"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "95f58ae9be3b6e237a1273174ebd021445312335c6d0da8781cf8c08e020a5fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "cb1a17223793ec6472838e2201b88e760814991608a4918ea8ae6ce182833c31"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "7df74f57de3d89ad858311b3195a0bcd66fd13b18e899c6ba93ad65a83c0e19d"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.6.4", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
