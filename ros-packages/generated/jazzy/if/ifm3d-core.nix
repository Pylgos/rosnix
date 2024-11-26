{
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ifm3d_core";
  version = "0.18.0-10";
  src = finalAttrs.passthru.sources."ifm3d_core";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  propagatedBuildInputs = [ cv-bridge ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libgoogle-glog-dev" "libpcl-all-dev" "libxmlrpc-c++" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ifm3d_core" = substituteSource {
        src = fetchgit {
          name = "ifm3d_core-source";
          url = "https://github.com/ros2-gbp/ifm3d-release.git";
          rev = "a24997b1557ad4919fe504bf6ac3580cac5f6e46";
          hash = "sha256-uR93fGa2he8/x1p8bZM2xobrFhbm7cnUGAw341qYlOE=";
        };
      };
    });
  };
  meta = {
    description = "Library and Utilities for working with ifm pmd-based 3D ToF Cameras";
  };
})
