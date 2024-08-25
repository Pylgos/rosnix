{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    swri_console_util = substituteSource {
      src = fetchgit {
        name = "swri_console_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "a21ce415ca1c9f884e0ace562d6ffbf738ca5df7";
        hash = "sha256-KFD9ZDITUVdWMKo6Oul0LEf5o467diDWXltVYaRSLyQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_console_util";
  version = "3.6.1-3";
  src = sources.swri_console_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "swri_console_util";
  };
}
