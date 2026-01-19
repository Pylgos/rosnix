{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
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
  tinyxml2-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pluginlib";
  version = "5.4.4-1";
  src = finalAttrs.passthru.sources."pluginlib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp class-loader rcpputils rcutils tinyxml2-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp class-loader rcpputils rcutils tinyxml2-vendor ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "pluginlib" = substituteSource {
      src = fetchgit {
        name = "pluginlib-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "47d152a6ffae274557a138720b4ea696cfe6270c";
        hash = "sha256-OMjVhybI5jHbHiMGYBMubUPuz9nioV6bPxrwCehsj1I=";
      };
    };
  });
  meta = {
    description = "\n    The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure.\n    To work, these tools require plugin providers to register their plugins in the package.xml of their package.\n  ";
  };
})
