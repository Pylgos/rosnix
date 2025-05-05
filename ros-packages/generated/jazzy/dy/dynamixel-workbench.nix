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
  propagatedNativeBuildInputs = [ dynamixel-workbench-toolbox ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-workbench-toolbox ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "46aa3a29a186b84d05d5698ac7755bb297640c8e";
        hash = "sha256-G32ySwBv5HwsQ0YpXWmRMRIJP1P2ZJBSbdnzGxDxW+c=";
      };
    };
  });
  meta = {
    description = "\n    Dynamixel-Workbench is dynamixel solution for ROS.\n    This metapackage allows you to easily change the ID, baudrate and operating mode of the Dynamixel.\n    Furthermore, it supports various controllers based on operating mode and Dynamixel SDK.\n    These controllers are commanded by operators.\n  ";
  };
})
