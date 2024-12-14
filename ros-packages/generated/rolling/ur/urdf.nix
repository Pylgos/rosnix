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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."urdf";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils tinyxml2-vendor urdf-parser-plugin urdfdom urdfdom-headers ];
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf" = substituteSource {
      src = fetchgit {
        name = "urdf-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "14d3af7b618363e1539359b235e20a78e418c8c8";
        hash = "sha256-3SDn8xPz7wOg6KIBBAJ1gYPiE2PEO69CsAzhnJzwspE=";
      };
    };
  });
  meta = {
    description = "This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model. The code API of the parser has been through our review process and will remain backwards compatible in future releases.";
  };
})
