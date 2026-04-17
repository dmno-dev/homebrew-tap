
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.9.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "3609d97b820115bc41f0777714217362d5ee849852ead510c5d17c2c730f0ee0"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "94ff587b7d88198c314b36b190c75592cea863602bfa9774c7cd23ec446b7fca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "38238190cbd79401800ed686bc4af026b4b26315ec31c0ff21b38b2f3093b981"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "ee3c3ebf37d1642d5ec387851e3ac8cd2bebf74fe4ba0a8507752f08f852b3ee"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.9.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
