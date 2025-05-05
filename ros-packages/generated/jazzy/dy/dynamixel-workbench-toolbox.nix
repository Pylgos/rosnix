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
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."dynamixel_workbench_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-sdk rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench_toolbox" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_toolbox-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "9d7d56d88532a77935004d138d3c2b9c0e3fb3fb";
        hash = "sha256-KbjWZzyMJ+scoH0brGwKVmYAblYTEQGhXJsuqZQm9rc=";
      };
    };
  });
  meta = {
    description = "\n    This package is composed of 'dynamixel_item', 'dynamixel_tool', 'dynamixel_driver' and 'dynamixel_workbench' class.\n    The 'dynamixel_item' is saved as control table item and information of DYNAMIXEL.\n    The 'dynamixel_tool' class loads its by model number of DYNAMIXEL.\n    The 'dynamixel_driver' class includes wraped function used in DYNAMIXEL SDK.\n    The 'dynamixel_workbench' class make simple to use DYNAMIXEL.\n  ";
  };
})
