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
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ dynamixel-sdk ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench_toolbox" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_toolbox-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "4bd799502b3a8cb3945abdd7ba184dd18a38144e";
        hash = "sha256-KbjWZzyMJ+scoH0brGwKVmYAblYTEQGhXJsuqZQm9rc=";
      };
    };
  });
  meta = {
    description = "This package is composed of 'dynamixel_item', 'dynamixel_tool', 'dynamixel_driver' and 'dynamixel_workbench' class. The 'dynamixel_item' is saved as control table item and information of DYNAMIXEL. The 'dynamixel_tool' class loads its by model number of DYNAMIXEL. The 'dynamixel_driver' class includes wraped function used in DYNAMIXEL SDK. The 'dynamixel_workbench' class make simple to use DYNAMIXEL.";
  };
})
