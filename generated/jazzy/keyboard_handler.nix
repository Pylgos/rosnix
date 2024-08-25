{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    keyboard_handler = substituteSource {
      src = fetchgit {
        name = "keyboard_handler-source";
        url = "https://github.com/ros2-gbp/keyboard_handler-release.git";
        rev = "69c6f6299fa48d6a45e44fbdb040e4dc0fae1423";
        hash = "sha256-MrlcTu+x6mBfTXFBvem82OYZkmwmdCO51eLno3SvoY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "keyboard_handler";
  version = "0.3.1-2";
  src = sources.keyboard_handler;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Handler for input from keyboard";
  };
}
