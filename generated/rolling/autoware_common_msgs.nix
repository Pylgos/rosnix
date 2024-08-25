{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    autoware_common_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_common_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "26f428821af86bf4de7dbf5e49be473068407741";
        hash = "sha256-9HmKkjfm27Mi06V1q6+JfI9LuRj87TRy0KzuiE8XYZc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_common_msgs";
  version = "1.1.0-1";
  src = sources.autoware_common_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Autoware common messages package.";
  };
}
