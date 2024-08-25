{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  leo_description,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_viz = substituteSource {
      src = fetchgit {
        name = "leo_viz-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "d6ad7387de6715c03425618a157a2df65b04ae8a";
        hash = "sha256-JrS6oiobEEu7mNXfAH7Ayk6hIbPY0ldoaaA3B4v78iI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_viz";
  version = "3.0.0-2";
  src = sources.leo_viz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui leo_description rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Visualization launch files and RViz configurations for Leo Rover";
  };
}
