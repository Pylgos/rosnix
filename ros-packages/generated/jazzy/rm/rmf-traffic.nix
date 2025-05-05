{
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rmf_traffic";
  version = "3.3.3-1";
  src = finalAttrs.passthru.sources."rmf_traffic";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libccd-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ eigen3-cmake-module rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libccd-dev" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "788dbf8355d4db7f572c009ef58e019c668216b5";
        hash = "sha256-4ohkEyM2wji8NvyX9v0qDK8vKb5T5uCahaQc83GmKuo=";
      };
    };
  });
  meta = {
    description = "Package for managing traffic in the Robotics Middleware Framework";
  };
})
