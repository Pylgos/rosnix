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
  version = "0.18.0-9";
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
        rev = "01aa8970b76959a9bb14540b198f52f4c4316936";
        hash = "sha256-uR93fGa2he8/x1p8bZM2xobrFhbm7cnUGAw341qYlOE=";
      };
    };
  });
  meta = {
    description = "\n    Library and Utilities for working with ifm pmd-based 3D ToF Cameras\n  ";
  };
})
