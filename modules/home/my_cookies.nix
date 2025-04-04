{ lib, buildPythonPackage, fetchFromGitHub, keyring, pycryptodome }:

buildPythonPackage rec {
  pname = "my_cookies";
  version = "0.1.0"; # Replace with the actual version if known

  src = fetchFromGitHub {
    owner = "kaiwk";
    repo = "my_cookies";
    rev = "master"; # Use a specific commit hash or tag for reproducibility
    sha256 = lib.fakeSha256; # Replace with the actual sha256 after the first build
  };

  # Specify the package's dependencies
  propagatedBuildInputs = [ keyring pycryptodome ];

  # Optional: Include tests if available
  doCheck = true;
  checkPhase = ''
    pytest tests
  '';

  meta = with lib; {
    description = "A Python package for retrieving cookies from browsers.";
    homepage = "https://github.com/kaiwk/my_cookies";
    license = licenses.mit;
    maintainers = with maintainers; [ yourGitHubUsername ];
  };
}

