{
  ament-cmake-google-benchmark,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcutils,
  rosSystemPackages,
  substituteSource,
  urdf-parser-plugin,
  urdfdom,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf";
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."urdf";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ pluginlib rcutils urdf-parser-plugin urdfdom urdfdom-headers ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tinyxml2" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils urdf-parser-plugin urdfdom urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf" = substituteSource {
      src = fetchgit {
        name = "urdf-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "9066af37df0451668c00b6e0fea880e67674da53";
        hash = "sha256-d5mQxFcxumbq1SLW4+7N7gWqp/HXWWsjqWVFTnBhd6U=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a C++ parser for the Unified Robot Description\n    Format (URDF), which is an XML format for representing a robot model.\n    The code API of the parser has been through our review process and will remain\n    backwards compatible in future releases.\n  ";
  };
})
