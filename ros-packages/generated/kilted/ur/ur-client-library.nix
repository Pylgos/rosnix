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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."ur_client_library";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ur_client_library" = substituteSource {
      src = fetchgit {
        name = "ur_client_library-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_Client_Library-release.git";
        rev = "6f745df00f9d93bffe5220fb41d3ff184a7c7a53";
        hash = "sha256-um7cBaLP02nCd8agReZhPk5Zac/xFHw7uWFDtSa2mAs=";
      };
    };
  });
  meta = {
    description = "Standalone C++ library for accessing Universal Robots interfaces. This has been forked off the ur_robot_driver.";
  };
})
