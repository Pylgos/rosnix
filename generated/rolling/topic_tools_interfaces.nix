{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    topic_tools_interfaces = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "0f4629262de6727110832f8de9613ca94471cf8c";
        hash = "sha256-9TKPSR2abtxNDVITE+J4rc1rAlwcR7UTk39XKk3OO6g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools_interfaces";
  version = "1.3.0-2";
  src = sources.topic_tools_interfaces;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
}
