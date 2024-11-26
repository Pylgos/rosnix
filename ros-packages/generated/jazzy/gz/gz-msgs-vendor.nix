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
  version = "0.0.5-1";
  src = finalAttrs.passthru.sources."gz_msgs_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-msgs10" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_msgs_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "2c5435d57f6475379f2b28888a26b2a008174585";
        hash = "sha256-XQ922f4I6dK4HGhDOKvqa3rGZNSDRdGK2IKzOFCl8o8=";
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
        rev = "d9501cf8ab410288d8ca388971eece8ff40a67e3";
        hash = "sha256-GBEylFQvR2MWOIivW2+MGy//jjewId41mk8qpLfoaYM=";
      };
    };
  });
  meta = {
    description = "Vendor package for: gz-msgs10 10.3.1 Gazebo Messages: Protobuf messages and functions for robot applications";
  };
})
