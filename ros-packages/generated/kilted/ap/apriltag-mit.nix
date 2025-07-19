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
  version = "1.0.3-2";
  src = finalAttrs.passthru.sources."apriltag_mit";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" "eigen" "libboost-dev" "libopencv-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "clang-tidy" "eigen" "libboost-dev" "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "apriltag_mit" = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "9c99e909115c88afff04137de581dcffff2e46e5";
        hash = "sha256-1WPBqs7VNnRYSSvoR7Jfk3a9CYGHOzfdA0KQgv/tfck=";
      };
    };
  });
  meta = {
    description = "ROS2 package wrapper for the MIT apriltag detector";
  };
})
