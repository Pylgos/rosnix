{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "urdfdom_headers";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."urdfdom_headers";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_headers" = substituteSource {
      src = fetchgit {
        name = "urdfdom_headers-source";
        url = "https://github.com/ros2-gbp/urdfdom_headers-release.git";
        rev = "9a5899c9f437b0f4317759111eddc9de6543e9bd";
        hash = "sha256-K05pVi+s3x7trzQRPHLuxSMK5FRnmcPArkDsZ19BwWo=";
      };
    };
  });
  meta = {
    description = "\n    C++ headers for URDF.\n  ";
  };
})
