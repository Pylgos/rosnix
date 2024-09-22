{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    map_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "map_msgs-source";
        owner = "ros2-gbp";
        repo = "navigation_msgs-release";
        rev = "e8b77b13c76675dc8907ea9cda406140e6ab9329";
        hash = "sha256-Q/OE5g9D3e+mCr5txkE0Ipbd1c2MmAi/5WISTZXHyd0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "map_msgs";
  version = "2.5.0-1";
  src = sources.map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav_msgs rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package defines messages commonly used in mapping packages.";
  };
}
