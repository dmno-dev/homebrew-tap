
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.18.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "dc6f5ff7510429b7e88ef6d3b50cc730b59e163a4b2a8b913fd22776f88184e3"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "d7b82971123e0cc7773382a646194f9209c150f1ab8d010ff861a1b5f99702fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "fb59d701fe3dc3d72a4b51ea3878e26362858906e8d00d8e536dd7e67ad5a427"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "46727fed3d98b059ceb421b24ca952c997db8f3f9cef4088b659e338a6037fcd"
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
    assert_equal "1.18.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
