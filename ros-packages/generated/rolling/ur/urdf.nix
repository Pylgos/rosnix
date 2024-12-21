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
  tinyxml2-vendor,
  urdf-parser-plugin,
  urdfdom,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."urdf";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils tinyxml2-vendor urdf-parser-plugin urdfdom urdfdom-headers ];
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf" = substituteSource {
      src = fetchgit {
        name = "urdf-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "d046181fec6f538fe054f6b96c6f94c6cb432601";
        hash = "sha256-mJraaVQLQeEZvNeM+U09G6cBnIyd8YuDjZBY7S/oqWE=";
      };
    };
  });
  meta = {
    description = "This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model. The code API of the parser has been through our review process and will remain backwards compatible in future releases.";
  };
})
