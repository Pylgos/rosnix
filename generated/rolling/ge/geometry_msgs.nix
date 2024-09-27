{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    geometry_msgs-026ddae2e1fc15cd04b84540bf2de87e3b81d317 = substituteSource {
      src = fetchgit {
        name = "geometry_msgs-026ddae2e1fc15cd04b84540bf2de87e3b81d317-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "026ddae2e1fc15cd04b84540bf2de87e3b81d317";
        hash = "sha256-PiZxjzoYNv5XhN29elEtWpVLAVg1n+JAq4jFiImv7nc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_msgs";
  version = "5.4.1-1";
  src = sources.geometry_msgs-026ddae2e1fc15cd04b84540bf2de87e3b81d317;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some geometry related message definitions.";
  };
}
