{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  launch_yaml,
  ros2action,
  ros2cli,
  ros2component,
  ros2doctor,
  ros2interface,
  ros2launch,
  ros2lifecycle,
  ros2multicast,
  ros2node,
  ros2param,
  ros2pkg,
  ros2run,
  ros2service,
  ros2topic,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    ros2cli_common_extensions = substituteSource {
      src = fetchgit {
        name = "ros2cli_common_extensions-source";
        url = "https://github.com/ros2-gbp/ros2cli_common_extensions-release.git";
        rev = "1687ba1b3328e41ebee8c4e51255f1d728243bf0";
        hash = "sha256-b3Ru11kcJWZbAquNYaTJOX8DiTVNJAWNcV6N8QA4ykQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli_common_extensions";
  version = "0.3.0-3";
  src = sources.ros2cli_common_extensions;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_xml launch_yaml ros2action ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2topic sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Meta package for ros2cli common extensions";
  };
}
