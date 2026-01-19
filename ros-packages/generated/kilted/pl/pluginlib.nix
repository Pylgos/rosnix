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
  tinyxml2-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pluginlib";
  version = "5.6.2-1";
  src = finalAttrs.passthru.sources."pluginlib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp class-loader rcpputils rcutils tinyxml2-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp class-loader rcpputils rcutils tinyxml2-vendor ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pluginlib" = substituteSource {
      src = fetchgit {
        name = "pluginlib-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "aa1a30ff8245d74038bd8b5fb68b781de1afb661";
        hash = "sha256-EKt3Hz/R3EkxifsfHmj/FpV0zWfTBK7fUqqaLlXMwmQ=";
      };
    };
  });
  meta = {
    description = "\n    The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure.\n    To work, these tools require plugin providers to register their plugins in the package.xml of their package.\n  ";
  };
})
