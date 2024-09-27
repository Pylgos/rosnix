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
    autoware_localization_msgs-9eab6e7e04ec04f6fef6a4a6c15e87baad8e8591 = substituteSource {
      src = fetchgit {
        name = "autoware_localization_msgs-9eab6e7e04ec04f6fef6a4a6c15e87baad8e8591-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "9eab6e7e04ec04f6fef6a4a6c15e87baad8e8591";
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
  src = sources.autoware_localization_msgs-9eab6e7e04ec04f6fef6a4a6c15e87baad8e8591;
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
