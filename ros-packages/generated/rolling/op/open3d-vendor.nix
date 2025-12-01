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
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL               \${O3D_URL}";
          to = "URL ${sources."open3d_vendor/open3d-devel-linux-x86_64-cxx11-abi-cuda-0"}";
        }
      ];
    };
    "open3d_vendor/open3d-devel-linux-x86_64-cxx11-abi-cuda-0" = substituteSource {
      src = fetchzip {
        name = "open3d-devel-linux-x86_64-cxx11-abi-cuda-0-source";
        url = "https://github.com/isl-org/Open3D/releases/download/v0.19.0/open3d-devel-linux-x86_64-cxx11-abi-cuda-0.19.0.tar.xz";
        hash = "sha256-mV9O9qroi0AsxAe7HEVWxS1x3ymyfNYiSEurF/wG9v0=";
      };
    };
  });
  meta = {
    description = "Open3D is an open-source library that supports rapid development of software that deals with 3D data.";
  };
})
