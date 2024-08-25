{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  cmake,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  git,
  glew,
  glfw3,
  gtest,
  hdf5,
  libusb-compat-0_1,
  libusb1,
  opencv,
  openscenegraph,
  pkg-config,
  protobuf,
  python3Packages,
  substituteSource,
  unzip,
  wget,
}:
let
  sources = rec {
    openeb_vendor = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-source";
        url = "https://github.com/ros2-gbp/openeb_vendor-release.git";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package cmake curl git pkg-config unzip wget ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ffmpeg glew glfw3 hdf5 libusb-compat-0_1 libusb1 opencv openscenegraph protobuf python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [ "hdf5-tools" ];
  meta = {
    description = "Wrapper around openeb";
  };
}
