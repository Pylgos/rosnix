{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mocap_optitrack";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."mocap_optitrack";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mocap_optitrack" = substituteSource {
      src = fetchgit {
        name = "mocap_optitrack-source";
        url = "https://github.com/ros2-gbp/mocap_optitrack-release.git";
        rev = "a49fdd53e5673165e28bdb87646fab829b853000";
        hash = "sha256-fk3NfvBbRWBtnnmI+sh6C4WY46e2pxod/iJaWoVcRjs=";
      };
    };
  });
  meta = {
    description = "Streaming of OptiTrack mocap data to tf";
  };
})
