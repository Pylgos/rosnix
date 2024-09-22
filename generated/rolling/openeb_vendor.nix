{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    openeb_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "openeb_vendor-source";
        owner = "ros2-gbp";
        repo = "openeb_vendor-release";
        rev = "4177e27b5c6f57f87689da879aafae15f05028ad";
        hash = "sha256-L3/O55ZRFe3I/pKMTbfJspHt1rNfrJnDD25x1g839lA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/prophesee-ai/openeb.git";
          to = "VCS_TYPE path VCS_URL ${openeb_vendor-vendor_source-openeb-0}";
        }
      ];
    };
    openeb_vendor-vendor_source-openeb-0 = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-vendor_source-openeb-0-source";
        url = "https://github.com/prophesee-ai/openeb.git";
        rev = "53b3618935f90dcc0f64993ccbb79514384404b0";
        hash = "sha256-cyEZ7tREAeILGQA7Jpwh5tndI+HFrq9Uj7LL8yUgL0o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openeb_vendor";
  version = "2.0.0-1";
  src = sources.openeb_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "curl" "git" "hdf5-tools" "pkg-config" "unzip" "wget" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "ffmpeg" "libglew-dev" "libglfw3-dev" "libhdf5-dev" "libopencv-dev" "libopenscenegraph" "libusb" "libusb-1.0" "libusb-1.0-dev" "libusb-dev" "protobuf-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Wrapper around openeb";
  };
}
