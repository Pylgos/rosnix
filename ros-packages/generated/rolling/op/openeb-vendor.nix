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
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."openeb_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "curl" "git" "hdf5-tools" "pkg-config" "unzip" "wget" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "ffmpeg" "libglew-dev" "libglfw3-dev" "libhdf5-dev" "libopencv-dev" "libopenscenegraph" "libusb" "libusb-1.0" "libusb-1.0-dev" "libusb-dev" "protobuf-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "curl" "git" "hdf5-tools" "pkg-config" "unzip" "wget" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "ffmpeg" "libglew-dev" "libglfw3-dev" "libhdf5-dev" "libopencv-dev" "libopenscenegraph" "libusb" "libusb-1.0" "libusb-1.0-dev" "libusb-dev" "protobuf-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "openeb_vendor" = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-source";
        url = "https://github.com/ros2-gbp/openeb_vendor-release.git";
        rev = "b2ece5b0d4102f833d4fe715fe997eab30893f51";
        hash = "sha256-83RQNube+Kr0LP0Lb28RtlP4Kiv6gwm7hINSz4cz/7o=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros-event-camera/openeb.git";
          to = "VCS_TYPE path VCS_URL ${sources."openeb_vendor/openeb"}";
        }
      ];
    };
    "openeb_vendor/openeb" = substituteSource {
      src = fetchgit {
        name = "openeb-source";
        url = "https://github.com/ros-event-camera/openeb.git";
        rev = "65e4aa3194d7afe16829d6fc1c80309a5952252c";
        hash = "sha256-QBkkd1HRCNsQaoBF5Ln3kLd2DmHy7Xr6HRJp4uDF+Rs=";
      };
    };
  });
  meta = {
    description = "\n    Wrapper around openeb\n  ";
  };
})
