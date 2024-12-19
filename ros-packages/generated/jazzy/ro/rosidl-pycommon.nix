{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "4.6.5-1";
  src = finalAttrs.passthru.sources."rosidl_pycommon";
  propagatedNativeBuildInputs = [ rosidl-parser ];
  propagatedBuildInputs = [ rosidl-parser ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_pycommon" = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "45278d2f1d122ff361767426788af60c84c161a3";
        hash = "sha256-Jftmv1+Dp2LjA4Zj/KSG1yc/RFBa9zfVr7e/228lEHI=";
      };
    };
  });
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
})
