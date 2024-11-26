{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  dynamixel-sdk,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rt_manipulators_cpp";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."rt_manipulators_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ dynamixel-sdk yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "yaml-cpp" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rt_manipulators_cpp" = substituteSource {
        src = fetchgit {
          name = "rt_manipulators_cpp-source";
          url = "https://github.com/ros2-gbp/rt_manipulators_cpp-release.git";
          rev = "1f5ee7c892f026a96f5cab09961b0622ef6f5f4c";
          hash = "sha256-TATkY16Ygvjapj2LsTtV0TxnVp37lOfJddAYTTuaCqE=";
        };
      };
    });
  };
  meta = {
    description = "RT Manipulators C++ Library";
  };
})
