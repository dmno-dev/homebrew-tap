
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.4"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "21b3effea128259bf8b19f5db671aae1827ed57b15e1fab46d30479b126ca271"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "50aa6509a02038be28d8569dc472dcd560e78b2a42536fca2fb1dd7a70c573da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "005417b390a5dc87d4c692a44c15be22d90f0608185b28a35884d8e006a09601"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "46e83a7016cb3b4f826a5d6c3657877e83d75610f5a788d07d8409507619174a"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
