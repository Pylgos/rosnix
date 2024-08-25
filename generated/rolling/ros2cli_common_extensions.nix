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
        rev = "21502210766d834d779da1b5d11e361d3262a735";
        hash = "sha256-JJqh2FemdwUAY4ztCaMD2FtYyJwGX84hvXiboLpZ00Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli_common_extensions";
  version = "0.4.0-1";
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
