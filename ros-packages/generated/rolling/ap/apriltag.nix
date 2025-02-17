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
  pname = "apriltag";
  version = "3.4.3-1";
  src = finalAttrs.passthru.sources."apriltag";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "apriltag" = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "fba6204f5b51962605e0014e7cb9d34d3d174ce9";
        hash = "sha256-6jPxacqfvL7dIgZC/kZpWhYDF/cnGL5c4JFVhTsx7gg=";
      };
    };
  });
  meta = {
    description = "AprilTag detector library";
  };
})
