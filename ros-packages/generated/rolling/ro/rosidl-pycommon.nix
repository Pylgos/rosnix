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
  version = "4.9.3-1";
  src = finalAttrs.passthru.sources."rosidl_pycommon";
  propagatedNativeBuildInputs = [ rosidl-parser ];
  propagatedBuildInputs = [ rosidl-parser ];
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_pycommon" = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "9a3c9fd163e701c9dcd9fa7fcfaee659912cfc43";
        hash = "sha256-6A3SRg93252wH8S73SGzFAEFAvVFFM5maFKmiIAA4gA=";
      };
    };
  });
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
})
