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
  version = "5.1.4-2";
  src = finalAttrs.passthru.sources."rosidl_pycommon";
  propagatedNativeBuildInputs = [ rosidl-parser ];
  propagatedBuildInputs = [ rosidl-parser ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_pycommon" = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "8513235110b5254023cf8279c505c7f171fe24bb";
        hash = "sha256-fLylyMFu6TlzEN7wEGWvrcoYIhcpXddh/JqCSW0hrKo=";
      };
    };
  });
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
})
