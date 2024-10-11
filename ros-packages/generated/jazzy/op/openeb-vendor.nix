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
let
  sources = mkSourceSet (sources: {
    "openeb_vendor" = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-source";
        url = "https://github.com/ros2-gbp/openeb_vendor-release.git";
        rev = "440b6ce21ad76d41afe5c326721b379b6f3e8b06";
        hash = "sha256-MXdaBPIgCPVvdqSnCICqt7HjzyFe9RjZ29hxM3zcYTI=";
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
        rev = "53b3618935f90dcc0f64993ccbb79514384404b0";
        hash = "sha256-cyEZ7tREAeILGQA7Jpwh5tndI+HFrq9Uj7LL8yUgL0o=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "openeb_vendor";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."openeb_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "curl" "git" "hdf5-tools" "pkg-config" "unzip" "wget" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "ffmpeg" "libglew-dev" "libglfw3-dev" "libhdf5-dev" "libopencv-dev" "libopenscenegraph" "libusb" "libusb-1.0" "libusb-1.0-dev" "libusb-dev" "protobuf-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Wrapper around openeb";
  };
})
