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
  version = "2.4.3-1";
  src = finalAttrs.passthru.sources."slider_publisher";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-gui-py ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "slider_publisher" = substituteSource {
      src = fetchgit {
        name = "slider_publisher-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "34197cbc6923daf2502d0e9f74b127d745db913a";
        hash = "sha256-w7CtCTEqvXJ4AaDRzbLl0zSuQdid/H6CfzPvl83Un/s=";
      };
    };
  });
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
})
