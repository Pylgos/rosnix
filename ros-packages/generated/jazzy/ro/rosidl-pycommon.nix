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
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_pycommon";
  propagatedNativeBuildInputs = [ rosidl-parser ];
  propagatedBuildInputs = [ rosidl-parser ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidl_pycommon" = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "52cb2514bde8ec8e606415c200f80e21ec8b391f";
        hash = "sha256-HwtksPYLXC/1Md1Fnyo0Ofiui7YhfDehVHn6SqcKSGM=";
      };
    };
  });
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
})
