{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mvsim,
  rosSystemPackages,
  substituteSource,
  teleop_twist_keyboard,
}:
let
  sources = rec {
    mrpt_tutorials-1042b2472e59500e55ca0b4955929df637ecec08 = substituteSource {
      src = fetchgit {
        name = "mrpt_tutorials-1042b2472e59500e55ca0b4955929df637ecec08-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "1042b2472e59500e55ca0b4955929df637ecec08";
        hash = "sha256-5FYdUOEGAQz4HmwUQ+Cphg71pzL21u6scSTotQcQusk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tutorials";
  version = "2.2.0-1";
  src = sources.mrpt_tutorials-1042b2472e59500e55ca0b4955929df637ecec08;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mvsim teleop_twist_keyboard ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example files used as tutorials for MRPT ROS packages";
  };
}
