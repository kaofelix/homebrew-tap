class Skulls < Formula
  desc "Dead simple skills installer"
  homepage "https://github.com/kaofelix/skulls"
  url "https://github.com/kaofelix/skulls/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ea576d038bd6335f16b6967dcc5c519f2171164d2023ac3f5acdcacf854bff3e"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"skulls"), "./cmd/skulls"
  end

  test do
    output = shell_output("#{bin}/skulls --help")
    assert_match "skulls", output
  end
end
