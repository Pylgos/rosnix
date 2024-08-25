{
  ament_cmake_google_benchmark,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  substituteSource,
  tinyxml2_vendor,
  urdf_parser_plugin,
  urdfdom,
  urdfdom_headers,
}:
let
  sources = rec {
    urdf = substituteSource {
      src = fetchgit {
        name = "urdf-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "42777195449dde904947760cf708586706d4d955";
        hash = "sha256-Y9mBDuxuohIQEpbi59/3CjwdFjvyguV2voinSM1Vxy0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf";
  version = "2.11.0-1";
  src = sources.urdf;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib tinyxml2_vendor urdf_parser_plugin urdfdom urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_google_benchmark ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model. The code API of the parser has been through our review process and will remain backwards compatible in future releases.";
  };
}
