{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raspimouse-fake,
  raspimouse-gazebo,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_sim";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."raspimouse_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ raspimouse-fake raspimouse-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raspimouse-fake raspimouse-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_sim" = substituteSource {
      src = fetchgit {
        name = "raspimouse_sim-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "ee72984e39d6937aebc83f18e1acd5472014e271";
        hash = "sha256-h6MKdy23585MeDzlj/VepYMte2fNBsICUT4rlcBy0MU=";
      };
    };
  });
  meta = {
    description = "ROS 2 package suite for Raspberry Pi Mouse Simulator";
  };
})
