{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-parser,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosidl_pycommon";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."rosidl_pycommon";
  propagatedNativeBuildInputs = [ rosidl-parser ];
  propagatedBuildInputs = [ rosidl-parser ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_pycommon" = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "955bb311d6523d97a14f3e389cca155b4e10f0e1";
        hash = "sha256-PlKcqH2eSv1HktdgnpLEzvgZflMhy43m5AtudyyaOjU=";
      };
    };
  });
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
})
