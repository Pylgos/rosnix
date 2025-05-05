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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."urdf";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ pluginlib rcutils tinyxml2-vendor urdf-parser-plugin urdfdom urdfdom-headers ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ pluginlib rcutils tinyxml2-vendor urdf-parser-plugin urdfdom urdfdom-headers ];
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "urdf" = substituteSource {
      src = fetchgit {
        name = "urdf-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "f8d32f02032e355ac42eed1482453ccf19b73fca";
        hash = "sha256-DxgD5VrY0Ads/mQO78UL0D0u0aKlDPAq3h9lMIdMo6w=";
      };
    };
  });
  meta = {
    description = "\n    This package contains a C++ parser for the Unified Robot Description\n    Format (URDF), which is an XML format for representing a robot model.\n    The code API of the parser has been through our review process and will remain\n    backwards compatible in future releases.\n  ";
  };
})
