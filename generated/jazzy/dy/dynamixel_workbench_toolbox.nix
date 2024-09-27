{
  ament_cmake,
  buildRosPackage,
  dynamixel_sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_workbench_toolbox-8cc15eb3375e6ff7c40998b8d799bb0942d979d6 = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_toolbox-8cc15eb3375e6ff7c40998b8d799bb0942d979d6-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "8cc15eb3375e6ff7c40998b8d799bb0942d979d6";
        hash = "sha256-nOIZ6YHjctUbm0SxTewtbsAXlfG10kknrKhpsVPGR5k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_workbench_toolbox";
  version = "2.2.3-5";
  src = sources.dynamixel_workbench_toolbox-8cc15eb3375e6ff7c40998b8d799bb0942d979d6;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ dynamixel_sdk rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package is composed of 'dynamixel_item', 'dynamixel_tool', 'dynamixel_driver' and 'dynamixel_workbench' class. The 'dynamixel_item' is saved as control table item and information of DYNAMIXEL. The 'dynamixel_tool' class loads its by model number of DYNAMIXEL. The 'dynamixel_driver' class includes wraped function used in DYNAMIXEL SDK. The 'dynamixel_workbench' class make simple to use DYNAMIXEL.";
  };
}
