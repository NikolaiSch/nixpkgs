{ lib
, buildPythonPackage
, fetchPypi
, future
, mock
, pytestCheckHook
, python-dateutil
, pythonOlder
, requests
}:

buildPythonPackage rec {
  pname = "hcloud";
  version = "1.20.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-s4l3DZdKfyC1Eu3PwLQHQpdcIw4yvEURxRjgxJlaXsg=";
  };

  propagatedBuildInputs = [
    future
    requests
    python-dateutil
  ];

  nativeCheckInputs = [
    mock
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "hcloud"
  ];

  meta = with lib; {
    description = "Library for the Hetzner Cloud API";
    homepage = "https://github.com/hetznercloud/hcloud-python";
    changelog = "https://github.com/hetznercloud/hcloud-python/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ liff ];
  };
}
