{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "twist_mux_msgs" = substituteSource {
      src = fetchgit {
        name = "twist_mux_msgs-source";
        url = "https://github.com/ros2-gbp/twist_mux_msgs-release.git";
        rev = "24a68a09c840a3181fcd53dc7234f74c736733b9";
        hash = "sha256-ILOj3MizVk8mZox4k3XDTrx1z7e20vK78J+4k6OuLx8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "twist_mux_msgs";
  version = "3.0.1-2";
  src = sources."twist_mux_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The twist_mux msgs and actions package";
  };
}
