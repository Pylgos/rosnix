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
  version = "2.4.2-1";
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
        rev = "e6d7fedebc7ecc212bf9b9ef88aa8e72a5f09b3f";
        hash = "sha256-IB0vXcYFrNpngh3Mw/UEQr0o9Xqce2fxjgTDciVEERM=";
      };
    };
  });
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
})
