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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "slider_publisher";
  version = "2.4.3-2";
  src = finalAttrs.passthru.sources."slider_publisher";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rqt-gui-py ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rqt-gui-py ];
  passthru.sources = mkSourceSet (sources: {
    "slider_publisher" = substituteSource {
      src = fetchgit {
        name = "slider_publisher-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "e52b48911eb643d99b02d96ed73545c6785428bf";
        hash = "sha256-w7CtCTEqvXJ4AaDRzbLl0zSuQdid/H6CfzPvl83Un/s=";
      };
    };
  });
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
})
