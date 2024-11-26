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
  version = "3.4.2-1";
  src = finalAttrs.passthru.sources."apriltag";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" "python3-numpy" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "apriltag" = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "630ac8b64c23ee222b1ccc070efe20af30497908";
        hash = "sha256-gh98hPfxaAHqN4iEbnlYrBGpiD9urWJSo4Qg5OZgfgE=";
      };
    };
  });
  meta = {
    description = "AprilTag detector library";
  };
})
