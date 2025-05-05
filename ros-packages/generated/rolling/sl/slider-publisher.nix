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
  version = "2.4.1-1";
  src = finalAttrs.passthru.sources."slider_publisher";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-gui-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-scipy" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "slider_publisher" = substituteSource {
      src = fetchgit {
        name = "slider_publisher-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "956dc41ab2072088e6ccd5e58537b28ab06b5662";
        hash = "sha256-OAmpbAmwD/wrae1l+xFwUsUTUe0AknpR+r707d2eYKM=";
      };
    };
  });
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
})
