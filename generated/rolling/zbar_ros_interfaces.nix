{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    zbar_ros_interfaces = substituteSource {
      src = fetchgit {
        name = "zbar_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing interfaces for zbar_ros to use to publish results";
  };
}
