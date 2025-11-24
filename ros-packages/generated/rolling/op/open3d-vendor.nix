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
  pname = "open3d_vendor";
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."open3d_vendor";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libc++-dev" "libx11" "opengl" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libc++-dev" "libx11" "opengl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "open3d_vendor" = substituteSource {
      src = fetchgit {
        name = "open3d_vendor-source";
        url = "https://github.com/ros2-gbp/open3d_vendor-release.git";
        rev = "9979797f78d67757f99c70b34cbbfcfa9c738ecb";
        hash = "sha256-sgUxHMnlo1dGcZsPx+fcxg0aGQR7/q2Ov558W4WRlLo=";
      };
    };
  });
  meta = {
    description = "Open3D is an open-source library that supports rapid development of software that deals with 3D data.";
  };
})
