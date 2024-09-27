{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    autoware_sensing_msgs-788d2f03f7032f1acc81b4ada0cdf7c99436ae3b = substituteSource {
      src = fetchgit {
        name = "autoware_sensing_msgs-788d2f03f7032f1acc81b4ada0cdf7c99436ae3b-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "788d2f03f7032f1acc81b4ada0cdf7c99436ae3b";
        hash = "sha256-tnSGZtUUErZDyMsltqWrm00QGikUuXEXi1SxlOzRXWY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_sensing_msgs";
  version = "1.1.0-1";
  src = sources.autoware_sensing_msgs-788d2f03f7032f1acc81b4ada0cdf7c99436ae3b;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware sensing messages package.";
  };
}
