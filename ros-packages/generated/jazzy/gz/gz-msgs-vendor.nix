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
let
  sources = mkSourceSet (sources: {
    "gz_msgs_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_msgs_vendor-source";
        url = "https://github.com/ros2-gbp/gz_msgs_vendor-release.git";
        rev = "25905a007be43a355645730c7be99fad30cc7636";
        hash = "sha256-0geXZdTt4n0yj0TwzXFxblk35LrxZePiOVTUBPLkwH4=";
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
        rev = "0da35a8b1239c3186e398ac4ed2dbe1762f3aaa4";
        hash = "sha256-PQT8EpTxafldnKG3hDSXw2P22gLRg2EfMllrzaTaDEw=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_msgs_vendor";
  version = "0.0.4-1";
  src = finalAttrs.passthru.sources."gz_msgs_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-math-vendor gz-tools-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-msgs10" "protobuf-dev" "python3" "python3-protobuf" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Vendor package for: gz-msgs10 10.3.0 Gazebo Messages: Protobuf messages and functions for robot applications";
  };
})
