{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "slider_publisher";
  version = "2.3.1-2";
  src = finalAttrs.passthru.sources."slider_publisher";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-scipy" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "slider_publisher" = substituteSource {
        src = fetchgit {
          name = "slider_publisher-source";
          url = "https://github.com/ros2-gbp/slider_publisher-release.git";
          rev = "d628ed2b9a8034affc7aa6da4127bfea724f26ad";
          hash = "sha256-t3ye55W5XqkQUd/eAabhQKJUazIAi3ly0BsO7vpuHu4=";
        };
      };
    });
  };
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
})
