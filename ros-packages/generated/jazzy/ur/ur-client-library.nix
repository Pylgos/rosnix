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
  version = "2.2.0-1";
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
        rev = "e7c93a145fa7cec852a555ec9153a9fc73f76ca5";
        hash = "sha256-3+QwBd++n05g+t2T5I0XOCRbro2940CrR6W5Qq6kNd8=";
      };
    };
  });
  meta = {
    description = "Standalone C++ library for accessing Universal Robots interfaces. This has been forked off the ur_robot_driver.";
  };
})
