{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    zbar_ros_interfaces = substituteSource {
      src = fetchFromGitHub {
        name = "zbar_ros_interfaces-source";
        owner = "ros2-gbp";
        repo = "zbar_ros-release";
        rev = "b6f3834f9fc0e2b762ddeb051f4dbdc8ddadaa96";
        hash = "sha256-6sBmAGJ0hB7IGBjjimZbXMvWhYLLvQY03Rav/9hhxMg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zbar_ros_interfaces";
  version = "0.7.0-1";
  src = sources.zbar_ros_interfaces;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime vision_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing interfaces for zbar_ros to use to publish results";
  };
}
