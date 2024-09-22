{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
    autoware_localization_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "autoware_localization_msgs-source";
        owner = "ros2-gbp";
        repo = "autoware_msgs-release";
        rev = "ce12d777a3fad93b30d1504a2bdc5bdbd0f65da0";
        hash = "sha256-pQqQiBLgVz+rPRabcqtXKDN+BhpqNvBvlqLiSM4bv+w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_localization_msgs";
  version = "1.1.0-1";
  src = sources.autoware_localization_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware localization messages package.";
  };
}
