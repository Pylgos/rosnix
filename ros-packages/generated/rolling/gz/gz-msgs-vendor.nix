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
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."gz_msgs_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = [ gz-cmake-vendor ];
  propagatedBuildInputs = [ gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-msgs11" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "gz_msgs_vendor" = substituteSource {
        src = fetchgit {
          name = "gz_msgs_vendor-source";
          url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
          rev = "129340be47bce1bc4b4cadcc3819e291b22b84d2";
          hash = "sha256-ML1KCQVsEEKKeaxviCkSCAgbQH9KUEmi/+yRKzwX5Zo=";
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
          rev = "de833cd9c79b5b839bc2a8bcba1af2fe5b3f1e76";
          hash = "sha256-bOHw1CvQDGB8CaJnZF3CwsdeQJyn6LOvufRxbH8ufZc=";
        };
      };
    });
  };
  meta = {
    description = "Vendor package for: gz-msgs11 11.0.1 Gazebo Messages: Protobuf messages and functions for robot applications";
  };
})
