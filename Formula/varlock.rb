
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.7.2"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "e0094c5742ec0090e9bb76a4f268dae3a46d92c90634ca05db0873deba8774d6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "cffd0f3759cb7fc0113d2af24e3040a5f9e8780d6d84443d32ea27aa164e3abe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "81990db983828d9ac9d45ee38f7233384aa481f3a0e447bf6270132885056135"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "4419cb205c352047ab113d9ff47c667cef1e7616320b5fe106eaa074d888161e"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.7.2", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
