{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    cascade_lifecycle_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "cascade_lifecycle_msgs-source";
        owner = "ros2-gbp";
        repo = "cascade_lifecycle-release";
        rev = "545036c9a46bd1a542280f389d8a1e904cd219fa";
        hash = "sha256-vr1h9TdjCkXvrxYIYrmyyXpL/IO9M0hByXfdsHA2FO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cascade_lifecycle_msgs";
  version = "2.0.0-2";
  src = sources.cascade_lifecycle_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages for rclcpp_cascade_lifecycle package";
  };
}
