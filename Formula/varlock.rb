
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.2.1"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "96f2d7684beac7dad742ea39d2c317efe1e3860440837d92cad8623aa76368e6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "9776ba5d702282aac906823069679c6fbb5c7e210edf61d3d0ec03e352439d86"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "0377a56c162e47e77f0199b23127a49da51fbe93138ff233398ec1989bec350c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "7ea3b7047072848dd813711a3b4de0f36042d6c5e8de0bc962c945efabda9683"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.2.1", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
