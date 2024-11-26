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
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."ur_client_library";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ur_client_library" = substituteSource {
        src = fetchgit {
          name = "ur_client_library-source";
          url = "https://github.com/ros2-gbp/Universal_Robots_Client_Library-release.git";
          rev = "6ed72c79ed3090c4effee197825db0be8effc428";
          hash = "sha256-cYMA0Nq/AJnJegISXySx4zoeKufoZHKaJtThZNZAyH4=";
        };
      };
    });
  };
  meta = {
    description = "Standalone C++ library for accessing Universal Robots interfaces. This has been forked off the ur_robot_driver.";
  };
})
