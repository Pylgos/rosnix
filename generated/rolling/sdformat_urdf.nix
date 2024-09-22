{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rcutils,
  rosSystemPackages,
  sdformat_test_files,
  sdformat_vendor,
  substituteSource,
  tinyxml2_vendor,
  urdf,
  urdf_parser_plugin,
}:
let
  sources = rec {
    sdformat_urdf = substituteSource {
      src = fetchgit {
        name = "sdformat_urdf-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "a7a80ef621442c6ebff6bd182d225e8815a97469";
        hash = "sha256-n5Nrn5TAPvuzJhNsos1w943T3HDWOoaoUuJbyyg1T18=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_urdf";
  version = "2.0.1-1";
  src = sources.sdformat_urdf;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rcutils sdformat_vendor tinyxml2_vendor urdf urdf_parser_plugin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-headers-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common sdformat_test_files ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "URDF plugin to parse SDFormat XML into URDF C++ DOM objects.";
  };
}
