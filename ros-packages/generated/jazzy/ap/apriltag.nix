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
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-numpy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "apriltag" = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "3bed8a0d532282988bf56fa7295b168b35f12059";
        hash = "sha256-6jPxacqfvL7dIgZC/kZpWhYDF/cnGL5c4JFVhTsx7gg=";
      };
    };
  });
  meta = {
    description = "AprilTag detector library";
  };
})
