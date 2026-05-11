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
  version = "2.14.0-1";
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
        rev = "8c9336b5ab15dcee3c65ad9f78286bb65d4e52d1";
        hash = "sha256-kRAVXrEZPyjsraQwwZpui4gYEPctSiSmjdP7+g4ppY0=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a C++ parser for the Unified Robot Description\n    Format (URDF), which is an XML format for representing a robot model.\n    The code API of the parser has been through our review process and will remain\n    backwards compatible in future releases.\n  ";
  };
})
