{ lib
, pythonOlder
, buildPythonPackage
, fetchPypi
, cvxopt
, ecos
, multiprocess
, numpy
, osqp
, scipy
, scs
, six
  # Check inputs
, nose
}:

buildPythonPackage rec {
  pname = "cvxpy";
  version = "1.1.3";

  disabled = pythonOlder "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "6ce061bd431b05b8c47faa5044cdd5ad5654da4a4bd5c4360bd3c786ee4c64eb";
  };

  propagatedBuildInputs = [
    cvxopt
    ecos
    multiprocess
    numpy
    osqp
    scipy
    scs
    six
  ];

  checkInputs = [ nose ];
  checkPhase = ''
    nosetests cvxpy
  '';

  meta = with lib; {
    description = "A domain-specific language for modeling convex optimization problems in Python.";
    homepage = "https://www.cvxpy.org/";
    downloadPage = "https://github.com/cvxgrp/cvxpy/releases";
    license = licenses.asl20;
    maintainers = with maintainers; [ drewrisinger ];
  };
}
