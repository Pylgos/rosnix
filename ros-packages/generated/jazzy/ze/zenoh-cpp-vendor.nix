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
  pname = "zenoh_cpp_vendor";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."zenoh_cpp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cargo" "clang" "git" ]; };
  passthru.sources = mkSourceSet (sources: {
    "zenoh_cpp_vendor" = substituteSource {
      src = fetchgit {
        name = "zenoh_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/rmw_zenoh-release.git";
        rev = "bd47ef4fc31f76750687ef211d54a562486e2073";
        hash = "sha256-0+i/ugN7ud0Cdpc5hv4a9eKZRHl1qiWUadtCvnzr2cY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/eclipse-zenoh/zenoh-c.git";
          to = "VCS_TYPE path VCS_URL ${sources."zenoh_cpp_vendor/zenoh-c"}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/eclipse-zenoh/zenoh-cpp";
          to = "VCS_TYPE path VCS_URL ${sources."zenoh_cpp_vendor/zenoh-cpp"}";
        }
      ];
    };
    "zenoh_cpp_vendor/zenoh-c" = substituteSource {
      src = fetchgit {
        name = "zenoh-c-source";
        url = "https://github.com/eclipse-zenoh/zenoh-c.git";
        rev = "ffa4bddc947f7ed6c0e3b4546205dd1b73e7df81";
        hash = "sha256-6l9cjo3FMmcOI8ZdApflv2OPD9/zqPX4hTrUJlo4A58=";
      };
    };
    "zenoh_cpp_vendor/zenoh-cpp" = substituteSource {
      src = fetchgit {
        name = "zenoh-cpp-source";
        url = "https://github.com/eclipse-zenoh/zenoh-cpp";
        rev = "868fdad0e7418e8f8cb96e94c89a3aed05905e63";
        hash = "sha256-PdBErEpHdjQvYWPFldOvjhLWwBj/k/gpJrmmtsj32s0=";
      };
    };
  });
  meta = {
    description = "Vendor pkg to install zenoh-cpp";
  };
})
