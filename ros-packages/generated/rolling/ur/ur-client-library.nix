{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "ur_client_library";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."ur_client_library";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ur_client_library" = substituteSource {
      src = fetchgit {
        name = "ur_client_library-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_Client_Library-release.git";
        rev = "cec47a7b98894cdcdf82741674044c25628b09b9";
        hash = "sha256-d+tNwpGRmrWoAgriwpxl3SyhAXswRhvR4grYilZmWCY=";
      };
    };
  });
  meta = {
    description = "Standalone C++ library for accessing Universal Robots interfaces. This has been forked off the ur_robot_driver.";
  };
})
