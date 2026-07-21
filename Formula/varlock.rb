
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.13.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "df6d193d8526bc7a2ea1bbc5f219364d53bafdb750639d6c524704034850081c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "ec901ab5465f10556c3578dd2404746e11df2a92369eaacff5c6408bea3ef3bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "3682f1f477d433e20e082d73c55ca30925fe2de0d650c41949f7ac9c4aa87039"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "d90aa07cb2d910c83f054af52a6ce59f2dd597bbe8c50b1bc51ebc95fb147966"
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
    assert_equal "1.13.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
