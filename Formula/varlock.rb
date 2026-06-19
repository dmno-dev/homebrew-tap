
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.7.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "8cd952e85c22918491bd85fc9eccd5e1c8251d4fe2335fe37b751fa6cf9b4459"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "5ec47e0687a4ed6f6c8c3f37194730d1cff77c49d9ae3102b6b27c094681b431"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "56928dd47ec20bbf22ec65c6058f053a66af35cecbb53b5aad8ad10ee884b6f9"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "6178af14c5339c4f7e78416fe5c396a4360e684aba3c7758346c5eb9b9a29e32"
    end
  end

  def install
    bin.install "varlock"

    on_macos do
      libexec.install "VarlockEnclave.app"
    end

    on_linux do
      libexec.install "varlock-local-encrypt"
    end
  end

  test do
    assert_equal "1.7.2", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
