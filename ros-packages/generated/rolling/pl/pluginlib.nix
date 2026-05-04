{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pluginlib";
  version = "5.8.4-2";
  src = finalAttrs.passthru.sources."pluginlib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp class-loader rcpputils rcutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tinyxml2" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp class-loader rcpputils rcutils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pluginlib" = substituteSource {
      src = fetchgit {
        name = "pluginlib-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "2ed746be313999d5b5c3ea882a393b748ff449d2";
        hash = "sha256-apbA/W/WaL12ftdmI8Qne0dqgMWK0pPOIRxvy21HB60=";
      };
    };
  });
  meta = {
    description = "\n    The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure.\n    To work, these tools require plugin providers to register their plugins in the package.xml of their package.\n  ";
  };
})
