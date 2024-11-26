{
  ament-cmake,
  buildAmentCmakePackage,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_workbench_toolbox";
  version = "2.2.3-4";
  src = finalAttrs.passthru.sources."dynamixel_workbench_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk rclcpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "dynamixel_workbench_toolbox" = substituteSource {
        src = fetchgit {
          name = "dynamixel_workbench_toolbox-source";
          url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
          rev = "1ddc9d71d20a26328dbdf0925522fe095efff1f8";
          hash = "sha256-nOIZ6YHjctUbm0SxTewtbsAXlfG10kknrKhpsVPGR5k=";
        };
      };
    });
  };
  meta = {
    description = "This package is composed of 'dynamixel_item', 'dynamixel_tool', 'dynamixel_driver' and 'dynamixel_workbench' class. The 'dynamixel_item' is saved as control table item and information of DYNAMIXEL. The 'dynamixel_tool' class loads its by model number of DYNAMIXEL. The 'dynamixel_driver' class includes wraped function used in DYNAMIXEL SDK. The 'dynamixel_workbench' class make simple to use DYNAMIXEL.";
  };
})
