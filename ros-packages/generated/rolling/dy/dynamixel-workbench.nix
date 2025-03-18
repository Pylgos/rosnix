{
  ament-cmake,
  buildAmentCmakePackage,
  dynamixel-workbench-toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_workbench";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."dynamixel_workbench";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-workbench-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "a670be65fb27fab0835b747118a9b411ceee5d23";
        hash = "sha256-G32ySwBv5HwsQ0YpXWmRMRIJP1P2ZJBSbdnzGxDxW+c=";
      };
    };
  });
  meta = {
    description = "Dynamixel-Workbench is dynamixel solution for ROS. This metapackage allows you to easily change the ID, baudrate and operating mode of the Dynamixel. Furthermore, it supports various controllers based on operating mode and Dynamixel SDK. These controllers are commanded by operators.";
  };
})
