{
  ament-cmake,
  ament-cmake-vendor-package,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "openeb_vendor";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."openeb_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "curl" "git" "hdf5-tools" "pkg-config" "unzip" "wget" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "ffmpeg" "libglew-dev" "libglfw3-dev" "libhdf5-dev" "libopencv-dev" "libopenscenegraph" "libusb" "libusb-1.0" "libusb-1.0-dev" "libusb-dev" "protobuf-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "openeb_vendor" = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-source";
        url = "https://github.com/ros2-gbp/openeb_vendor-release.git";
        rev = "018fb3bd1c226ef255d0cd228cb73543f53fb4ea";
        hash = "sha256-6msi+NYEgajKMc/prqG9Iawc2rJnCiUNmlnFXYvM1qw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/prophesee-ai/openeb.git";
          to = "VCS_TYPE path VCS_URL ${sources."openeb_vendor/openeb"}";
        }
      ];
    };
    "openeb_vendor/openeb" = substituteSource {
      src = fetchgit {
        name = "openeb-source";
        url = "https://github.com/prophesee-ai/openeb.git";
        rev = "0391df5ab3bea6d0aa2595a73ccee66a1d9c1093";
        hash = "sha256-r1iZrvfOzMmXL5PRiX49TPczdhZPmOdYW8G46uTtH5Y=";
      };
    };
  });
  meta = {
    description = "Wrapper around openeb";
  };
})
