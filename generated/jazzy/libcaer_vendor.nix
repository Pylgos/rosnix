{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  libusb1,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libcaer_vendor = substituteSource {
      src = fetchgit {
        name = "libcaer_vendor-source";
        url = "https://github.com/ros2-gbp/libcaer_vendor-release.git";
        rev = "0424ca45235d713578a786c73480717ad9b316d6";
        hash = "sha256-qbXJBtbU/GC6K5vEd6Dt1V5gnwyiWAhWD/mya3K/z40=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://gitlab.com/inivation/dv/libcaer.git";
          to = "VCS_TYPE path VCS_URL ${libcaer_vendor-vendor_source-libcaer-0}";
        }
      ];
    };
    libcaer_vendor-vendor_source-libcaer-0 = substituteSource {
      src = fetchgit {
        name = "libcaer_vendor-vendor_source-libcaer-0-source";
        url = "https://gitlab.com/inivation/dv/libcaer.git";
        rev = "8710e73ceb21d9fb4f74ead62ca3fae42d828997";
        hash = "sha256-aTQw4K7otT7MP6qNediqzgjqbM6Wldg6bzwBTzX34II=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer_vendor";
  version = "1.3.0-1";
  src = sources.libcaer_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around libcaer library";
  };
}
