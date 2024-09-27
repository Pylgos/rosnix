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
  rcutils,
  rosSystemPackages,
  substituteSource,
  tinyxml2_vendor,
  urdf_parser_plugin,
  urdfdom,
  urdfdom_headers,
}:
let
  sources = rec {
    urdf-36871dcd5a47d953a281ba3d54d41a8d102e1acc = substituteSource {
      src = fetchgit {
        name = "urdf-36871dcd5a47d953a281ba3d54d41a8d102e1acc-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "36871dcd5a47d953a281ba3d54d41a8d102e1acc";
        hash = "sha256-SvhhpjvdwMyjmAhJdP3SrN72LZ37MKzWvRbd90D4qBI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf";
  version = "2.12.0-1";
  src = sources.urdf-36871dcd5a47d953a281ba3d54d41a8d102e1acc;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rcutils tinyxml2_vendor urdf_parser_plugin urdfdom urdfdom_headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_google_benchmark ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package contains a C++ parser for the Unified Robot Description Format (URDF), which is an XML format for representing a robot model. The code API of the parser has been through our review process and will remain backwards compatible in future releases.";
  };
}
