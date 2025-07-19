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
  propagatedNativeBuildInputs = [ cv-bridge ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "curl" "libgoogle-glog-dev" "libpcl-all-dev" "libxmlrpc-c++" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "curl" "libgoogle-glog-dev" "libpcl-all-dev" "libxmlrpc-c++" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ifm3d_core" = substituteSource {
      src = fetchgit {
        name = "ifm3d_core-source";
        url = "https://github.com/ros2-gbp/ifm3d-release.git";
        rev = "f7d34a6057a7a6162c4bde02d47674455b718fcc";
        hash = "sha256-uR93fGa2he8/x1p8bZM2xobrFhbm7cnUGAw341qYlOE=";
      };
    };
  });
  meta = {
    description = "\n    Library and Utilities for working with ifm pmd-based 3D ToF Cameras\n  ";
  };
})
