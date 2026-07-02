class Docassert < Formula
  include Language::Python::Virtualenv

  desc "Unit testing for business documents (PMO as Code reference implementation)"
  homepage "https://docassert.com"
  url "https://files.pythonhosted.org/packages/dc/3d/2b4b1e1bcf21985cc53e164e7b844b3f4d6560e91333ebe9f2b8f8acc9e9/docassert-0.7.0.tar.gz"
  sha256 "9f53714a160a8d4e2f2e96c585cd9fe1677c0797ce96f5a59ad006c2a89e3bb4"
  license "Apache-2.0"

  depends_on "python@3.12"

  # Core structural-check dependencies only. The optional extras (ai, convert)
  # are pip territory: pipx inject docassert anthropic python-docx pypdf
  # NOTE: jsonschema is pinned to 4.17.x — the last line before it grew a
  # compiled Rust dependency (rpds-py) — to keep this formula pure-Python + C.
  resource "attrs" do
    url "https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985/attrs-26.1.0.tar.gz"
    sha256 "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
  end

  resource "pyrsistent" do
    url "https://files.pythonhosted.org/packages/ce/3a/5031723c09068e9c8c2f0bc25c3a9245f2b1d1aea8396c787a408f2b95ca/pyrsistent-0.20.0.tar.gz"
    sha256 "4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8f265a4"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/36/3d/ca032d5ac064dff543aa13c984737795ac81abc9fb130cd2fcff17cfabc7/jsonschema-4.17.3.tar.gz"
    sha256 "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "python-frontmatter" do
    # 1.1.0: setuptools build backend — avoids fetching hatchling at install time
    url "https://files.pythonhosted.org/packages/96/de/910fa208120314a12f9a88ea63e03707261692af782c99283f1a2c8a5e6f/python-frontmatter-1.1.0.tar.gz"
    sha256 "7118d2bd56af9149625745c58c9b51fb67e8d1294a0c76796dafdc72c36e5f6d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/docassert --version")
    system bin/"docassert", "init"
    assert_path_exists testpath/"criteria/charter.criteria.yaml"
  end
end
