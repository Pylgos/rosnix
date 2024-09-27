{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    lifecycle_msgs-30b6f421c32024a0d90ba0d026c41a3d4214181a = substituteSource {
      src = fetchgit {
        name = "lifecycle_msgs-30b6f421c32024a0d90ba0d026c41a3d4214181a-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "30b6f421c32024a0d90ba0d026c41a3d4214181a";
        hash = "sha256-nPm3livoSK0Z2bpSS4SLfqqc0ya2k0zP9IdIfR94V1E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle_msgs";
  version = "2.0.2-2";
  src = sources.lifecycle_msgs-30b6f421c32024a0d90ba0d026c41a3d4214181a;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
}
