{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "apriltag_mit";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."apriltag_mit";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" "libopencv-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "apriltag_mit" = substituteSource {
        src = fetchgit {
          name = "apriltag_mit-source";
          url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
          rev = "fce3634b5b12e17f90fa8c0f404fa7fca1bcb8cc";
          hash = "sha256-1WPBqs7VNnRYSSvoR7Jfk3a9CYGHOzfdA0KQgv/tfck=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 package wrapper for the MIT apriltag detector";
  };
})
