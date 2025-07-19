{
  ament-cmake,
  automotive-navigation-msgs,
  automotive-platform-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "automotive_autonomy_msgs";
  version = "3.0.4-6";
  src = finalAttrs.passthru.sources."automotive_autonomy_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ automotive-navigation-msgs automotive-platform-msgs ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ automotive-navigation-msgs automotive-platform-msgs ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "automotive_autonomy_msgs" = substituteSource {
      src = fetchgit {
        name = "automotive_autonomy_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "f14ea23c23dcb7064707a125367ccbb2562b30d4";
        hash = "sha256-R/GduU+VD3B9INpzOpa84Bl42xFAtGthn8PEt8iYmpw=";
      };
    };
  });
  meta = {
    description = "Messages for vehicle automation";
  };
})
