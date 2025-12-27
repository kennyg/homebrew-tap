class Tome < Formula
  desc "AI Agent Skill Manager - Your spellbook for AI agent capabilities"
  homepage "https://github.com/kennyg/tome"
  url "https://github.com/kennyg/tome/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "de0e286b438c47cc58610c8908224b6be2cb972172f33fd7b2a7f067b181061a"
  license "MIT"
  head "https://github.com/kennyg/tome.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/kennyg/tome/cmd.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tome edition")
  end
end
