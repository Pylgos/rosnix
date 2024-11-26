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
  version = "2.2.3-5";
  src = finalAttrs.passthru.sources."dynamixel_workbench";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-workbench-toolbox ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dynamixel_workbench" = substituteSource {
        src = fetchgit {
          name = "dynamixel_workbench-source";
          url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
          rev = "f24e76f99e4784119d6923e895da3e3c2770b4f8";
          hash = "sha256-iA1/c6eRcHNi0wnJhwog1K7jH1fKwsqIvSfgCZivKrc=";
        };
      };
    });
  };
  meta = {
    description = "Dynamixel-Workbench is dynamixel solution for ROS. This metapackage allows you to easily change the ID, baudrate and operating mode of the Dynamixel. Furthermore, it supports various controllers based on operating mode and Dynamixel SDK. These controllers are commanded by operators.";
  };
})
