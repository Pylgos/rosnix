{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-math-vendor,
  gz-tools-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_msgs_vendor";
  version = "0.3.3-1";
  src = finalAttrs.passthru.sources."gz_msgs_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-msgs" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-msgs" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_msgs_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "96e33a735694d696c77d6db045762632304b1155";
        hash = "sha256-eQpBw1oZu7vO0kzrr2+t729bPAvUP/5bbWy4mQ4cxOs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_msgs_vendor/gz-msgs"}";
        }
      ];
    };
    "gz_msgs_vendor/gz-msgs" = substituteSource {
      src = fetchgit {
        name = "gz-msgs-source";
        url = "https://github.com/gazebosim/gz-msgs.git";
        rev = "7fa73dc1119d65635948ea0c59cb415b7e8f96c7";
        hash = "sha256-LinEaHnHD/m+BmjBBq198W8XqOOc9yVXfDnwUrSz9+Y=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-msgs 12.0.1\n\n    Gazebo Messages: Protobuf messages and functions for robot applications\n  ";
  };
})
