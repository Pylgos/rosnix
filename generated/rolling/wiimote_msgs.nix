{
  ament_cmake,
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    wiimote_msgs = substituteSource {
      src = fetchgit {
        name = "wiimote_msgs-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "ad48e8fe2bf4366d8f0ce3e6d5b5fba311fed897";
        hash = "sha256-CTizMiNOKAwVd/bOq8yB5s7j00cvCsHVQotPLLXwrhI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wiimote_msgs";
  version = "3.3.0-2";
  src = sources.wiimote_msgs;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages used by wiimote package.";
  };
}
