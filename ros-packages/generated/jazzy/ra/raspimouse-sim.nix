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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ raspimouse-fake raspimouse-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_sim" = substituteSource {
      src = fetchgit {
        name = "raspimouse_sim-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "963c3558df2a42f140839c7f8bf353fb00dc1c6b";
        hash = "sha256-hfw1zlmDF3HMCPCjqqKeN/NmojMmnuh+geBPUyKn91A=";
      };
    };
  });
  meta = {
    description = "ROS 2 package suite for Raspberry Pi Mouse Simulator";
  };
})
