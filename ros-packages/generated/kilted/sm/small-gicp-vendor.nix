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
  pname = "small_gicp_vendor";
  version = "2.0.4-2";
  src = finalAttrs.passthru.sources."small_gicp_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ];
  buildInputs = [ ament-cmake ament-cmake-vendor-package ];
  passthru.sources = mkSourceSet (sources: {
    "small_gicp_vendor" = substituteSource {
      src = fetchgit {
        name = "small_gicp_vendor-source";
        url = "https://github.com/ros2-gbp/multisensor_calibration-release.git";
        rev = "09b8493c25bef06df63819382bc79022ef4f6adb";
        hash = "sha256-NxiRm+M9G1OID4YOwwQbBJHaB5KN5hZu2IIyD5espfM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL \${GITREPO}";
          to = "VCS_TYPE path VCS_URL ${sources."small_gicp_vendor/small_gicp"}";
        }
      ];
    };
    "small_gicp_vendor/small_gicp" = substituteSource {
      src = fetchgit {
        name = "small_gicp-source";
        url = "https://github.com/koide3/small_gicp.git";
        rev = "78f2e7a221720625eb95271ad9da21a04fb77f86";
        hash = "sha256-E/3OaIsSGqjnqymX2ZRxn472uVaAqcuZiXr8ravgwRc=";
      };
    };
  });
  meta = {
    description = "Vendor package for small_gicp. This is just a wrapper to provide ExternalProject build";
  };
})
