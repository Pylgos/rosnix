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
    autoware_perception_msgs-ca4c5775fb6c55b5bb1257c38c8a53af6e2ffb0c = substituteSource {
      src = fetchgit {
        name = "autoware_perception_msgs-ca4c5775fb6c55b5bb1257c38c8a53af6e2ffb0c-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "ca4c5775fb6c55b5bb1257c38c8a53af6e2ffb0c";
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
  src = sources.autoware_perception_msgs-ca4c5775fb6c55b5bb1257c38c8a53af6e2ffb0c;
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
