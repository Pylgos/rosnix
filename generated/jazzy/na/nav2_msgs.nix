{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  nav2_common,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav2_msgs-e28ef4988a3e225251626f8cc683f92c6d4f0d86 = substituteSource {
      src = fetchgit {
        name = "nav2_msgs-e28ef4988a3e225251626f8cc683f92c6d4f0d86-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "e28ef4988a3e225251626f8cc683f92c6d4f0d86";
        hash = "sha256-m81XNS/H/PgWqdZtzrNIbla1y/4tAKUcZVIC25phoC8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_msgs";
  version = "1.3.2-1";
  src = sources.nav2_msgs-e28ef4988a3e225251626f8cc683f92c6d4f0d86;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs builtin_interfaces geographic_msgs geometry_msgs nav2_common nav_msgs rclcpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages and service files for the Nav2 stack";
  };
}
