
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.3.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "b4a5f50d8ac56159a7fd86298b738afd3938a92955a97a86ab500ff7e50fe536"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "8363e2a660d511e6781ad5ba83b3b3f64e00317cacf1690581fdb851b111f5fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "4db4a691584c351fe8b3b7f1eb98997bd4458d0e3ae3380da153c607e8c8a891"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "06ff2eab5d9d7ef10668cdebaf6142e2c2a68982f75bd882e01378af526ea958"
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
    assert_equal "1.3.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
