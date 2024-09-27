{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_perception_msgs-07956c1a8bd43649a234761161e53d1d49a5dc79 = substituteSource {
      src = fetchgit {
        name = "autoware_perception_msgs-07956c1a8bd43649a234761161e53d1d49a5dc79-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "07956c1a8bd43649a234761161e53d1d49a5dc79";
        hash = "sha256-xuyU9wSxb+THVuMVNB6e5X873sqw8K+veaG3XhEccRY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_perception_msgs";
  version = "1.1.0-1";
  src = sources.autoware_perception_msgs-07956c1a8bd43649a234761161e53d1d49a5dc79;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware perception messages package.";
  };
}
