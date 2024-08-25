{
  ament_cmake,
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
    motion_capture_tracking_interfaces = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking_interfaces-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "a9b72a5a549beb50b53da5959a19bc658d535966";
        hash = "sha256-ho+25GyuWOKXqZqIp74ZO8leEndRFRqfn74DBKWKZWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "motion_capture_tracking_interfaces";
  version = "1.0.3-2";
  src = sources.motion_capture_tracking_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interfaces for motion_capture_tracking package.";
  };
}
