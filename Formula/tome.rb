class Tome < Formula
  desc "AI Agent Skill Manager - Your spellbook for AI agent capabilities"
  homepage "https://github.com/kennyg/tome"
  url "https://github.com/kennyg/tome/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0b50b0bb7c56757f58376e1103653fe91f8b2a8ec296bfdc3cebfdcf9dbb804e"
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
