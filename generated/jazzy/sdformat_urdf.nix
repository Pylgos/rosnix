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
        rev = "d923456c7a3c40a1cf8b8c32e52f9838c95ddfde";
        hash = "sha256-QJfr03O+ead4T8Bj6BazQbRKJsmW3J6I9g1XWtun6Us=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_urdf";
  version = "1.0.2-1";
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
