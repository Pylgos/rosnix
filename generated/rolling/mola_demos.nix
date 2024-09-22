{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_demos = substituteSource {
      src = fetchgit {
        name = "mola_demos-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "6f15491cc5287c526211e60385f799e6f99047ac";
        hash = "sha256-NCpf7IiX6pEI975hsaMhNTkH23ERu6wlcy+g7+6/ark=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_demos";
  version = "1.2.0-1";
  src = sources.mola_demos;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demo and example launch files for MOLA";
  };
}
